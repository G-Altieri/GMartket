package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.data.dao.UtenteDAO;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.UtenteImpl;
import it.univaq.gmarket.data.model.impl.proxy.UtenteProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO_SQL extends DAO implements UtenteDAO {

    private PreparedStatement sUserByID, sUserByEmail, sNome, sCognome, iUser, uUser;

    public UtenteDAO_SQL(DataLayer data) {
        super(data);
    }

    @Override
    public void init() throws DataException {
        try {
            super.init();

            //precompiliamo tutte le query utilizzate nella classe
            //precompile all the queries uses in this class
            sUserByID = connection.prepareStatement("SELECT * FROM utente WHERE ID = ?");
            sUserByEmail = connection.prepareStatement("SELECT ID FROM utente WHERE email = ?");
            sNome = connection.prepareStatement("SELECT ID FROM utente WHERE nome = ?");
            sCognome = connection.prepareStatement("SELECT ID FROM utente WHERE cognome = ?");
            iUser = connection.prepareStatement("INSERT INTO utente (email,password, ruolo, nome, cognome) VALUES(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            uUser = connection.prepareStatement("UPDATE utente SET email=?,password=?, ruolo=?, nome=?, cognome=?, version=? WHERE ID=? AND version=?");
        } catch (SQLException ex) {
            throw new DataException("Error initializing newspaper data layer", ex);
        }
    }
    @Override
    public Utente createUtente() {
        return new UtenteProxy(getDataLayer());
    }

    private UtenteProxy createUtente(ResultSet rs) throws DataException {
        try {
            UtenteProxy utenteProxy = (UtenteProxy) createUtente();
            utenteProxy.setKey(rs.getInt("id"));
            utenteProxy.setNome(rs.getString("nome"));
            utenteProxy.setCognome(rs.getString("cognome"));
            utenteProxy.setEmail(rs.getString("email"));
            utenteProxy.setPassword(rs.getString("password"));
            utenteProxy.setRuolo(Ruolo.valueOf(rs.getString("ruolo")));
            utenteProxy.setVersion(rs.getLong("version"));
            return utenteProxy;
        } catch (SQLException ex) {
            throw new DataException("Unable to create user object form ResultSet", ex);
        }
    }


    @Override
    public Utente getUtente(int user_key) throws DataException {
        Utente utente = null;
        //prima vediamo se l'oggetto è già stato caricato
        //first look for this object in the cache
        if (dataLayer.getCache().has(Utente.class, user_key)) {
            utente = dataLayer.getCache().get(Utente.class, user_key);
        } else {
            //altrimenti lo carichiamo dal database
            //otherwise load it from database
            try {
                sUserByID.setInt(1, user_key);
                try ( ResultSet rs = sUserByID.executeQuery()) {
                    if (rs.next()) {
                        //notare come utilizziamo il costrutture
                        //"helper" della classe AuthorImpl
                        //per creare rapidamente un'istanza a
                        //partire dal record corrente
                        //note how we use here the helper constructor
                        //of the AuthorImpl class to quickly
                        //create an instance from the current record

                        utente = createUtente(rs);
                        //e lo mettiamo anche nella cache
                        //and put it also in the cache
                        dataLayer.getCache().add(Utente.class, utente);
                    }
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to load user by ID", ex);
            }
        }
        return utente;
    }

    @Override
    public Utente getUtenteByEmail(String email) throws DataException {

        try {
            sUserByEmail.setString(1, email);
            try ( ResultSet rs = sUserByEmail.executeQuery()) {
                if (rs.next()) {
                    return getUtente(rs.getInt("id"));
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to find user", ex);
        }
        return null;
    }

    @Override
    public void storeUtente(Utente user) throws DataException {
        try {
            if (user.getKey() != null && user.getKey() > 0) { //update
                //non facciamo nulla se l'oggetto è un proxy e indica di non aver subito modifiche
                //do not store the object if it is a proxy and does not indicate any modification
                if (user instanceof UtenteProxy && !((UtenteProxy) user).isModified()) {
                    return;
                }
                uUser.setString(1, user.getEmail());
                uUser.setString(2, user.getPassword());
                uUser.setString(3, user.getRuolo().name());
                uUser.setString(4, user.getNome());
                uUser.setString(5, user.getCognome());
                long oldVersion = user.getVersion();
                long versione = oldVersion + 1;
                uUser.setLong(6, versione);
                uUser.setInt(7, user.getKey());
                uUser.setLong(8, oldVersion);
                if(uUser.executeUpdate() == 0){
                    throw new OptimisticLockException(user);
                }else {
                    user.setVersion(versione);
                }

            } else { //insert
                iUser.setString(1, user.getEmail());
                iUser.setString(2, user.getPassword());
                iUser.setString(3, user.getRuolo().name());
                iUser.setString(4, user.getNome());
                iUser.setString(5, user.getCognome());


                if (iUser.executeUpdate() == 1) {
                    //per leggere la chiave generata dal database
                    //per il record appena inserito, usiamo il metodo
                    //getGeneratedKeys sullo statement.
                    //to read the generated record key from the database
                    //we use the getGeneratedKeys method on the same statement
                    try ( ResultSet keys = iUser.getGeneratedKeys()) {
                        //il valore restituito è un ResultSet con un record
                        //per ciascuna chiave generata (uno solo nel nostro caso)
                        //the returned value is a ResultSet with a distinct record for
                        //each generated key (only one in our case)
                        if (keys.next()) {
                            //i campi del record sono le componenti della chiave
                            //(nel nostro caso, un solo intero)
                            //the record fields are the key componenets
                            //(a single integer in our case)
                            int key = keys.getInt(1);
                            //aggiornaimo la chiave in caso di inserimento
                            //after an insert, uopdate the object key
                            user.setKey(key);
                            //inseriamo il nuovo oggetto nella cache
                            //add the new object to the cache
                            dataLayer.getCache().add(Utente.class, user);
                        }
                    }
                }
            }

            if (user instanceof DataItemProxy) {
                ((DataItemProxy) user).setModified(false);
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store user", ex);
        }
    }


    public List<Utente> getAllUtenti() throws DataException {
        List<Utente> utenti = new ArrayList<>();

        try (Connection con = this.getConnection()) {
            String query = "SELECT * FROM utente";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Utente utente = new UtenteImpl();
                        utente.setId(rs.getInt("id"));
                        utente.setNome(rs.getString("nome"));
                        utente.setCognome(rs.getString("cognome"));
                        utente.setEmail(rs.getString("email"));
                        utente.setRuolo(Ruolo.valueOf(rs.getString("ruolo").toUpperCase()));
                        utenti.add(utente);
                    }
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Errore nel recupero degli utenti", ex);
        }

        return utenti;
    }
}
