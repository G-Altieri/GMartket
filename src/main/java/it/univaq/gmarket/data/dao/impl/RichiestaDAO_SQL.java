package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.RichiestaImpl;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.data.model.impl.UtenteImpl;
import it.univaq.gmarket.data.model.impl.proxy.RichiestaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RichiestaDAO_SQL extends DAO implements RichiestaDAO {

        private PreparedStatement sRichiestaByID, sRichiesteByOrdinante, sRichiesteByTecnico, uRichiesta, iRichiesta;

        public RichiestaDAO_SQL(AppDataLayer data) {
            super(data);
        }


        @Override
        public void init() throws DataException {
            try {
                super.init();

                sRichiestaByID = connection.prepareStatement("SELECT * FROM richiesta WHERE ID = ?");
                sRichiesteByOrdinante = connection.prepareStatement("SELECT * FROM richiesta WHERE id_ordinante = ? ORDER BY data DESC");
                sRichiesteByTecnico = connection.prepareStatement("SELECT * FROM richiesta WHERE id_tecnico = ? ORDER BY data DESC");
            } catch (SQLException ex) {
                throw new DataException("Error initializing RichiestaOrdine data layer", ex);
            }
        }


        @Override
        public void destroy() throws DataException {
            try {
                sRichiestaByID.close();
                sRichiesteByOrdinante.close();
                sRichiesteByTecnico.close();
            } catch (SQLException ex) {

            }
            super.destroy();
        }

        /**
         * Crea una nuova istanza di RichiestaOrdine.
         *
         * @return una nuova istanza di RichiestaOrdineProxy
         */
        @Override
        public Richiesta createRichiesta() {
            return new RichiestaProxy(getDataLayer());
        }



        private RichiestaProxy createRichiesta(ResultSet rs) throws DataException {
            try {
                RichiestaProxy richiesta = (RichiestaProxy) createRichiesta();
                richiesta.setKey(rs.getInt("id"));
                richiesta.setNote(rs.getString("note"));
                richiesta.setStato(StatoRichiesta.valueOf(rs.getString("stato")));
                richiesta.setCreated_at(rs.getDate("created_at"));
                richiesta.setUpdate_at(rs.getDate("update_at"));
                richiesta.setCodice(rs.getString("codice"));
                richiesta.setVersion(rs.getLong("version"));

                int tecnicoId = rs.getInt("id_tecnico");
                Utente tecnico = ((AppDataLayer) getDataLayer()).getUtenteDAO().getUtente(tecnicoId);
                richiesta.setTecnico(tecnico);

                int categoriaId = rs.getInt("id_categoria");
                Categoria categoria = ((AppDataLayer) getDataLayer()).getCategoriaDAO().getCategoria(categoriaId);
                richiesta.setCategoria(categoria);

                int ordinanteId = rs.getInt("id_ordinante");
                Utente ordinante = ((AppDataLayer) getDataLayer()).getUtenteDAO().getUtente(ordinanteId);
                richiesta.setOrdinante(ordinante);

                return richiesta;
            } catch (SQLException ex) {
                throw new DataException("Unable to create RichiestaOrdine object from ResultSet", ex);
            }
        }



        /**
         * Recupera una richiesta dato il suo ID.
         *
         * @param richiesta_key l'ID della richiesta
         * @return la richiesta corrispondente all'ID
         * @throws DataException se si verifica un errore durante il recupero
         */
        @Override
        public Richiesta getRichiesta(int richiesta_key) throws DataException {
            Richiesta richiesta = null;
            if (dataLayer.getCache().has(Richiesta.class, richiesta_key)) {
                richiesta = dataLayer.getCache().get(Richiesta.class, richiesta_key);
            } else {
                try {
                    sRichiestaByID.setInt(1, richiesta_key);
                    try (ResultSet rs = sRichiestaByID.executeQuery()) {
                        if (rs.next()) {
                            richiesta = createRichiesta(rs);
                            dataLayer.getCache().add(Richiesta.class, richiesta);
                        }
                    }
                } catch (SQLException ex) {
                    throw new DataException("Unable to load Richiesta by ID", ex);
                }
            }
            return richiesta;
        }



        /**
         * Memorizza una richiesta nel database.
         *
         * @param richiesta la richiesta da memorizzare
         * @throws DataException se si verifica un errore durante la memorizzazione
         */
        @Override
        public void storeRichiesta(Richiesta richiesta) throws DataException {
            try {
                if (richiesta.getKey() != null & richiesta.getKey() > 0) {
                    if (richiesta instanceof RichiestaProxy && !((RichiestaProxy) richiesta).isModified()) {
                        return;
                    }
                    uRichiesta.setString(1, richiesta.getNote());
                    uRichiesta.setString(2, richiesta.getStato().name());
                    uRichiesta.setDate(3, new java.sql.Date(richiesta.getCreated_at().getTime()));
                    uRichiesta.setDate(4, new java.sql.Date(richiesta.getUpdate_at().getTime()));
                    uRichiesta.setString(5, richiesta.getCodice());
                    uRichiesta.setInt(6, richiesta.getTecnico().getKey());
                    uRichiesta.setInt(7, richiesta.getOrdinante().getKey());
                    uRichiesta.setInt(8, richiesta.getCategoria().getKey());
                    long oldVersion = richiesta.getVersion();
                    long versione = oldVersion + 1;
                    uRichiesta.setLong(9, versione);
                    uRichiesta.setInt(10, richiesta.getKey());
                    uRichiesta.setLong(11, oldVersion);
                    if(uRichiesta.executeUpdate() == 0){
                        throw new OptimisticLockException(richiesta);
                    }else {
                        richiesta.setVersion(versione);
                    }
                } else {
                    iRichiesta.setString(1, richiesta.getNote());
                    iRichiesta.setString(2, richiesta.getStato().name());
                    iRichiesta.setDate(3, new java.sql.Date(richiesta.getCreated_at().getTime()));
                    iRichiesta.setDate(4, new java.sql.Date(richiesta.getUpdate_at().getTime()));
                    iRichiesta.setString(5, richiesta.getCodice());
                    iRichiesta.setInt(6, richiesta.getTecnico().getKey());
                    iRichiesta.setInt(7, richiesta.getOrdinante().getKey());
                    iRichiesta.setInt(8, richiesta.getCategoria().getKey());


                    if (iRichiesta.executeUpdate() == 1) {
                        try (ResultSet keys = iRichiesta.getGeneratedKeys()) {
                            if (keys.next()) {
                                int key = keys.getInt(1);
                                richiesta.setKey(key);
                                dataLayer.getCache().add(Richiesta.class, richiesta);
                            }
                        }
                    }
                }
                if (richiesta instanceof DataItemProxy) {
                    ((DataItemProxy) richiesta).setModified(false);
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to store Richiesta", ex);
            }
        }


        /**
         * Elimina una richiesta dal database.
         *
         * @param richiesta_key l'ID della richiesta da eliminare
         * @throws DataException se si verifica un errore durante l'eliminazione
         */
        @Override
        public void deleteRichiesta(int richiesta_key) throws DataException {
            try {
                PreparedStatement dRichiesta = connection.prepareStatement("DELETE FROM richiesta WHERE ID=?");
                dRichiesta.setInt(1, richiesta_key);
                dRichiesta.executeUpdate();
                dataLayer.getCache().delete(Richiesta.class, richiesta_key);
                dRichiesta.close();
            } catch (SQLException ex) {
                throw new DataException("Unable to delete Richiesta", ex);
            }
        }

    @Override
    public List<Richiesta> getAllRichieste() throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try (Connection con = this.getConnection()) {
            String query = "SELECT * FROM richiesta";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        richieste.add(getRichiesta(rs.getInt("id")));
                    }
                } catch (DataException e) {
                    throw new RuntimeException(e);
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Errore nel recupero degli utenti", ex);
        }
        return richieste;
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
