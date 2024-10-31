package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.proxy.NotificaProxy;
import it.univaq.gmarket.framework.data.DAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class NotificaDAO_SQL extends DAO implements NotificaDAO {

    private PreparedStatement sNotificaById;
    private PreparedStatement sNotifiche;
    private PreparedStatement sNotificheTecRichiesteLibere;
    private PreparedStatement sNotificheUserMyRichieste;
    private PreparedStatement sNotificheUserMyRichiesteProposte;
    private PreparedStatement sNotificheUserMyOrdini;
    private PreparedStatement sNotificheTecAllOrdini;
    private PreparedStatement sNotificheUserAll;
    private PreparedStatement sNotificheUserNonLette;
    private PreparedStatement iNotifica;
    private PreparedStatement uNotifica;
    private PreparedStatement dNotifica;

    /**
     * Costruttore della classe.
     *
     * @param d il DataLayer da utilizzare
     */
    public NotificaDAO_SQL(DataLayer d) {
        super(d);
    }

    /**
     * Inizializza le PreparedStatement.
     *
     * @throws DataException se si verifica un errore durante l'inizializzazione
     */
    @Override
    public void init() throws DataException {
        try {
            super.init();
            System.out.println("init");
            sNotificaById = connection.prepareStatement("SELECT * FROM notifica WHERE id=?");
            sNotifiche = connection.prepareStatement("SELECT * FROM notifica");
            iNotifica = connection.prepareStatement("INSERT INTO notifica (titolo, contenuto, letta, id_utente, ruolo, richiesta, proposta, ordine) VALUES (?, ?, ?, ?, ?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
            uNotifica = connection.prepareStatement("UPDATE notifica SET titolo = ?, contenuto = ?, letta = ?, id_utente = ?, ruolo = ?,richiesta = ?,proposta = ?,ordine = ? WHERE id = ?");
            dNotifica = connection.prepareStatement("DELETE FROM notifica WHERE id = ?");
            sNotificheTecRichiesteLibere = connection.prepareStatement("SELECT * FROM notifica WHERE ruolo = 'TECNICO' AND letta = false AND richiesta IS NOT NULL AND proposta IS NULL AND ordine IS NULL");
            sNotificheTecAllOrdini = connection.prepareStatement("SELECT * FROM notifica WHERE ruolo = 'TECNICO' AND letta = false AND richiesta IS NOT NULL AND proposta IS NOT NULL AND ordine IS NOT NULL");
            sNotificheUserMyRichieste = connection.prepareStatement("SELECT * FROM notifica WHERE id_utente = ? AND letta = false AND richiesta IS NOT NULL");
            sNotificheUserMyRichiesteProposte = connection.prepareStatement("SELECT * FROM notifica WHERE id_utente = ? AND letta = false AND richiesta IS NOT NULL AND proposta IS NOT NULL");
            sNotificheUserMyOrdini = connection.prepareStatement("SELECT * FROM notifica WHERE id_utente = ? AND letta = false AND richiesta IS NOT NULL AND proposta IS NOT NULL AND ordine IS NOT NULL");
            sNotificheUserAll = connection.prepareStatement("SELECT * FROM notifica WHERE id_utente = ? ");
            sNotificheUserNonLette = connection.prepareStatement("SELECT * FROM notifica WHERE id_utente = ? AND letta = false");
        } catch (SQLException e) {
            throw new DataException("Error initializing gmarket data layer", e);
        }
    }

    /**
     * Chiude le PreparedStatement.
     *
     * @throws DataException se si verifica un errore durante la chiusura
     */
    @Override
    public void destroy() throws DataException {
        try {
            System.out.println("destroy");
            sNotificaById.close();
            sNotifiche.close();
            iNotifica.close();
            uNotifica.close();
            dNotifica.close();
            sNotificheTecAllOrdini.close();
            sNotificheUserMyOrdini.close();
            sNotificheUserMyRichieste.close();
            sNotificheUserMyRichiesteProposte.close();
            sNotificheTecRichiesteLibere.close();
            sNotificheUserAll.close();
            sNotificheUserNonLette.close();
        } catch (SQLException ex) {
            throw new DataException("Can't destroy prepared statements", ex);
        }
        System.out.println("destro2y");
        super.destroy();
    }

    /**
     * Crea una nuova istanza di Notifica.
     *
     * @return una nuova istanza di NotificaProxy
     */
    @Override
    public Notifica createNotifica() {
        return new NotificaProxy(getDataLayer());
    }

    /**
     * Crea una NotificaProxy a partire da un ResultSet.
     *
     * @param rs il ResultSet da cui creare la NotificaProxy
     * @return una nuova istanza di NotificaProxy
     * @throws DataException se si verifica un errore durante la creazione
     */
    private Notifica createNotifica(ResultSet rs) throws DataException {
        try {
            NotificaProxy notifica = (NotificaProxy) createNotifica();
            notifica.setKey(rs.getInt("id"));
            notifica.setTitolo(rs.getString("titolo"));
            notifica.setContenuto(rs.getString("contenuto"));
            notifica.setLetta(rs.getBoolean("letta"));

            int utenteId = rs.getInt("id_utente");
            Utente utente = ((AppDataLayer) getDataLayer()).getUtenteDAO().getUtente(utenteId);
            notifica.setUtente(utente);

            if (rs.getString("ruolo") != null)
                notifica.setRuolo(Ruolo.valueOf(rs.getString("ruolo")));


            int richiestaId = rs.getInt("richiesta");

            Richiesta richiesta = ((AppDataLayer) getDataLayer()).getRichiestaDAO().getRichiesta(richiestaId);
            notifica.setRichiesta(richiesta);

            int propostaId = rs.getInt("proposta");
            Proposta proposta = ((AppDataLayer) getDataLayer()).getPropostaDAO().getProposta(propostaId);
            notifica.setProposta(proposta);

            int ordineId = rs.getInt("ordine");
            Proposta ordine = ((AppDataLayer) getDataLayer()).getPropostaDAO().getProposta(ordineId);
            notifica.setOrdine(ordine);

            return notifica;
        } catch (SQLException ex) {
            throw new DataException("Unable to create Notifica from ResultSet", ex);
        }
    }

    /**
     * Recupera una notifica dato il suo ID.
     *
     * @param notificaId l'ID della notifica
     * @return la notifica corrispondente all'ID
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public Notifica getNotifica(int notificaId) throws DataException {
        Notifica notifica = null;
        if (dataLayer.getCache().has(Notifica.class, notificaId)) {
            notifica = dataLayer.getCache().get(Notifica.class, notificaId);
        } else {
            try {
                sNotificaById.setInt(1, notificaId);
                try (ResultSet rs = sNotificaById.executeQuery()) {
                    if (rs.next()) {
                        notifica = createNotifica(rs);
                        dataLayer.getCache().add(Notifica.class, notifica);
                    }
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to load Notifica by ID", ex);
            }
        }
        return notifica;
    }

    /**
     * Recupera tutte le notifiche.
     *
     * @return una lista di tutte le notifiche
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public List<Notifica> getAllNotifiche() throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            try (ResultSet rs = sNotifiche.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }
            return result;
        } catch (SQLException ex) {
            throw new DataException("Error loading all notifications", ex);
        }
    }

    /**
     * Salva una notifica nel database.
     *
     * @param notifica la notifica da salvare
     * @throws DataException se si verifica un errore durante il salvataggio
     */
    @Override
    public void storeNotifica(Notifica notifica) throws DataException {
        try {
            if (notifica.getKey() != null && notifica.getKey() > 0) {
                uNotifica.setString(1, notifica.getTitolo());
                uNotifica.setString(2, notifica.getContenuto());
                uNotifica.setBoolean(3, notifica.getLetta());
                if (notifica.getUtente() != null) {
                    uNotifica.setInt(4, notifica.getUtente().getKey());
                } else {
                    uNotifica.setNull(4, Types.NULL);
                }
                if (notifica.getRuolo() != null) {
                    uNotifica.setString(5, notifica.getRuolo().toString());
                } else {
                    uNotifica.setNull(5, Types.NULL);
                }

                if (notifica.getRichiesta() != null) {
                    uNotifica.setInt(6, notifica.getRichiesta().getKey());
                } else {
                    uNotifica.setNull(6, java.sql.Types.INTEGER);
                }

                if (notifica.getProposta() != null) {
                    uNotifica.setInt(7, notifica.getProposta().getKey());
                } else {
                    uNotifica.setNull(7, java.sql.Types.INTEGER);
                }

                if (notifica.getOrdine() != null) {
                    uNotifica.setInt(8, notifica.getOrdine().getKey());
                } else {
                    uNotifica.setNull(8, java.sql.Types.INTEGER);
                }

                uNotifica.setInt(9, notifica.getKey());
                uNotifica.executeUpdate();
            } else {
                iNotifica.setString(1, notifica.getTitolo());
                iNotifica.setString(2, notifica.getContenuto());
                iNotifica.setBoolean(3, notifica.getLetta());
                if (notifica.getUtente() != null) {
                    iNotifica.setInt(4, notifica.getUtente().getKey());
                } else {
                    iNotifica.setNull(4, Types.NULL);
                }
                if (notifica.getRuolo() != null) {
                    iNotifica.setString(5, notifica.getRuolo().toString());
                } else {
                    iNotifica.setNull(5, Types.NULL);
                }


                if (notifica.getRichiesta() != null) {
                    iNotifica.setInt(6, notifica.getRichiesta().getKey());
                } else {
                    iNotifica.setNull(6, java.sql.Types.INTEGER);
                }

                if (notifica.getProposta() != null) {
                    iNotifica.setInt(7, notifica.getProposta().getKey());
                } else {
                    iNotifica.setNull(7, java.sql.Types.INTEGER);
                }

                if (notifica.getOrdine() != null) {
                    iNotifica.setInt(8, notifica.getOrdine().getKey());
                } else {
                    iNotifica.setNull(8, java.sql.Types.INTEGER);
                }

                if (iNotifica.executeUpdate() == 1) {
                    try (ResultSet keys = iNotifica.getGeneratedKeys()) {
                        if (keys.next()) {
                            notifica.setKey(keys.getInt(1));
                            dataLayer.getCache().add(Notifica.class, notifica);
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store Notifica", ex);
        }
    }

    /**
     * Elimina una notifica dal database.
     *
     * @param notifica la notifica da eliminare
     * @throws DataException se si verifica un errore durante l'eliminazione
     */
    @Override
    public void deleteNotifica(Notifica notifica) throws DataException {
        try {
            dataLayer.getCache().delete(Notifica.class, notifica);
            dNotifica.setInt(1, notifica.getKey());
            dNotifica.executeUpdate();
        } catch (SQLException ex) {
            throw new DataException("Unable to delete Notifica", ex);
        }
    }

    @Override
    public List<Notifica> getNotificheTecnicoListaRichiesteLibere() throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            try (ResultSet rs = sNotificheTecRichiesteLibere.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }
            return result;
        } catch (SQLException ex) {
            throw new DataException("Unable to delete Notifica", ex);
        }
    }

    @Override
    public List<Notifica> getNotificheTecAllOrdini() throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            try (ResultSet rs = sNotificheTecAllOrdini.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }
            return result;
        } catch (SQLException ex) {
            throw new DataException("Unable to delete Notifica", ex);
        }
    }

    @Override
    public List<Notifica> getNotificheUserMyRichieste(int utenteId) throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            sNotificheUserMyRichieste.setInt(1, utenteId);
            try (ResultSet rs = sNotificheUserMyRichieste.executeQuery()) {
                while (rs.next()) {

                    result.add(getNotifica(rs.getInt("id")));
                }
            }
            return result;
        } catch (SQLException ex) {
            throw new DataException("Unable to getNotificheUserMyRichieste Notifica", ex);
        }
    }

    @Override
    public List<Notifica> getNotificheUserMyRichiesteProposte(int utenteId) throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            sNotificheUserMyRichiesteProposte.setInt(1, utenteId);
            try (ResultSet rs = sNotificheUserMyRichiesteProposte.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to getNotificheUserMyRichiesteProposte Notifica", ex);
        }
        return result;
    }

    @Override
    public List<Notifica> getNotificheUserMyOrdini(int utenteId) throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            sNotificheUserMyOrdini.setInt(1, utenteId);
            try (ResultSet rs = sNotificheUserMyOrdini.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to getNotificheUserMyOrdini Notifica", ex);
        }
        return result;
    }

    @Override
    public List<Notifica> getNotificheNonLetteUser(int utenteId) throws DataException {
        List<Notifica> result = new ArrayList<>();
        System.out.println("asd");
        System.out.println(utenteId);
        System.out.println("sNotificheUserNonLette");
        System.out.println(sNotificheUserNonLette);
        try {
            sNotificheUserNonLette.setInt(1, utenteId);
            System.out.println(sNotificheUserNonLette);
            try (ResultSet rs = sNotificheUserNonLette.executeQuery()) {
                while (rs.next()) {
                    System.out.println("ca iasdpa");
                    result.add(getNotifica(rs.getInt("id")));
                }
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to sNotificheUserNonLette Notifica", ex);
        }
        return result;
    }

    @Override
    public List<Notifica> getNotificheAllUser(int utenteId) throws DataException {
        List<Notifica> result = new ArrayList<>();
        try {
            sNotificheUserAll.setInt(1, utenteId);
            try (ResultSet rs = sNotificheUserAll.executeQuery()) {
                while (rs.next()) {
                    result.add(getNotifica(rs.getInt("id")));
                }
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to getNotificheUserMyOrdini Notifica", ex);
        }
        return result;
    }
}
