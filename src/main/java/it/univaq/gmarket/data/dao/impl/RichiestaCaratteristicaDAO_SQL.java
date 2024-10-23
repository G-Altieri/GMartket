package it.univaq.gmarket.data.dao.impl;


import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.data.model.impl.proxy.RichiestaCaratteristicaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RichiestaCaratteristicaDAO_SQL extends DAO implements RichiestaCaratteristicaDAO {

    private PreparedStatement sRichiestaCaratteristicaByID, sRichiesteCaratteristicheByRichiesta,
            sRichiesteByCaratteristica, iRichiestaCaratteristica, uRichiestaCaratteristica;


    /**
     * Costruttore della classe.
     *
     * @param d il DataLayer da utilizzare
     */
    public RichiestaCaratteristicaDAO_SQL(DataLayer d) {
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
            sRichiestaCaratteristicaByID = connection.prepareStatement("SELECT * FROM richiesta_caratteristica WHERE ID = ?");
            sRichiesteCaratteristicheByRichiesta = connection.prepareStatement("SELECT * FROM richiesta_caratteristica WHERE id_richiesta = ?");
            sRichiesteByCaratteristica = connection.prepareStatement("SELECT * FROM richiesta_caratteristica WHERE id_caratteristica = ?");
            iRichiestaCaratteristica = connection.prepareStatement("INSERT INTO richiesta_caratteristica (id_richiesta, id_caratteristica, valore) VALUES(?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
            uRichiestaCaratteristica = connection.prepareStatement("UPDATE richiesta_caratteristica SET id_richiesta=?, id_caratteristica=?, valore=?, version=? WHERE ID=? AND version=?");
        } catch (SQLException ex) {
            throw new DataException("Error initializing data layer", ex);
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
            sRichiestaCaratteristicaByID.close();
            sRichiesteCaratteristicheByRichiesta.close();
            sRichiesteByCaratteristica.close();
            iRichiestaCaratteristica.close();
            uRichiestaCaratteristica.close();
        } catch (SQLException ex) {
            throw new DataException("Error while closing resources in RichiestaCaratteristicaDAO_SQL", ex);
        } finally {

            super.destroy();
        }
    }

    /**
     * Crea una nuova istanza di CaratteristicaRichiesta.
     *
     * @return una nuova istanza di CaratteristicaRichiestaProxy
     */
    @Override
    public RichiestaCaratteristica createRichiestaCaratteristica() {
        return new RichiestaCaratteristicaProxy(getDataLayer());
    }


    /**
     * Crea una CaratteristicaRichiestaProxy a partire da un ResultSet.
     *
     * @param rs il ResultSet da cui creare la CaratteristicaRichiestaProxy
     * @return una nuova istanza di CaratteristicaRichiestaProxy
     * @throws DataException se si verifica un errore durante la creazione
     */
    private RichiestaCaratteristicaProxy createRichiestaCaratteristica(ResultSet rs) throws DataException {
        try {
            RichiestaCaratteristicaProxy cr = (RichiestaCaratteristicaProxy) createRichiestaCaratteristica();
            cr.setKey(rs.getInt("id"));
            RichiestaDAO richiestaDAO = (RichiestaDAO) dataLayer.getDAO(Richiesta.class);
            cr.setRichiesta(richiestaDAO.getRichiesta(rs.getInt("id_richiesta")));
            CaratteristicaDAO caratteristicaDAO = (CaratteristicaDAO) dataLayer.getDAO(Caratteristica.class);
            cr.setCaratteristica(caratteristicaDAO.getCaratteristica(rs.getInt("id_caratteristica")));
            cr.setValore(rs.getString("valore"));
            cr.setVersion(rs.getLong("version"));
            return cr;
        } catch (SQLException ex) {
            throw new DataException("Unable to create RichiestaCaratteristica from ResultSet", ex);
        }
    }

    @Override
    public void storeRichiestaCaratteristica(RichiestaCaratteristica richiestaCaratteristica) throws DataException {
        try {
            if (richiestaCaratteristica.getKey() != null && richiestaCaratteristica.getKey() > 0) {
                if (richiestaCaratteristica instanceof RichiestaCaratteristicaProxy && !((RichiestaCaratteristicaProxy) richiestaCaratteristica).isModified()) {
                    return;
                }
                uRichiestaCaratteristica.setInt(1, richiestaCaratteristica.getRichiesta().getKey());
                uRichiestaCaratteristica.setInt(2, richiestaCaratteristica.getCaratteristica().getKey());
                uRichiestaCaratteristica.setString(3, richiestaCaratteristica.getValore());
                long oldVersion = richiestaCaratteristica.getVersion();
                long versione = oldVersion + 1;
                uRichiestaCaratteristica.setLong(4, versione);
                uRichiestaCaratteristica.setInt(5, richiestaCaratteristica.getKey());
                uRichiestaCaratteristica.setLong(6, oldVersion);
                if (uRichiestaCaratteristica.executeUpdate() == 0) {
                    throw new OptimisticLockException(richiestaCaratteristica);
                } else {
                    richiestaCaratteristica.setVersion(versione);
                }
            } else {//INSERT
                iRichiestaCaratteristica.setInt(1, richiestaCaratteristica.getRichiesta().getKey());
                iRichiestaCaratteristica.setInt(2, richiestaCaratteristica.getCaratteristica().getKey());
                iRichiestaCaratteristica.setString(3, richiestaCaratteristica.getValore());
                if (iRichiestaCaratteristica.executeUpdate() == 1) {
                    try (ResultSet keys = iRichiestaCaratteristica.getGeneratedKeys()) {
                        if (keys.next()) {
                            int key = keys.getInt(1);
                            richiestaCaratteristica.setKey(key);
                            dataLayer.getCache().add(RichiestaCaratteristica.class, richiestaCaratteristica);
                        }
                    }
                }
            }
            if (richiestaCaratteristica instanceof DataItemProxy) {
                ((DataItemProxy) richiestaCaratteristica).setModified(false);
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store RichiestaCaratteristica", ex);
        }
    }

    /**
     * Recupera una richiesta dato il suo ID.
     *
     * @param richiestaCaratteristica_key l'ID della richiesta
     * @return la richiesta corrispondente all'ID
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public RichiestaCaratteristica getRichiestaCaratteristica(int richiestaCaratteristica_key) throws DataException {
        RichiestaCaratteristica richiestaCaratteristica = null;
        if (dataLayer.getCache().has(RichiestaCaratteristica.class, richiestaCaratteristica_key)) {
            richiestaCaratteristica = dataLayer.getCache().get(RichiestaCaratteristica.class, richiestaCaratteristica_key);
        } else {
            try {
                sRichiestaCaratteristicaByID.setInt(1, richiestaCaratteristica_key);
                try (ResultSet rs = sRichiestaCaratteristicaByID.executeQuery()) {
                    if (rs.next()) {
                        richiestaCaratteristica = createRichiestaCaratteristica(rs);
                        dataLayer.getCache().add(RichiestaCaratteristica.class, richiestaCaratteristica);
                    }
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to load Richiesta by ID", ex);
            }
        }
        return richiestaCaratteristica;
    }


    @Override
    public List<RichiestaCaratteristica> getRichiesteCaratteristicaByRichiesta(Integer key) throws DataException {
        List<RichiestaCaratteristica> richiestaCaratteristica = new ArrayList<>();
        try {
            sRichiesteCaratteristicheByRichiesta.setInt(1, key);
            try (ResultSet rs = sRichiesteCaratteristicheByRichiesta.executeQuery()) {
                while (rs.next()) {
                    richiestaCaratteristica.add(getRichiestaCaratteristica(rs.getInt("id")));
                }
            }
        } catch (SQLException | DataException ex) {
            throw new DataException("Unable to load Richieste by Ordinante", ex);
        }

        return richiestaCaratteristica;
    }



}
