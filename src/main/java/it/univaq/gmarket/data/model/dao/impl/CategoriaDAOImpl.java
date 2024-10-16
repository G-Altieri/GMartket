package it.univaq.gmarket.data.model.dao.impl;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.impl.proxy.CategoriaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAOImpl extends DAO implements CategoriaDAO {


    private PreparedStatement iCategoria;

    private PreparedStatement sCategoriaById;
    private PreparedStatement sCategorie;
    private PreparedStatement sCategorieByPadre;

    /**
     * Costruttore della classe.
     *
     * @param d il DataLayer da utilizzare
     */
    public CategoriaDAOImpl(DataLayer d) {
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

            sCategoriaById = connection.prepareStatement("SELECT * FROM categoria WHERE ID=?");
            sCategorie = connection.prepareStatement("SELECT nome FROM categoria");

            iCategoria = connection.prepareStatement("INSERT INTO categoria(nome) VALUES (?)", PreparedStatement.RETURN_GENERATED_KEYS);

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
            sCategoriaById.close();
            sCategorie.close();
            iCategoria.close();
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
    public Categoria createCategoria() {
        return new CategoriaProxy(getDataLayer());
    }

    /**
     * Crea una CategoriaProxy a partire da un ResultSet.
     *
     * @param rs il ResultSet da cui creare la CategoriaProxy
     * @return una nuova istanza di CategoriaProxy
     * @throws DataException se si verifica un errore durante la creazione
     */
    private Categoria createCategoria(ResultSet rs) throws DataException {
        try {
            System.out.println("forse ci passo");
            CategoriaProxy cp = (CategoriaProxy) createCategoria();
            cp.setKey(rs.getInt("ID"));
            cp.setNome(rs.getString("nome"));
            cp.setPadre(rs.getInt("padre"));
            cp.setVersion(rs.getLong("version"));
            return cp;
        } catch (SQLException ex) {
            throw new DataException("Unable to create Categoria object form ResultSet", ex);
        }
    }

    /**
     * Recupera una categoria dato il suo ID.
     *
     * @param categoria_id l'ID della categoria
     * @return la categoria corrispondente all'ID
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public Categoria getCategoria(int categoria_id) throws DataException {
        Categoria cp = null;
        if (dataLayer.getCache().has(Categoria.class, categoria_id)) {
            cp = dataLayer.getCache().get(Categoria.class, categoria_id);
        } else {
            try {
                sCategoriaById.setInt(1, categoria_id);
                try (ResultSet rs = sCategoriaById.executeQuery()) {
                    if (rs.next()) {
                        cp = createCategoria(rs);
                        dataLayer.getCache().add(Categoria.class, cp);
                    }
                }
            } catch (SQLException ex) {
                throw new DataException("Unable to load Categoria by ID", ex);
            }
        }
        return cp;
    }

    /**
     * Recupera tutte le categorie.
     *
     * @return una lista di tutte le categorie
     * @throws DataException se si verifica un errore durante il recupero
     */
    @Override
    public List<Categoria> getAllCategorie() throws DataException {
        List<Categoria> result = new ArrayList<>();
        try {
            try (ResultSet rs = sCategorie.executeQuery()) {
                while (rs.next()) {
                    result.add(getCategoria(rs.getInt("ID")));
                }
            }
            return result;
        } catch (SQLException ex) {
            throw new DataException("Error loading all categories", ex);
        }
    }

    /**
     * Memorizza una categoria nel database.
     *
     * @param categoria la categoria da memorizzare
     * @throws DataException se si verifica un errore durante la memorizzazione
     */
    @Override
    public void storeCategoria(Categoria categoria) throws DataException {
        try {
            System.out.println("In strano modo ma ci arrivo");
            iCategoria.setString(1, categoria.getNome());
         //   iCategoria.setInt(2, "null");//categoria.getPadre()

            if (iCategoria.executeUpdate() == 1) {
                try (ResultSet keys = iCategoria.getGeneratedKeys()) {
                    if (keys.next()) {
                        int key = keys.getInt(1);
                        categoria.setKey(key);
                        dataLayer.getCache().add(Categoria.class, categoria);
                    }
                }
            }
         /*   if (categoria.getKey() != null && categoria.getKey() > 0) { //update
                if (categoria instanceof CategoriaProxy && !((CategoriaProxy) categoria).isModified()) {
                    return;
                }
                System.out.println("Sono qui e la categoria è:" + categoria.getKey() );
                uCategoria.setString(1, categoria.getNome());
                long oldVersion = categoria.getVersion();
                System.out.println("la versione è: "+oldVersion);
                long versione = oldVersion + 1;
                uCategoria.setLong(2, versione);
                uCategoria.setInt(3, categoria.getKey());
                uCategoria.setLong(4, oldVersion);
                if(uCategoria.executeUpdate() == 0){
                    throw new OptimisticLockException(categoria);
                }else {
                    categoria.setVersion(versione);
                }
            } else { //insert

            } */
            if (categoria instanceof DataItemProxy) {
                ((DataItemProxy) categoria).setModified(false);
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store Categoria", ex);
        }
    }

    @Override
    public List<Categoria> getCategorieByPadre(int padre) throws DataException {
        return null;
    }
}
