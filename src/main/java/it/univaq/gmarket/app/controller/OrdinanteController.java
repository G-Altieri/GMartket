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

public class OrdinanteController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            Ruolo[] allowedRoles = { Ruolo.ORDINANTE };
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            Utente u = SecurityHelpers.getUserSession(request, response);

            String path = request.getRequestURI();

            if (path.endsWith("/lista-richieste")) {
                
                action_getAllRichiesteOrdinante(request, response, u.getKey());
            } else if (path.endsWith("/dettagli-richiesta")) {

                int richiestaId = Integer.parseInt(request.getParameter("key"));
                action_getDettagliRichiesta(request, response, richiestaId);
            }
            else {

                TemplateResult result = new TemplateResult(getServletContext());
                request.setAttribute("navbarTitle", "Dashboard Ordinante");
                result.activate("/ordinante/dashboardOrdinante.ftl", request, response);
            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }

    }


    private void action_getAllRichiesteOrdinante(HttpServletRequest request, HttpServletResponse response, int key) throws IOException, ServletException, TemplateManagerException, DataException {

        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteOrdinante(key);
        request.setAttribute("richieste", richieste);
        request.setAttribute("codice", richieste);
        request.setAttribute("navbarTitle", "Lista Richieste Effettuate");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/listaRichieste.ftl", request, response);
    }

    private void action_getDettagliRichiesta(HttpServletRequest request, HttpServletResponse response, int richiestaId)
            throws IOException, ServletException, TemplateManagerException, DataException {

        Richiesta richiesta = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(richiestaId);

        if (richiesta == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Richiesta non trovata");
            return;
        }

        request.setAttribute("codice", richiesta.getCodice());
        request.setAttribute("nomeOrdinante", richiesta.getOrdinante().getNome());

        if (richiesta.getTecnico() != null) {
            request.setAttribute("nomeTecnico", richiesta.getTecnico().getNome());
        } else {
            request.setAttribute("nomeTecnico", "Non assegnato");
        }

        request.setAttribute("note", richiesta.getNote());
        request.setAttribute("statoRichiesta", richiesta.getStato());
        request.setAttribute("dataCreazione", richiesta.getCreated_at());

        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/dettagliRichiesta.ftl", request, response);
    }
}
