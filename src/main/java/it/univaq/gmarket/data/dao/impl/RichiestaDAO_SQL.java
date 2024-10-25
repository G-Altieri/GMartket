package it.univaq.gmarket.data.dao.impl;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.data.model.impl.proxy.RichiestaProxy;
import it.univaq.gmarket.framework.data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RichiestaDAO_SQL extends DAO implements RichiestaDAO {

        private PreparedStatement sRichiestaByID, sRichiesteByOrdinante, sRichiesteByTecnico, sAllRichiesteLibere, sRichiesteByCompletatoSpedite, sRichiesteByAssegnate, sRichiesteByCompletatoSpediteByOrdinante, sRichiesteByAssegnateByOrdinante, uRichiesta, iRichiesta;

        public RichiestaDAO_SQL(AppDataLayer data) {
            super(data);
        }


        @Override
        public void init() throws DataException {
            try {
                super.init();

                sRichiestaByID = connection.prepareStatement("SELECT * FROM richiesta WHERE ID = ?");
                sRichiesteByOrdinante = connection.prepareStatement("SELECT * FROM richiesta WHERE id_ordinante = ? ORDER BY created_at DESC");
                sRichiesteByTecnico = connection.prepareStatement("SELECT * FROM richiesta WHERE id_tecnico = ? ORDER BY created_at DESC");
                sAllRichiesteLibere = connection.prepareStatement("SELECT * FROM richiesta WHERE stato IN ('IN_ATTESA') ORDER BY created_at DESC");
                sRichiesteByCompletatoSpedite = connection.prepareStatement("SELECT * FROM richiesta WHERE stato IN ('COMPLETATO', 'SPEDITO') ORDER BY created_at DESC;");
                sRichiesteByAssegnate = connection.prepareStatement("SELECT * FROM richiesta WHERE stato = 'ASSEGNATO' ORDER BY created_at DESC;");
                sRichiesteByCompletatoSpediteByOrdinante = connection.prepareStatement("SELECT * FROM richiesta WHERE stato IN ('COMPLETATO', 'SPEDITO') AND id_ordinante = ? ORDER BY created_at DESC;");
                sRichiesteByAssegnateByOrdinante = connection.prepareStatement("SELECT * FROM richiesta WHERE stato = 'ASSEGNATO' AND id_ordinante = ? ORDER BY created_at DESC;");
                iRichiesta = connection.prepareStatement("INSERT INTO richiesta (note, stato, created_at, id_categoria, id_ordinante, codice) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                uRichiesta = connection.prepareStatement("UPDATE richiesta SET note=?, stato=?,  id_categoria=?, id_ordinante=?, codice=?, id_tecnico=?, version=? WHERE ID=? AND version=?");


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
                sAllRichiesteLibere.close();
                sRichiesteByCompletatoSpedite.close();
                sRichiesteByCompletatoSpediteByOrdinante.close();
                iRichiesta.close();
                uRichiesta.close();
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
                richiesta.setCreated_at(rs.getTimestamp("created_at"));
                //richiesta.setUpdate_at(rs.getDate("update_at"));
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
                if (richiesta.getKey() != null && richiesta.getKey() > 0) {
                    if (richiesta instanceof RichiestaProxy && !((RichiestaProxy) richiesta).isModified()) {
                        return;
                    }
                    uRichiesta.setString(1, richiesta.getNote());
                    uRichiesta.setString(2, richiesta.getStato().name());
                 //   uRichiesta.setDate(3, new java.sql.Date(richiesta.getCreated_at().getTime()));
                    uRichiesta.setInt(3, richiesta.getCategoria().getKey());
                    uRichiesta.setInt(4, richiesta.getOrdinante().getKey());
                    uRichiesta.setString(5, richiesta.getCodice());
                    uRichiesta.setInt(6, richiesta.getTecnico().getKey());

                    long oldVersion = richiesta.getVersion();
                    long versione = oldVersion + 1;
                    uRichiesta.setLong(7, versione);
                    uRichiesta.setInt(8, richiesta.getKey());
                    uRichiesta.setLong(9, oldVersion);
                    if(uRichiesta.executeUpdate() == 0){
                        throw new OptimisticLockException(richiesta);
                    }else {
                        richiesta.setVersion(versione);
                    }
                } else {
                    iRichiesta.setString(1, richiesta.getNote());
                    iRichiesta.setString(2, richiesta.getStato().name());
                    iRichiesta.setTimestamp(3, new java.sql.Timestamp(richiesta.getCreated_at().getTime()));
                    iRichiesta.setInt(4, richiesta.getCategoria().getKey());
                    iRichiesta.setInt(5, richiesta.getOrdinante().getKey());
                 //   iRichiesta.setDate(4, new java.sql.Date(richiesta.getUpdate_at().getTime()));
                    iRichiesta.setString(6, richiesta.getCodice());
                 //   iRichiesta.setInt(6, richiesta.getTecnico().getKey());




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
    public List<Richiesta> getAllRichiesteOrdinante(int utente_key) throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try {
            sRichiesteByOrdinante.setInt(1, utente_key);
            try (ResultSet rs = sRichiesteByOrdinante.executeQuery()) {
                while (rs.next()) {
                    richieste.add(getRichiesta(rs.getInt("id")));
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to load Richieste by Ordinante", ex);
        }

        return richieste;
    }

    @Override
    public List<Richiesta> getAllRichiesteByTecnico(int utente_key) throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try {
            sRichiesteByTecnico.setInt(1, utente_key);
            try (ResultSet rs = sRichiesteByTecnico.executeQuery()) {
                while (rs.next()) {
                    richieste.add(getRichiesta(rs.getInt("id")));
                }
            }
        } catch (SQLException ex) {
            throw new DataException("Unable to load Richieste by Tecnico", ex);
        }

        return richieste;
    }

    @Override
    public List<Richiesta> getRichiesteByCompletatoSpedite() throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try (ResultSet rs = sRichiesteByCompletatoSpedite.executeQuery()) {
            while (rs.next()) {
                richieste.add(getRichiesta(rs.getInt("id")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return richieste;
    }

    @Override
    public List<Richiesta> getRichiesteByCompletatoSpediteByOrdinante(int utente_key) throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try {
            sRichiesteByCompletatoSpediteByOrdinante.setInt(1, utente_key);
            try (ResultSet rs = sRichiesteByCompletatoSpediteByOrdinante.executeQuery()) {
                while (rs.next()) {
                    richieste.add(getRichiesta(rs.getInt("id")));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
            catch (SQLException ex) {
                throw new DataException("Unable to load Richieste by Ordinante", ex);
            }

        return richieste;
    }


    @Override
    public List<Richiesta> getRichiesteByAssegnato() throws DataException {
        List<Richiesta> richieste = new ArrayList<>();

        try (ResultSet rs = sRichiesteByAssegnate.executeQuery()) {
            while (rs.next()) {
                richieste.add(getRichiesta(rs.getInt("id")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return richieste;
    }

    @Override
    public List<Richiesta> getRichiesteByAssegnatoByOrdinante(int utente_key) throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
        try {
            sRichiesteByAssegnateByOrdinante.setInt(1, utente_key);
            try (ResultSet rs = sRichiesteByAssegnateByOrdinante.executeQuery()) {
            while (rs.next()) {
                richieste.add(getRichiesta(rs.getInt("id")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    catch (SQLException ex) {
        throw new DataException("Unable to load Richieste by Ordinante", ex);
    }
        return richieste;
    }


    @Override
    public List<Richiesta> getAllRichiesteTecnico() throws DataException {
        List<Richiesta> richieste = new ArrayList<>();
            try (ResultSet rs = sAllRichiesteLibere.executeQuery()) {
                while (rs.next()) {
                    richieste.add(getRichiesta(rs.getInt("id")));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        return richieste;
    }

    public boolean isCodiceUnico(String codice) throws DataException {
        try {
            String query = "SELECT COUNT(*) FROM richiesta WHERE codice = ?";
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
