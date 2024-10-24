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
            if (path.endsWith("/lista-ordini")) {
                System.out.println("entratoa nche nel path");

                action_getOrdiniCompletati(request, response);
            } else {

            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }

    }

    private void action_getOrdiniCompletati(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, DataException {


        RichiestaDAO richiestaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO();
        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();

        List<Richiesta> listRichieste = richiestaDAO.getRichiesteByCompletatoSpedite();
        List<Proposta> listProposte = new ArrayList<>();

        for (Richiesta richiesta : listRichieste) {
            listProposte.add(propostaDAO.getPropostaSpeditaByRichiesta(richiesta));
        }

        request.setAttribute("listProposte", listProposte);

        request.setAttribute("navbarTitle", "Lista Ordini");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/tecnico/listaOrdini.ftl", request, response);
        /*
        List<Richiesta> richieste = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getAllRichiesteOrdinante(key);
        request.setAttribute("richieste", richieste);
        request.setAttribute("codice", richieste);
        request.setAttribute("navbarTitle", "Lista Richieste Effettuate");
        TemplateResult res = new TemplateResult(getServletContext());
        res.activate("/ordinante/listaRichieste.ftl", request, response);

         */
    }

}


