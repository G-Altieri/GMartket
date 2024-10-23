package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.RichiestaCaratteristica;
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

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            if (path.endsWith("/lista-richieste")) {

                action_getAllRichiesteTecnico(request, response);
            } else if  (path.endsWith("/lista-richiesteProprie")) {
                System.out.println("Entrato dentro process");
                assert u != null;
                action_getAllRichiesteByTecnico(request, response, u.getKey());
            }
            else if (path.endsWith("/dettagli-richiesta")) {
                TemplateResult result = new TemplateResult(getServletContext());
                request.setAttribute("navbarTitle", "Dettagli Richiesta");
                int richiestaId = Integer.parseInt(request.getParameter("key"));
                action_getDettagliRichiestaTec(request, response, richiestaId);
            }
            else {
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
        System.out.println("Entrato dentro il metodo giusto");

        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteByTecnico(key);
        System.out.println("1");
        request.setAttribute("richieste", richieste);
        request.setAttribute("navbarTitle", "Lista delle tue Richieste");
        System.out.println("Stai per entrare nel temp");
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
        request.setAttribute("categoria", richiesta.getCategoria());
        request.setAttribute("caratteristicheList", caratteristicheList);
        request.setAttribute("navbarTitle", "Dettaglio Richiesta #"+richiesta.getCodice());

        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/dettagliRichiesta.ftl", request, response);
    }


}