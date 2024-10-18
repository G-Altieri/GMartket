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

            uCategoria = connection.prepareStatement(  "UPDATE categoria SET nome = ?, id_padre = ?, version = ?, ha_figlio = ? WHERE id = ? AND version = ?");
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
            cp.setFiglio(rs.getBoolean("ha_figlio"));
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


    public void storeCategoria(Categoria categoria) throws DataException {
        try {
            if (categoria.getKey() != null && categoria.getKey() > 0) {
                if (categoria instanceof CategoriaProxy && !((CategoriaProxy) categoria).isModified()) {
                    return;
                }
                // Update existing category
                uCategoria.setString(1, categoria.getNome());

                // Add parent ID
                if (categoria.getPadre() != null) {
                    uCategoria.setInt(2, categoria.getPadre());
                } else {
                    uCategoria.setNull(2, NULL);
                }

                long oldVersion = categoria.getVersion();
                long newVersion = oldVersion + 1;

                // Determine the ha_figlio value
                boolean haFiglio = false;
                if (categoria.getPadre() != null) {
                    Categoria padre = getCategoria(categoria.getPadre());
                    // If the parent category does not already have children, set ha_figlio to true
                    if (!padre.getFiglio()) {
                        haFiglio = true;
                        // Optionally update the parent category to set ha_figlio to true
                        padre.setFiglio(true);
                        updateHaFiglio(padre);  // Method to update the parent category if needed
                    }
                }

                uCategoria.setLong(3, newVersion);  // New version
                uCategoria.setBoolean(4, haFiglio);  // Set ha_figlio
                uCategoria.setInt(5, categoria.getKey());  // Category ID
                uCategoria.setLong(6, oldVersion);  // Old version for concurrency check

                System.out.println(uCategoria);
                if (uCategoria.executeUpdate() == 0) {
                    throw new OptimisticLockException(categoria);
                } else {
                    categoria.setVersion(newVersion);
                }
            } else {
                // Inserisci una nuova categoria
                iCategoria.setString(1, categoria.getNome());

                if (categoria.getPadre() != null) {
                    iCategoria.setInt(2, categoria.getPadre());
                } else {
                    iCategoria.setNull(2, NULL);
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
                System.out.println("PADRE DI INSERRRRTT");
                System.out.println(categoria.getPadre());
                // Gestione dell'attributo figlio del padre
                if (categoria.getPadre() != null) {
                    Categoria padre = getCategoria(categoria.getPadre());
                    System.out.println("getFiglio");
                    System.out.println(!padre.getFiglio());
                    if (!padre.getFiglio()) {
                        padre.setFiglio(true);
                        storeCategoria(padre);  // Aggiorna il padre
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

    // Method to update the ha_figlio attribute of the parent category
    private void updateHaFiglio(Categoria padre) throws SQLException {
        PreparedStatement updateHaFiglioStmt = connection.prepareStatement(
                "UPDATE categoria SET ha_figlio = ? WHERE id = ?"
        );
        updateHaFiglioStmt.setBoolean(1, true);  // Set ha_figlio to true
        updateHaFiglioStmt.setInt(2, padre.getKey());  // Parent ID
        updateHaFiglioStmt.executeUpdate();
        updateHaFiglioStmt.close();
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

    /*
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
    */
    @Override
    public void deleteCategoria(Categoria categoria) throws DataException {
        try {
            // Rimuovi la categoria dalla cache e dal database
            dataLayer.getCache().delete(Categoria.class, categoria);
            dCategoria.setInt(1, categoria.getKey());
            dCategoria.executeUpdate();

            // Gestione dell'attributo figlio del padre
            if (categoria.getPadre() != null) {
                List<Categoria> altreFiglie = getCategorieByPadre(categoria.getPadre());
                if (altreFiglie.isEmpty()) {
                    // Se non ci sono altre categorie figlie, imposta figlio a false
                    Categoria padre = getCategoria(categoria.getPadre());
                    if (padre.getFiglio()) {
                        padre.setFiglio(false);
                        storeCategoria(padre);  // Aggiorna il padre
                    }
                }
            }

        } catch (SQLException e) {
            throw new DataException("Unable to delete Categoria", e);
        }
    }

    /**
     * Recupera ricorsivamente tutte le sottocategorie di una categoria, inclusi i figli dei figli.
     *
     * @param padreId l'ID della categoria padre
     * @return una lista contenente tutte le sottocategorie (dirette e indirette)
     */
    public List<Categoria> getAllSubCategorie(int padreId) throws DataException {
        List<Categoria> result = new ArrayList<>();
        // Prima, otteniamo i figli diretti della categoria padre
        List<Categoria> figliDiretti = getCategorieByPadre(padreId);

        // Aggiungiamo i figli diretti al risultato
        result.addAll(figliDiretti);

        // Per ogni figlio diretto, cerchiamo ricorsivamente i suoi figli
        for (Categoria categoria : figliDiretti) {
            // Chiamata ricorsiva per trovare i figli dei figli
            result.addAll(getAllSubCategorie(categoria.getKey()));
        }

        System.out.println("Sottocategorie per padreId " + padreId + ": " + result);
        return result;
    }

    @Override
    public List<Categoria> getFiglieByCategoriaId(int categoriaId) throws DataException {
        List<Categoria> result = new ArrayList<>();
        try {
            // Imposta l'ID del padre nella query preparata
            sCategorieByPadre.setInt(1, categoriaId);

            // Esegui la query e recupera i risultati
            try (ResultSet rs = sCategorieByPadre.executeQuery()) {
                // Itera sui risultati e aggiungi ogni categoria figlia alla lista
                while (rs.next()) {
                    Categoria figlia = getCategoria(rs.getInt("id"));
                    result.add(figlia);
                }
            }
        } catch (SQLException | DataException ex) {
            throw new DataException("Error loading direct child categories for category ID: " + categoriaId, ex);
        }
        return result;
    }


}
