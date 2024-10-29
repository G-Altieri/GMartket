package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.*;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

public class GestioneOrdine extends AppBaseController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            Utente u = SecurityHelpers.getUserSession(request, response);

            String action = request.getParameter("action");

            if (action != null && action.equals("spedizioneOrdine")) {
                int keyRichiesta = SecurityHelpers.checkNumeric(request.getParameter("keyRichiesta"));
                actionSpedisciOrdine(request, response, keyRichiesta);
            } else {

            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }

    }

    private void actionSpedisciOrdine(HttpServletRequest request, HttpServletResponse response, int key) throws IOException, ServletException, TemplateManagerException, DataException {

        Richiesta richiesta = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(key);

        richiesta.setStato(StatoRichiesta.SPEDITO);
        ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().storeRichiesta(richiesta);

        PropostaDAO propostaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO();
        Proposta proposta = propostaDAO.getPropostaAccettataByRichiesta(richiesta);

        proposta.setStatoProposta(StatoProposta.SPEDITO);
        proposta.setStatoOrdine(StatoOrdine.IN_ATTESA);
        proposta.setDataOrdine(new Timestamp(System.currentTimeMillis()));
        propostaDAO.storeProposta(proposta);

        //Notifica Ordinante
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        Notifica notifica = new NotificaImpl();
        notifica.setUtente(proposta.getRichiesta().getOrdinante());
        notifica.setTitolo("Ordine Spedito!!!");
        notifica.setContenuto("Il tuo ordine #"+proposta.getCodiceProposta()+ " é stata spedito in data: "+proposta.getDataOrdine());
        notifica.setProposta(proposta);
        notifica.setRichiesta(proposta.getRichiesta());
        notifica.setOrdine(proposta);
        notificaDAO.storeNotifica(notifica);


        response.sendRedirect("/tecnico");
    }


}
