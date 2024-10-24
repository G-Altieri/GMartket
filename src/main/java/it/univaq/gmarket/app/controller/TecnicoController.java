package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;

import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.StatoProposta;
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

public class TecnicoController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            Ruolo[] allowedRoles = {Ruolo.TECNICO};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            if (path.endsWith("/lista-richieste")) {
                action_getAllRichiesteTecnico(request, response);
            } else if (path.endsWith("/lista-richiesteProprie") && u != null) {
                action_getAllRichiesteByTecnico(request, response, u.getKey());
            } else if (path.endsWith("/dettagli-richiesta")) {
                TemplateResult result = new TemplateResult(getServletContext());
                int richiestaId = SecurityHelpers.checkNumeric(request.getParameter("keyRichiesta"));
                action_getDettagliRichiestaTec(request, response, richiestaId);
            } else if (path.endsWith("/dettagli-proposta")) {
                TemplateResult result = new TemplateResult(getServletContext());
                int propostaId = SecurityHelpers.checkNumeric(request.getParameter("keyProposta"));
                action_getDettagliPropostaTec(request, response, propostaId);
            } else {
                TemplateResult result = new TemplateResult(getServletContext());
                request.setAttribute("navbarTitle", "Dashboard Tecnico");
                result.activate("/tecnico/dashboardTecnico.ftl", request, response);
            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }
    }


    private void action_getAllRichiesteTecnico(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, DataException {

        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteTecnico();
        request.setAttribute("richieste", richieste);
        request.setAttribute("navbarTitle", "Lista di tutte le Richieste");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/listaRichieste.ftl", request, response);
    }

    private void action_getAllRichiesteByTecnico(HttpServletRequest request, HttpServletResponse response, int key) throws IOException, ServletException, TemplateManagerException, DataException {
        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteByTecnico(key);

        request.setAttribute("richieste", richieste);
        request.setAttribute("navbarTitle", "Lista delle tue Richieste");
        TemplateResult res = new TemplateResult(getServletContext());

        res.activate("/tecnico/listaRichiesteByTecnico.ftl", request, response);
    }

    private void action_getDettagliRichiestaTec(HttpServletRequest request, HttpServletResponse response, int richiestaId)
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

        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/dettagliRichiesta.ftl", request, response);

    }

    private void action_getDettagliPropostaTec(HttpServletRequest request, HttpServletResponse response, int propostaId)
            throws IOException, ServletException, TemplateManagerException, DataException {

        Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(propostaId);

        if (proposta == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Proposta non trovata");
            return;
        }

        request.setAttribute("proposta", proposta);
        request.setAttribute("navbarTitle", "Dettaglio Proposta #" + proposta.getCodiceProposta());

        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/dettagliProposta.ftl", request, response);

    }

}