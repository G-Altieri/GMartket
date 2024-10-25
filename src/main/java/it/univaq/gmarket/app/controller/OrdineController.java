package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.Proposta;
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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrdineController extends AppBaseController{


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            Ruolo[] allowedRoles = { Ruolo.TECNICO, Ruolo.ORDINANTE };
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            Utente u = SecurityHelpers.getUserSession(request, response);

            String path = request.getRequestURI();
            System.out.println("entra qua in Request");
            if (path.endsWith("tecnico/lista-ordini")) {


                action_getOrdiniTec(request, response);
            } else if (path.endsWith("ordinante/lista-ordini")) {

                action_getOrdiniOrd(request, response, u);
            } else {

            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }

    }

    private void action_getOrdiniTec(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, DataException {


        RichiestaDAO richiestaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO();
        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();

        List<Richiesta> listRichieste1 = richiestaDAO.getRichiesteByCompletatoSpedite();
        List<Proposta> listProposte1 = new ArrayList<>();
        System.out.println("LIST RICHIESTE ORDINE");
        System.out.println(listRichieste1);
        for (Richiesta richiesta : listRichieste1) {
            listProposte1.add(propostaDAO.getPropostaSpeditaByRichiesta(richiesta));
        }

        List<Richiesta> listRichieste2 = richiestaDAO.getRichiesteByAssegnato();

        List<Proposta> listProposte2 = new ArrayList<>();

        for (Richiesta richiesta : listRichieste2) {
            listProposte2.add(propostaDAO.getPropostaAccettataByRichiesta(richiesta));
        }

        request.setAttribute("listProposte1", listProposte1);
        request.setAttribute("listProposte2", listProposte2);

        request.setAttribute("navbarTitle", "Lista Ordini");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/listaOrdini.ftl", request, response);

    }

    private void action_getOrdiniOrd(HttpServletRequest request, HttpServletResponse response, Utente u) throws IOException, ServletException, TemplateManagerException, DataException {



        RichiestaDAO richiestaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO();
        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();


        List<Richiesta> listRichieste1 = richiestaDAO.getRichiesteByCompletatoSpediteByOrdinante(u.getKey());

        List<Proposta> listProposte1 = new ArrayList<>();

        System.out.println(listRichieste1);
        for (Richiesta richiesta : listRichieste1) {
            listProposte1.add(propostaDAO.getPropostaSpeditaByRichiesta(richiesta));
        }

        List<Richiesta> listRichieste2 = richiestaDAO.getRichiesteByAssegnatoByOrdinante(u.getKey());
        List<Proposta> listProposte2 = new ArrayList<>();

        for (Richiesta richiesta : listRichieste2) {
            listProposte2.add(propostaDAO.getPropostaAccettataByRichiesta(richiesta));
        }

        request.setAttribute("listProposte1", listProposte1);
        request.setAttribute("listProposte2", listProposte2);

        request.setAttribute("navbarTitle", "Lista Ordini");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/listaOrdini.ftl", request, response);

    }


}


