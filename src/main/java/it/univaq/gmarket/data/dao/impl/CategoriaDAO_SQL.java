package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.impl.proxy.CategoriaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.sql.Types.NULL;

public class CategoriaDAO_SQL extends DAO implements CategoriaDAO {


    private PreparedStatement iCategoria;

    private PreparedStatement sCategoriaById;
    private PreparedStatement sCategorie;
    private PreparedStatement sCategorieByPadre;

    private PreparedStatement dCategoria;  // Per la cancellazione
    private PreparedStatement uCategoria;  // Per l'aggiornamento

    /**
     * Costruttore della classe.
     *
     * @param d il DataLayer da utilizzare
     */
    public CategoriaDAO_SQL(DataLayer d) {
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

            sCategoriaById = connection.prepareStatement("SELECT * FROM categoria WHERE id=?");
            sCategorie = connection.prepareStatement("SELECT * FROM categoria");
            sCategorieByPadre = connection.prepareStatement("SELECT * FROM categoria WHERE id_padre=?");

            iCategoria = connection.prepareStatement("INSERT INTO categoria(nome, id_padre) VALUES (?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);

            uCategoria = connection.prepareStatement("UPDATE categoria SET nome = ?, id_padre = ?, version = ? WHERE id = ? AND version = ?");
            dCategoria = connection.prepareStatement("DELETE FROM categoria WHERE id = ?");

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
            sCategorieByPadre.close();
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
            CategoriaProxy cp = (CategoriaProxy) createCategoria();
            cp.setKey(rs.getInt("id")); // Supponendo che la colonna ID sia "id"
            cp.setNome(rs.getString("nome"));

            System.out.println(rs.getInt("id_padre"));
            if (rs.getInt("id_padre") != 0)
                cp.setPadre(rs.getInt("id_padre")); // Corretto per usare "id_padre"
            else cp.setPadre(null);
            cp.setVersion(rs.getLong("version")); // Supponendo che ci sia un campo "version"
            return cp;
        } catch (SQLException ex) {
            throw new DataException("Impossibile creare l'oggetto Categoria dal ResultSet", ex);
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
                    result.add(getCategoria(rs.getInt("id")));
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
    /*@Override
    public void storeCategoria(Categoria categoria) throws DataException {
        try {
            iCategoria.setString(1, categoria.getNome());

            // Controlla se il padre è null
            if (categoria.getPadre() != null) {
                // Se il padre è presente, imposta il suo valore nella query
                iCategoria.setInt(2, categoria.getPadre());
            } else {
                // Se il padre è null, imposta un valore NULL nel database
                iCategoria.setNull(2, java.sql.Types.INTEGER);  // O il tipo corretto per il campo padre
            }

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
       /*     if (categoria instanceof DataItemProxy) {
                ((DataItemProxy) categoria).setModified(false);
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store Categoria", ex);
        }
    } */
    public void storeCategoria(Categoria categoria) throws DataException {
        try {
            if (categoria.getKey() != null && categoria.getKey() > 0) {
                if (categoria instanceof CategoriaProxy && !((CategoriaProxy) categoria).isModified()) {
                    return;
                }
                // Update existing category
                uCategoria.setString(1, categoria.getNome());

                // Aggiungi l'ID del padre
                if (categoria.getPadre() != null) {
                    uCategoria.setInt(2, categoria.getPadre());
                } else {
                    uCategoria.setNull(2, NULL);
                }

                long oldVersion = categoria.getVersion();
                long newVersion = oldVersion + 1;

                uCategoria.setLong(3, newVersion);  // Nuova versione
                uCategoria.setInt(4, categoria.getKey());  // ID della categoria
                uCategoria.setLong(5, oldVersion);  // Versione vecchia per il controllo di concorrenza
                System.out.println(uCategoria);
                if (uCategoria.executeUpdate() == 0) {
                    throw new OptimisticLockException(categoria);
                } else {
                    categoria.setVersion(newVersion);
                }
            } else {
                // Insert new category
                iCategoria.setString(1, categoria.getNome());
                if (categoria.getPadre() != null) {
                    iCategoria.setInt(2, categoria.getPadre());
                } else {
                    iCategoria.setNull(2, NULL);
                }
                System.out.println(iCategoria);
                if (iCategoria.executeUpdate() == 1) {
                    try (ResultSet keys = iCategoria.getGeneratedKeys()) {
                        if (keys.next()) {
                            int key = keys.getInt(1);
                            categoria.setKey(key);
                            dataLayer.getCache().add(Categoria.class, categoria);
                        }
                    }
                }
            }

            if (categoria instanceof DataItemProxy) {
                ((DataItemProxy) categoria).setModified(false);
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to store Categoria", ex);
        }
    }

    @Override
    public Categoria getCategoriaById(int categoriaId) throws DataException {
        return getCategoria(categoriaId);
    }


    @Override
    public List<Categoria> getCategorieByPadre(int padre) throws DataException {
        List<Categoria> result = new ArrayList<>();
        try {
            sCategorieByPadre.setInt(1, padre);
            try (ResultSet rs = sCategorieByPadre.executeQuery()) {
                while (rs.next()) {
                    result.add(getCategoria(rs.getInt("id")));
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Error loading categories by parent ID", ex);
        }
        return result;
    }

    @Override
    public void deleteCategoria(Categoria categoria) throws DataException {
        try {
            dataLayer.getCache().delete(Categoria.class, categoria);
            dCategoria.setInt(1, categoria.getKey());
            System.out.println(categoria);
            dCategoria.executeUpdate();

        } catch (SQLException e) {
            throw new DataException("Unable to delete Categoria", e);
        }
    }


}
