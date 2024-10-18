package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.impl.proxy.CaratteristicaProxy;
import it.univaq.gmarket.data.model.impl.proxy.CategoriaProxy;
import it.univaq.gmarket.framework.data.DAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CaratteristicaDAO_SQL extends DAO implements CaratteristicaDAO {


    private PreparedStatement sCarratteristicheByCategoria;

    /**
     * Costruttore della classe.
     *
     * @param d il DataLayer da utilizzare
     */
    public CaratteristicaDAO_SQL(DataLayer d) {
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

            sCarratteristicheByCategoria = connection.prepareStatement("SELECT * FROM caratteristica WHERE id_categoria=?");

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
            sCarratteristicheByCategoria.close();
        } catch (SQLException ex) {
            throw new DataException("Can't destroy prepared statements", ex);
        }
        super.destroy();
    }

    /**
     * Crea una nuova istanza di Categoria.
     *
     * @return una nuova istanza di CategoriaProxy
     */
    @Override
    public Caratteristica createCaratteristica() {
        return new CaratteristicaProxy(getDataLayer());
    }

    /**
     * Crea una CategoriaProxy a partire da un ResultSet.
     *
     * @param rs il ResultSet da cui creare la CategoriaProxy
     * @return una nuova istanza di CategoriaProxy
     * @throws DataException se si verifica un errore durante la creazione
     */

    private Caratteristica createCaratteristica(ResultSet rs) throws DataException {
        try {
            CaratteristicaProxy cp = (CaratteristicaProxy) createCaratteristica();
            cp.setKey(rs.getInt("id")); // Supponendo che la colonna ID sia "id"
            cp.setNome(rs.getString("nome"));
            cp.setMisura(rs.getString("misura"));

            int categoriaId = rs.getInt("id_categoria");

            System.out.println("Id di creazione");
            System.out.println(categoriaId);

            Categoria categoria = ((AppDataLayer) getDataLayer()).getCategoriaDAO().getCategoria(categoriaId);


            System.out.println("Categoriaaa");
            System.out.println(categoria);

            cp.setCategoria(categoria);

            cp.setVersion(rs.getLong("version")); // Supponendo che ci sia un campo "version"
            return cp;
        } catch (SQLException ex) {
            throw new DataException("Impossibile creare l'oggetto Caratteristica dal ResultSet", ex);
        }
    }


    @Override
    public List<Caratteristica> getCaratteristicheByCategoria(int categoria) throws DataException {
        List<Caratteristica> result = new ArrayList<>();
        try {
            System.out.println("Boh");
            sCarratteristicheByCategoria.setInt(1, categoria);
            System.out.println(sCarratteristicheByCategoria);
            try (ResultSet rs = sCarratteristicheByCategoria.executeQuery()) {
                System.out.println("sCarratteristicheByCategoria");
                while (rs.next()) {
                    result.add(createCaratteristica(rs));
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to load caratteristiche by categoria ID", ex);
        }
        return result;
    }
}
