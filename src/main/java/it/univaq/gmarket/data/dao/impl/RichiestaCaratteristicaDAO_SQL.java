package it.univaq.gmarket.data.dao.impl;


import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.data.model.impl.proxy.RichiestaCaratteristicaProxy;
import it.univaq.gmarket.framework.data.DAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RichiestaCaratteristicaDAO_SQL extends DAO implements RichiestaCaratteristicaDAO {

    private PreparedStatement sCaratteristicaRichiestaByID, sCaratteristicheByRichiesta, sRichiesteByCaratteristica, iCaratteristicaRichiesta, uCaratteristicaRichiesta;


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
            sCaratteristicaRichiestaByID = connection.prepareStatement("SELECT * FROM caratteristica_richiesta WHERE ID = ?");
            sCaratteristicheByRichiesta = connection.prepareStatement("SELECT * FROM caratteristica_richiesta WHERE richiesta_id = ?");
            sRichiesteByCaratteristica = connection.prepareStatement("SELECT * FROM caratteristica_richiesta WHERE caratteristica_id = ?");
            iCaratteristicaRichiesta = connection.prepareStatement("INSERT INTO caratteristica_richiesta (richiesta_id, caratteristica_id, valore) VALUES(?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
            uCaratteristicaRichiesta = connection.prepareStatement("UPDATE caratteristica_richiesta SET richiesta_id=?, caratteristica_id=?, valore=?, version=? WHERE ID=? AND version=?");
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
                sCaratteristicaRichiestaByID.close();
                sCaratteristicheByRichiesta.close();
                sRichiesteByCaratteristica.close();
                iCaratteristicaRichiesta.close();
                uCaratteristicaRichiesta.close();
        } catch (SQLException ex) {
            throw new DataException("Error while closing resources in CaratteristicaRichiestaDAO_MySQL", ex);
        } finally {
            // Assicuriamoci di chiamare il destroy() della classe padre
            super.destroy();
        }
    }

    /**
     * Crea una nuova istanza di CaratteristicaRichiesta.
     *
     * @return una nuova istanza di CaratteristicaRichiestaProxy
     */
    @Override
    public RichiestaCaratteristica createCaratteristicaRichiesta() {
        return new RichiestaCaratteristicaProxy(getDataLayer());
    }


    /**
     * Crea una CaratteristicaRichiestaProxy a partire da un ResultSet.
     *
     * @param rs il ResultSet da cui creare la CaratteristicaRichiestaProxy
     * @return una nuova istanza di CaratteristicaRichiestaProxy
     * @throws DataException se si verifica un errore durante la creazione
     */
    private RichiestaCaratteristicaProxy createCaratteristicaRichiesta(ResultSet rs) throws DataException {
        try{
            RichiestaCaratteristicaProxy cr = (RichiestaCaratteristicaProxy) createCaratteristicaRichiesta();
            cr.setKey(rs.getInt("id"));
            RichiestaDAO richiestaOrdineDAO = (RichiestaDAO) dataLayer.getDAO(Richiesta.class);
            cr.setRichiesta(richiestaOrdineDAO.getRichiesta(rs.getInt("richiesta_id")));
            CaratteristicaDAO caratteristicaDAO = (CaratteristicaDAO) dataLayer.getDAO(Caratteristica.class);
            cr.setCaratteristica(caratteristicaDAO.getCaratteristica(rs.getInt("caratteristica_id")));
            cr.setValore(rs.getString("valore"));
            cr.setVersion(rs.getLong("version"));
            return cr;
        } catch (SQLException ex) {
            throw new DataException("Unable to create CaratteristicaRichiesta from ResultSet", ex);
        }
    }


}
