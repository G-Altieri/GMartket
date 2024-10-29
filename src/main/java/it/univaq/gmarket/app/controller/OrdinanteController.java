package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.model.*;
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
                int richiestaId = SecurityHelpers.checkNumeric(request.getParameter("keyRichiesta"));
                action_getDettagliRichiesta(request, response, richiestaId);
            } else if (path.endsWith("/dettagli-proposta")) {
                TemplateResult result = new TemplateResult(getServletContext());
                int propostaId = SecurityHelpers.checkNumeric(request.getParameter("keyProposta"));
                action_getDettagliPropostaOrd(request, response, propostaId);
            } else {
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

    private void action_getDettagliPropostaOrd(HttpServletRequest request, HttpServletResponse response, int propostaId) throws TemplateManagerException, DataException, IOException {
        Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(propostaId);

        if (proposta == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Proposta non trovata");
            return;
        }

        request.setAttribute("proposta", proposta);
        if( proposta.getStatoOrdine() == null){
            request.setAttribute("navbarTitle", "Dettaglio Proposta #" + proposta.getCodiceProposta());
        }else{
            request.setAttribute("navbarTitle", "Dettaglio Ordine #" + proposta.getCodiceProposta());
        }


        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/dettagliProposta.ftl", request, response);
    }


    private void action_getAllRichiesteOrdinante(HttpServletRequest request, HttpServletResponse response, int keyUtente) throws IOException, ServletException, TemplateManagerException, DataException {

        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteOrdinante(keyUtente);
        request.setAttribute("richieste", richieste);
        request.setAttribute("codice", richieste);
        request.setAttribute("navbarTitle", "Le mie Richieste");

        //Gestione Notifiche
        List<Notifica> notifiche = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO().getNotificheUserMyRichieste(keyUtente);
        request.setAttribute("notifiche", notifiche);

        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/listaRichieste.ftl", request, response);


    }

    private void action_getDettagliRichiesta(HttpServletRequest request, HttpServletResponse response, int richiestaId)
            throws IOException, ServletException, TemplateManagerException, DataException {

        Richiesta richiesta = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(richiestaId);
        RichiestaCaratteristicaDAO richiestaCaratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaCaratteristicaDAO();

        List<RichiestaCaratteristica> caratteristicheList = richiestaCaratteristicaDAO.getRichiesteCaratteristicaByRichiesta(richiesta.getKey());

        if (richiesta == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Richiesta non trovata");
            return;
        }

        request.setAttribute("richiesta", richiesta);


        request.setAttribute("caratteristicheList", caratteristicheList);
        request.setAttribute("navbarTitle", "Dettaglio Richiesta #" + richiesta.getCodice());


        request.setAttribute("caratteristicheList", caratteristicheList);
        request.setAttribute("navbarTitle", "Dettaglio Richiesta #" + richiesta.getCodice());

        //Proposte
        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();
        List<Proposta> listProposte = propostaDAO.getAllProposteByRichiesta(richiesta);

        if (listProposte != null && !listProposte.isEmpty()) {
            request.setAttribute("ultimaProposta", listProposte.get(0).getStatoProposta());
        } else {
            request.setAttribute("ultimaProposta", "");
        }
        request.setAttribute("listProposte", listProposte);


        //Gestione Notifiche
        Utente u = SecurityHelpers.getUserSession(request, response);
        List<Notifica> notifiche = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO().getNotificheUserMyRichiesteProposte(u.getKey());
        request.setAttribute("notifiche", notifiche);



        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/dettagliRichiesta.ftl", request, response);
    }


}
