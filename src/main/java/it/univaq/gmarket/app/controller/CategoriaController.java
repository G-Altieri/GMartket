package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.dao.CategoriaDAO;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
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
                nuovaCategoria.setPadre(Integer.parseInt(padreCategoria));
            } else {
                nuovaCategoria.setPadre(0);  // Se non c'è un padre, si imposta a 0
            }

            categoriaDAO.storeCategoria(nuovaCategoria);

            response.sendRedirect(request.getContextPath() + "/successo"); // Dopo l'inserimento, ridireziona l'utente
        } else {
            // GET: Visualizza il form per aggiungere una categoria
            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Aggiungi Categoria");
            request.setAttribute("currentUrl", request.getRequestURI());
            result.activate("/admin/categorie/aggiungi.ftl", request, response);  // Usa il template giusto per aggiungere
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
}
