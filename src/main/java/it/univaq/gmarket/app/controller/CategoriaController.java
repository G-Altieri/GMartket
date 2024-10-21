package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaController extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String path = request.getRequestURI();  // Ottieni l'URL della richiesta

        try {
            if (path.endsWith("/aggiungi")) {
                // Gestisci la richiesta per aggiungere una categoria (GET e POST)
                handleAggiungiCategoria(request, response);
            } else if (path.endsWith("/categorie")) {
                // Gestisci la richiesta per visualizzare la lista delle categorie
                handleListaCategorie(request, response);
            } else if (path.contains("/visualizza/")) {
                // Gestisci la richiesta per visualizzare, modificare o eliminare una categoria
                handleVisualizzaCategoria(request, response);
            } else {
                // In caso di URL sconosciuto
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (TemplateManagerException | IOException | DataException ex) {
            handleError(ex, request, response);
        }
    }

    private void handleAggiungiCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, TemplateManagerException, DataException {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Gestione della richiesta POST per aggiungere una categoria
            String nomeCategoria = request.getParameter("nome");
            String padreCategoria = request.getParameter("padre");

            if (nomeCategoria == null || nomeCategoria.isEmpty()) {
                throw new ServletException("Il nome della categoria è obbligatorio.");
            }

            CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
            Categoria nuovaCategoria = categoriaDAO.createCategoria();
            nuovaCategoria.setNome(nomeCategoria);

            if (padreCategoria != null && !padreCategoria.isEmpty()) {
                nuovaCategoria.setPadre(SecurityHelpers.checkNumeric(padreCategoria));//Integer.parseInt(padreCategoria)
            } else {
                nuovaCategoria.setPadre(null);  // Se non c'è un padre, si imposta a null
            }

            categoriaDAO.storeCategoria(nuovaCategoria);

            response.sendRedirect("/admin/categorie"); // Dopo l'inserimento, ridireziona l'utente
        } else {
            // GET: Visualizza il form per aggiungere una categoria
            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Aggiungi Categoria");
            // request.setAttribute("currentUrl", request.getRequestURI());
            // Recupera la lista delle categorie dal database
            CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
            List<Categoria> categorie = categoriaDAO.getAllCategorie();  // Supponendo che ci sia un metodo per questo
            //System.out.println(categorie);
            // Setta le categorie come attributo nella request
            request.setAttribute("categorie", categorie);
            result.activate("/admin/categorie/aggiungiCategoria.ftl", request, response);  // Usa il template giusto per aggiungere
        }
    }

    private void handleListaCategorie(HttpServletRequest request, HttpServletResponse response)
            throws TemplateManagerException, DataException {
        // Recupera la lista delle categorie dal database
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
        List<Categoria> categorie = categoriaDAO.getAllCategorie();  // Supponendo che ci sia un metodo per questo

        // Setta le categorie come attributo nella request
        request.setAttribute("categorie", categorie);

        // Visualizza la lista delle categorie
        TemplateResult result = new TemplateResult(getServletContext());
        request.setAttribute("navbarTitle", "Lista Categorie");
        result.activate("/admin/categorie/categorie.ftl", request, response);  // Usa il template giusto per la lista
    }

    private void handleVisualizzaCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, TemplateManagerException, DataException, IOException {


        // Ottieni l'ID della categoria dall'URL
        String path = request.getRequestURI();
        String[] pathParts = path.split("/");
        String idString = pathParts[pathParts.length - 1];  // Ultima parte dell'URL è l'ID
        int categoriaId = Integer.parseInt(idString);

        // Ottieni il parametro 'status' dall'URL
    /*    String successMessage = request.getParameter("status");
        System.out.println(successMessage);
        // Se 'status' è presente, impostalo come attributo della richiesta
        if (successMessage != null) {
            request.setAttribute("status", successMessage);
        } */

        // Recupera la categoria dal database usando il DAO
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
        Categoria categoria = categoriaDAO.getCategoriaById(categoriaId);

        CaratteristicaDAO caratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCaratteristicaDAO();


        if (categoria != null) {

            if (request.getMethod().equalsIgnoreCase("POST")) {
                String action = request.getParameter("action");

                if ("modifica".equals(action)) {
                    // Gestisci la modifica della categoria
                    handleModificaCategoria(request, response, categoria);
                } else if ("elimina".equals(action)) {
                    // Gestisci l'eliminazione della categoria
                    handleEliminaCategoria(request, response, categoria);
                } else {
                    // Azione non valida, invia un errore
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                }
            } else {
                // Render della pagina di visualizzazione/modifica categoria
                // Recupera tutte le categorie per la selezione del padre
                List<Categoria> categorie = categoriaDAO.getAllCategorie();

                // Recupera le sottocategorie (figlie) della categoria attuale
                List<Categoria> categorieFiglie = categoriaDAO.getFiglieByCategoriaId(categoriaId);
                //   System.out.println("Figlieeeee"+categorieFiglie);


                if (categorie == null) {
                    categorie = new ArrayList<>(); // Evita errori di null
                }

                if (categorieFiglie == null) {
                    categorieFiglie = new ArrayList<>(); // Evita errori di null
                }

                // Crea una lista temporanea per contenere la categoria e le sottocategorie annidate
                List<Categoria> gerarchiaCategorie = new ArrayList<>();

                // Costruisce la gerarchia delle categorie partendo dalla categoria principale
                List<CategoriaWrapper> categoriaHierarchia = costruisciGerarchia(categoriaId, 1, categoriaDAO);

                // Imposta la categoria e le informazioni correlate come attributi della richiesta
                request.setAttribute("categoria", categoria);
                request.setAttribute("categoriaHierarchia", categoriaHierarchia); // Passa la gerarchia
                request.setAttribute("categorie", categorie);  // Tutte le categorie, per la selezione del padre
                //  request.setAttribute("categorieFiglie", categorieFiglie);  // Le categorie figlie
                request.setAttribute("navbarTitle", "Categoria " + categoria.getNome());
                //   System.out.println("gerarchia: " + categoriaHierarchia);
                // Carica il template FreeMarker per visualizzare la categoria
                TemplateResult result = new TemplateResult(getServletContext());

                //  System.out.println("Ci arrrivo");
                // System.out.println(categoriaId);
                List<Caratteristica> caratteristiche = caratteristicaDAO.getCaratteristicheByCategoria(categoriaId);
                //Recupero Caraterristiche
                request.setAttribute("caratteristiche", caratteristiche);


                result.activate("/admin/categorie/visualizzaCategoria.ftl", request, response);
            }


        } else {
            // Categoria non trovata, restituisci errore 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Categoria non trovata");
        }
    }

    // Classe per contenere la categoria e il livello nella gerarchia
    public class CategoriaWrapper {
        private Categoria categoria;
        private int livello;
        private List<CategoriaWrapper> sottocategorie;

        public CategoriaWrapper(Categoria categoria, int livello) {
            this.categoria = categoria;
            this.livello = livello;
            this.sottocategorie = new ArrayList<>();
        }

        public Categoria getCategoria() {
            return categoria;
        }

        public int getLivello() {
            return livello;
        }

        public List<CategoriaWrapper> getSottocategorie() {
            return sottocategorie;
        }

        public void setSottocategorie(List<CategoriaWrapper> sottocategorie) {
            this.sottocategorie = sottocategorie;
        }

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("CategoriaWrapper { ");
            sb.append("categoria = ").append(categoria != null ? categoria.getNome() : "null");
            sb.append(", livello = ").append(livello);
            sb.append(", sottocategorie = [");

            // Aggiungiamo tutte le sottocategorie in una stringa
            for (CategoriaWrapper sottocategoria : sottocategorie) {
                sb.append(sottocategoria.toString()).append(", ");
            }

            // Rimuove l'ultima virgola e spazio, se ci sono sottocategorie
            if (!sottocategorie.isEmpty()) {
                sb.setLength(sb.length() - 2); // Rimuove l'ultimo ", "
            }

            sb.append("] }");
            return sb.toString();
        }
    }

    // Metodo per creare la gerarchia delle categorie con livelli
    public List<CategoriaWrapper> costruisciGerarchia(int categoriaId, int livello, CategoriaDAO categoriaDAO) throws DataException {
        List<Categoria> sottocategorie = categoriaDAO.getFiglieByCategoriaId(categoriaId);
        List<CategoriaWrapper> result = new ArrayList<>();
        //     System.out.println("Sottocategorie +"+categoriaId);
        //     System.out.println(sottocategorie);
        for (Categoria categoria : sottocategorie) {
            CategoriaWrapper wrapper = new CategoriaWrapper(categoria, livello);
            // Chiamata ricorsiva per aggiungere le sottocategorie
            wrapper.setSottocategorie(costruisciGerarchia(categoria.getKey(), (livello + 1), categoriaDAO));
            result.add(wrapper);
        }

        return result;
    }

    // Metodo per gestire l'eliminazione della categoria
    private void handleEliminaCategoria(HttpServletRequest request, HttpServletResponse response, Categoria categoria) throws IOException, DataException {
        // Controlla se la categoria ha delle categorie figlie
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
   /*     List<Categoria> categorieFiglie = categoriaDAO.getCategorieFiglie(categoria.getKey()); // Implementa questo metodo nel DAO

        if (!categorieFiglie.isEmpty()) {
            // Se ci sono categorie figlie, restituisci un messaggio di errore
            request.setAttribute("errorMessage", "Non puoi eliminare questa categoria perché ha delle categorie figlie.");
            response.sendRedirect("/admin/categorie");
            return;
        }  */

        // Se non ci sono categorie figlie, procedi con l'eliminazione
        categoriaDAO.deleteCategoria(categoria);
        response.sendRedirect(request.getContextPath() + "/admin/categorie");
    }

    // Metodo per gestire la modifica della categoria
    private void handleModificaCategoria(HttpServletRequest request, HttpServletResponse response, Categoria categoria) throws IOException, DataException {
        // Ottieni i nuovi dati dalla richiesta
        String nuovoNome = request.getParameter("nome");
        String nuovoPadre = request.getParameter("padre");

        // Aggiorna la categoria con i nuovi dati
        categoria.setNome(nuovoNome);
        categoria.setPadre(nuovoPadre == null || nuovoPadre.isEmpty() ? null : Integer.parseInt(nuovoPadre));

        // Recupera il DAO per la categoria
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();

        // Salva la categoria aggiornata nel database
        categoriaDAO.storeCategoria(categoria); // Usa storeCategoria per salvare le modifiche

        // Reindirizza alla lista delle categorie dopo la modifica
        response.sendRedirect(request.getContextPath() + "/admin/categorie");
    }


}
