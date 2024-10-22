package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.impl.proxy.CaratteristicaProxy;
import it.univaq.gmarket.framework.data.DAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;
import it.univaq.gmarket.framework.data.OptimisticLockException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CaratteristicaDAO_SQL extends DAO implements CaratteristicaDAO {


    private PreparedStatement sCarratteristicheByCategoria;
    private PreparedStatement sCaratteristicaById;
    private PreparedStatement dCaratteristica;
    private PreparedStatement uCaratteristica;

    private PreparedStatement iCaratteristica;


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
            sCaratteristicaById = connection.prepareStatement("SELECT * FROM caratteristica WHERE id=?");
            iCaratteristica = connection.prepareStatement("INSERT INTO caratteristica (nome, misura, id_categoria) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
            uCaratteristica = connection.prepareStatement("UPDATE caratteristica SET nome=?, misura=?, id_categoria=?, version=? WHERE id=? AND version=?");
            dCaratteristica = connection.prepareStatement("DELETE FROM caratteristica WHERE id=?");


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
            uCaratteristica.close();
            iCaratteristica.close();
            dCaratteristica.close();
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

            Categoria categoria = ((AppDataLayer) getDataLayer()).getCategoriaDAO().getCategoria(categoriaId);

            cp.setCategoria(categoria);

            cp.setVersion(rs.getLong("version")); // Supponendo che ci sia un campo "version"
            return cp;
        } catch (SQLException ex) {
            throw new DataException("Impossibile creare l'oggetto Caratteristica dal ResultSet", ex);
        }
    }

    @Override
    public Caratteristica getCaratteristica(int id) throws DataException {
        Caratteristica result = null;
        try {
            // Imposta il valore dell'ID sulla PreparedStatement
            sCaratteristicaById.setInt(1, id);

            // Esecuzione della query
            try (ResultSet rs = sCaratteristicaById.executeQuery()) {
                // Se troviamo una corrispondenza, creiamo la caratteristica
                if (rs.next()) {
                    result = createCaratteristica(rs);
                }
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to load caratteristica by ID", ex);
        }
        return result;
    }



    // Metodo per eliminare la caratteristica
    @Override
    public void deleteCaratteristica(int id) throws DataException {
        try {
            dCaratteristica.setInt(1, id);

            if (dCaratteristica.executeUpdate() == 0) {
                throw new DataException("Errore durante l'eliminazione della caratteristica, nessuna riga eliminata");
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to delete Caratteristica", ex);
        }
    }

    // Metodo per aggiornare la caratteristica o aggiungerla
    @Override
    public void storeCaratteristica(Caratteristica caratteristica) throws DataException {
        try {
            if (caratteristica.getKey() != null && caratteristica.getKey() > 0) {
                // Se la caratteristica è già esistente e il proxy è modificato, aggiorna
                if (caratteristica instanceof CaratteristicaProxy && !((CaratteristicaProxy) caratteristica).isModified()) {
                    return;  // Nessuna modifica da fare se il proxy non è stato modificato
                }

                // Aggiorna la caratteristica esistente
                uCaratteristica.setString(1, caratteristica.getNome());
                uCaratteristica.setString(2, caratteristica.getMisura());

                // Gestione della categoria collegata (se esiste)
                if (caratteristica.getCategoria() != null) {
                    uCaratteristica.setInt(3, caratteristica.getCategoria().getKey());
                } else {
                    uCaratteristica.setNull(3, java.sql.Types.INTEGER);
                }

                long oldVersion = caratteristica.getVersion();
                long newVersion = oldVersion + 1;

                uCaratteristica.setLong(4, newVersion);  // Nuova versione
                uCaratteristica.setInt(5, caratteristica.getKey());  // ID della caratteristica
                uCaratteristica.setLong(6, oldVersion);  // Versione precedente per il controllo di concorrenza

                // Esegui l'aggiornamento
                if (uCaratteristica.executeUpdate() == 0) {
                    throw new OptimisticLockException(caratteristica);  // Gestione della concorrenza
                } else {
                    caratteristica.setVersion(newVersion);  // Aggiorna la versione locale
                }

            } else { //INSERT
                iCaratteristica.setString(1, caratteristica.getNome());
                iCaratteristica.setString(2, caratteristica.getMisura());

                if (caratteristica.getCategoria() != null) {
                    iCaratteristica.setInt(3, caratteristica.getCategoria().getKey());
                } else {
                    iCaratteristica.setNull(3, java.sql.Types.INTEGER);
                }

                if (iCaratteristica.executeUpdate() == 1) {
                    try (ResultSet keys = iCaratteristica.getGeneratedKeys()) {
                        if (keys.next()) {
                            int key = keys.getInt(1);
                            caratteristica.setKey(key);
                            dataLayer.getCache().add(Caratteristica.class, caratteristica);
                        }
                    }
                }

                iCaratteristica.close();

            }

            // Se il proxy è stato modificato, resetta lo stato modificato
            if (caratteristica instanceof CaratteristicaProxy) {
                ((CaratteristicaProxy) caratteristica).setModified(false);
            }

        } catch (SQLException ex) {
            throw new DataException("Unable to store Caratteristica", ex);
        }
    }


    @Override
    public List<Caratteristica> getCaratteristicheByCategoria(int categoria) throws DataException {
        List<Caratteristica> result = new ArrayList<>();
        try {
            sCarratteristicheByCategoria.setInt(1, categoria);
            try (ResultSet rs = sCarratteristicheByCategoria.executeQuery()) {
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
