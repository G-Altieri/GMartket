package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class TecnicoController  extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            Ruolo[] allowedRoles = { Ruolo.TECNICO };
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;


            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Dashboard Tecnico");
            result.activate("/tecnico/dashboardTecnico.ftl", request, response);


        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void action_getAllRichieste(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, DataException {
        // Ottieni la lista di tutti gli utenti tramite il DAO
        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichieste();

        // Imposta la lista delle richieste come attributo nella request
        request.setAttribute("richieste", richieste);


        // Attiva il template FreeMarker per visualizzare la lista
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/listaRichieste.ftl", request, response);
    }
}