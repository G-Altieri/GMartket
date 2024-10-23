package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.StatoOrdine;
import it.univaq.gmarket.data.model.impl.StatoProposta;
import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.data.model.impl.proxy.PropostaProxy;
import it.univaq.gmarket.data.model.impl.proxy.RichiestaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PropostaDAO_SQL extends DAO implements PropostaDAO {

    private PreparedStatement iProposta, sProposteByRichiesta, uProposta, sPropostaByID;

    public PropostaDAO_SQL(DataLayer d) {
        super(d);
    }

    @Override
    public void init() throws DataException {
        try {
            super.init();
            sProposteByRichiesta = connection.prepareStatement("SELECT * FROM proposta WHERE id_richiesta = ? ORDER BY created_at DESC");
            sPropostaByID = connection.prepareStatement("SELECT * FROM proposta WHERE id = ?");

            iProposta = connection.prepareStatement("INSERT INTO proposta (codice_proposta, id_richiesta, nome_produttore, nome_prodotto, prezzo, link, note, stato, motivazione, created_at,  stato_ordine, data_ordine, version) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            uProposta = connection.prepareStatement("UPDATE proposta SET codice_proposta = ?, nome_produttore = ?, nome_prodotto = ?, prezzo = ?, link = ?, note = ?, stato = ?, motivazione = ?,  stato_ordine = ?, data_ordine = ?, version = ? WHERE id = ?");
        } catch (SQLException ex) {
            throw new DataException("Error initializing RichiestaOrdine data layer", ex);
        }
    }

    @Override
    public void destroy() throws DataException {
        try {
            sProposteByRichiesta.close();
            iProposta.close();
            sPropostaByID.close();
            uProposta.close();
        } catch (SQLException ex) {

        }
        super.destroy();
    }

    @Override
    public Proposta createProposta() {
        return new PropostaProxy(getDataLayer());
    }

    private PropostaProxy createProposta(ResultSet rs) throws DataException {
        try {
            PropostaProxy proposta = (PropostaProxy) createProposta();
            proposta.setKey(rs.getInt("id"));
            proposta.setCodiceProposta(rs.getString("codice_proposta"));
            proposta.setNomeProduttore(rs.getString("nome_produttore"));
            proposta.setNomeProdotto(rs.getString("nome_prodotto"));
            proposta.setPrezzo(rs.getDouble("prezzo"));
            proposta.setLink(rs.getString("link"));
            proposta.setNote(rs.getString("note"));
            proposta.setStatoProposta(StatoProposta.valueOf(rs.getString("stato")));
            proposta.setMotivazione(rs.getString("motivazione"));
            proposta.setCreated_at(rs.getTimestamp("created_at"));
            proposta.setUpdate_at(rs.getTimestamp("update_at"));

            if (rs.getString("stato_ordine") == null)
                proposta.setStatoOrdine(null);
            else
                proposta.setStatoOrdine(StatoOrdine.valueOf(rs.getString("stato_ordine")));

            proposta.setDataOrdine(rs.getTimestamp("data_ordine"));
            proposta.setVersion(rs.getLong("version"));

            // Collegamento con altre entità, come Richiesta
            int richiestaId = rs.getInt("id_richiesta");
            Richiesta richiesta = ((AppDataLayer) getDataLayer()).getRichiestaDAO().getRichiesta(richiestaId);
            proposta.setRichiesta(richiesta);

            return proposta;
        } catch (SQLException ex) {
            throw new DataException("Unable to create Proposta object from ResultSet", ex);
        }
    }


    /**
     * Recupera una proposta dato il suo ID.
     *
     * @param proposta_key l'ID della proposta
     * @return la proposta corrispondente all'ID
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public Proposta getProposta(int proposta_key) throws DataException {
        Proposta proposta = null;

        // Verifica se la proposta è già presente nella cache
        if (dataLayer.getCache().has(Proposta.class, proposta_key)) {
            proposta = dataLayer.getCache().get(Proposta.class, proposta_key);
        } else {
            try {
                // Prepara la query per selezionare la proposta per ID
                sPropostaByID.setInt(1, proposta_key);

                // Esegue la query
                try (ResultSet rs = sPropostaByID.executeQuery()) {
                    if (rs.next()) {
                        // Crea la proposta a partire dal ResultSet
                        proposta = createProposta(rs);

                        // Aggiunge la proposta alla cache
                        dataLayer.getCache().add(Proposta.class, proposta);
                    }
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to load Proposta by ID", ex);
            }
        }

        return proposta;
    }

    @Override
    public void storeProposta(Proposta proposta) throws DataException {
        try {
            if (proposta.getKey() != null && proposta.getKey() > 0) { // Se la proposta esiste già (update)
                if (proposta instanceof PropostaProxy && !((PropostaProxy) proposta).isModified()) {
                    return; // Se la proposta non è stata modificata, non fare nulla
                }

                // Aggiorna la proposta
                uProposta.setString(1, proposta.getCodiceProposta());
                uProposta.setString(2, proposta.getNomeProduttore());
                uProposta.setString(3, proposta.getNomeProdotto());
                uProposta.setDouble(4, proposta.getPrezzo());
                uProposta.setString(5, proposta.getLink());
                uProposta.setString(6, proposta.getNote());
                uProposta.setString(7, proposta.getStatoProposta().name());
                uProposta.setString(8, proposta.getMotivazione());
                //  uProposta.setTimestamp(9, new java.sql.Timestamp(proposta.getUpdate_at().getTime()));

                if (proposta.getStatoOrdine() == null) {
                    uProposta.setNull(9, Types.NULL);
                } else {
                    uProposta.setString(9, proposta.getStatoOrdine().name());
                }



                if (proposta.getDataOrdine() == null) {
                    // Imposta il valore come NULL per il database
                    iProposta.setNull(13, java.sql.Types.TIMESTAMP); // Usa setNull invece di setTimestamp con null
                } else {
                    // Imposta il timestamp se dataOrdine è disponibile
                    iProposta.setTimestamp(13, new java.sql.Timestamp(proposta.getDataOrdine().getTime()));
                }
                long oldVersion = proposta.getVersion();
                long newVersion = oldVersion + 1;
                uProposta.setLong(12, newVersion);
                uProposta.setInt(13, proposta.getKey());
                uProposta.setLong(14, oldVersion);

                // Gestione Optimistic Locking: se la versione non corrisponde, fallisce l'aggiornamento
                if (uProposta.executeUpdate() == 0) {
                    throw new OptimisticLockException(proposta);
                } else {
                    proposta.setVersion(newVersion); // Aggiorna la versione della proposta
                }

            } else { // Se la proposta non esiste ancora (insert)
                // Inserisce una nuova proposta
                iProposta.setString(1, proposta.getCodiceProposta());
                iProposta.setInt(2, proposta.getRichiesta().getKey()); // Collegamento con richiesta
                iProposta.setString(3, proposta.getNomeProduttore());
                iProposta.setString(4, proposta.getNomeProdotto());
                iProposta.setDouble(5, proposta.getPrezzo());
                iProposta.setString(6, proposta.getLink());
                iProposta.setString(7, proposta.getNote());
                iProposta.setString(8, proposta.getStatoProposta().name());
                iProposta.setString(9, proposta.getMotivazione());
                iProposta.setTimestamp(10, new java.sql.Timestamp(proposta.getCreated_at().getTime()));
                //  iProposta.setTimestamp(11, new java.sql.Timestamp(proposta.getUpdate_at().getTime()));
                if (proposta.getStatoOrdine() == null) {
                    uProposta.setNull(11, Types.NULL);
                } else {
                    uProposta.setString(11, proposta.getStatoOrdine().name());
                }

                if (proposta.getDataOrdine() == null) {
                    // Imposta il valore come NULL per il database
                    iProposta.setNull(12, java.sql.Types.TIMESTAMP); // Usa setNull invece di setTimestamp con null
                } else {
                    // Imposta il timestamp se dataOrdine è disponibile
                    iProposta.setTimestamp(12, new java.sql.Timestamp(proposta.getDataOrdine().getTime()));
                }

                iProposta.setLong(13, proposta.getVersion());

                if (iProposta.executeUpdate() == 1) {
                    try (ResultSet keys = iProposta.getGeneratedKeys()) {
                        if (keys.next()) {
                            int key = keys.getInt(1);
                            proposta.setKey(key);
                            dataLayer.getCache().add(Proposta.class, proposta); // Aggiungi alla cache
                        }
                    }
                }
            }

            // Imposta il flag di modifica della proposta
            if (proposta instanceof DataItemProxy) {
                ((DataItemProxy) proposta).setModified(false);
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to store Proposta", ex);
        }
    }


    @Override
    public List<Proposta> getAllProposteByRichiesta(Richiesta richiesta) throws DataException {
        List<Proposta> proposte = new ArrayList<>();

        if (richiesta == null || richiesta.getKey() <= 0) {
            throw new DataException("Invalid richiesta ID");
        }


        try {
            // Prepara e imposta il parametro per la query
            sProposteByRichiesta.setInt(1, richiesta.getKey());

            // Esegue la query
            try (ResultSet rs = sProposteByRichiesta.executeQuery()) {
                while (rs.next()) {
                    // Aggiungi la proposta alla lista recuperandola tramite l'ID
                    proposte.add(getProposta(rs.getInt("id")));
                }
            }
        } catch (SQLException e) {
            throw new DataException("Unable to load Proposte for Richiesta", e);
        }

        return proposte;
    }

    public boolean isCodiceUnico(String codice) throws DataException {
        try {
            String query = "SELECT COUNT(*) FROM proposta WHERE codice_proposta = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, codice);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) == 0;
                    }
                }
            }
        } catch (SQLException e) {
            throw new DataException("Errore durante la verifica del codice univoco", e);
        }
        return false;
    }
}