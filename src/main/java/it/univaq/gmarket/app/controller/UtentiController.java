package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UtentiController extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String path = request.getRequestURI();  // Ottieni l'URL della richiesta

        try {
            if (path.endsWith("/aggiungi")) {
                handleAggiungiUtente(request, response);
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
        request.setAttribute("navbarTitle", "Gestione Utenti");
        result.activate("/admin/utenti/utenti.ftl", request, response);

    }

    private void handleAggiungiUtente(HttpServletRequest request, HttpServletResponse response) {
    }
}
