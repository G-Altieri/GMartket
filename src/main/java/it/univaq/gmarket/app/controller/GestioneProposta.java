package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.PropostaImpl;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.StatoProposta;
import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;
import it.univaq.gmarket.framework.utils.GeneratoreCodice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

public class GestioneProposta extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {

            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;


            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);


            String action = request.getParameter("action");

            if (action != null && action.equals("inserisciRichiesta")) {
                inserimentoProposta(request, response, u);
            } else if (action != null && action.equals("modProposta")) {
                int keyProposta =SecurityHelpers.checkNumeric(request.getParameter("key"));
                String valoreMod = request.getParameter("valoreMod");
                action_modificaProposta(request, response, keyProposta, valoreMod);
            } else {
                renderPaginaCreazioneProposta(request, response, u);
            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }

    private void inserimentoProposta(HttpServletRequest request, HttpServletResponse response, Utente u) {
        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();

        Proposta newProposta = new PropostaImpl();

        try {
            newProposta.setCodiceProposta(GeneratoreCodice.generaCodiceUnivocoProposta(propostaDAO));
            newProposta.setNomeProdotto(request.getParameter("nome_prodotto"));
            newProposta.setNomeProduttore(request.getParameter("nome_produttore"));
            newProposta.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
            newProposta.setLink(request.getParameter("link"));
            newProposta.setNote(request.getParameter("note"));
            newProposta.setStatoProposta(StatoProposta.IN_SOSPESO);
            newProposta.setCreated_at(new Timestamp(System.currentTimeMillis()));
            newProposta.setRichiesta(((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(SecurityHelpers.checkNumeric(request.getParameter("id_richiesta"))));

            propostaDAO.storeProposta(newProposta);
            response.sendRedirect("/tecnico/lista-richiesteProprie");

        } catch (DataException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void renderPaginaCreazioneProposta(HttpServletRequest request, HttpServletResponse response, Utente u) throws TemplateManagerException {
        String idRichiesta = request.getParameter("idRichiesta");
        TemplateResult result = new TemplateResult(getServletContext());
        request.setAttribute("navbarTitle", "Creazione Proposta");
        request.setAttribute("id_richiesta", idRichiesta);
        result.activate("/tecnico/creazioneProposta.ftl", request, response);
    }

    private void action_modificaProposta(HttpServletRequest request, HttpServletResponse response, int key, String valoreMod) throws DataException, IOException {


        if(valoreMod != null && valoreMod.equals("accetta") ) {
            Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(key);
            proposta.setStatoProposta(StatoProposta.ACCETTATO);
            ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().storeProposta(proposta);
            response.sendRedirect("/ordinante/lista-richieste");
        }
        else {
            Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(key);
            proposta.setStatoProposta(StatoProposta.RIFIUTATO);
            String moti = request.getParameter("motivazione");
            proposta.setMotivazione(moti);
            ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().storeProposta(proposta);
            response.sendRedirect("/ordinante/lista-richieste");

        }
    }
}
