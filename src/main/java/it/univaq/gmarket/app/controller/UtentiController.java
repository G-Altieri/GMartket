package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UtentiController extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String path = request.getRequestURI();  // Ottieni l'URL della richiesta
        System.out.println("Ci passo?");
        try {
            if (path.endsWith("/aggiungi")) {
                System.out.println("qua si");
                rendereizzaFormAggiungi(request, response);
            } else if (path.endsWith("/utenti")) {
                renderizzaUtenti(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IOException | TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }

    private void renderizzaUtenti(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        TemplateResult result = new TemplateResult(getServletContext());

        try {
            // Ottieni la lista degli utenti dal database
            List<Utente> utenti = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getAllUtenti();

            // Imposta gli utenti come attributo nella request
            request.setAttribute("utenti", utenti);
            request.setAttribute("navbarTitle", "Gestione Utenti");

            // Attiva il template
            result.activate("/admin/utenti/utenti.ftl", request, response);
        } catch (DataException ex) {
            throw new TemplateManagerException("Errore nel recupero degli utenti", ex);
        }
    }

    private void rendereizzaFormAggiungi(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException {
        TemplateResult result = new TemplateResult(getServletContext());

        try {
            // Ottieni la lista degli utenti dal database
            List<Utente> utenti = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getAllUtenti();

            // Imposta gli utenti come attributo nella request
            request.setAttribute("utenti", utenti);
            request.setAttribute("navbarTitle", "Gestione Utenti");

            // Attiva il template
            result.activate("/admin/utenti/utentiAggiungi.ftl", request, response);
        } catch (DataException | TemplateManagerException ex) {
            throw new TemplateManagerException("Errore nel recupero degli utenti", ex);
        }
    }
}
