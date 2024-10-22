package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.UtenteImpl;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

public class GestioneRichieste extends AppBaseController{

    private void action_default(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException {
        TemplateResult res = new TemplateResult(getServletContext());
        request.setAttribute("page_title", "Gestione Utenti");
        res.activate("/admin/utenti/utenti.ftl", request, response);
    }

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String action = request.getParameter("action");

            if (action != null && action.equals("listRichieste")) {

                action_getAllRichieste(request, response);
                // action_getAllRichieste(request, response);
            } else {
                action_default(request, response);
            }

        } catch (IOException | TemplateManagerException | DataException ex) {
            handleError(ex, request, response);
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
