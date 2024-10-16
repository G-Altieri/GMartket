package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
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

        // Recupera la categoria dal database usando il DAO
        CategoriaDAO categoriaDAO = ((AppDataLayer)request.getAttribute("datalayer")).getCategoriaDAO();
        Categoria categoria = categoriaDAO.getCategoriaById(categoriaId);


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
                List<Categoria> categorie = categoriaDAO.getAllCategorie();
                // Imposta la categoria come attributo della richiesta
                request.setAttribute("categoria", categoria);
                request.setAttribute("categorie", categorie);
                request.setAttribute("navbarTitle", "Categoria "+categoria.getNome());
                // Carica il template FreeMarker per visualizzare la categoria
                TemplateResult result = new TemplateResult(getServletContext());
                result.activate("/admin/categorie/visualizzaCategoria.ftl", request, response);
            }





        } else {
            // Categoria non trovata, restituisci errore 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Categoria non trovata");
        }
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
