package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.*;
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
                int keyProposta = SecurityHelpers.checkNumeric(request.getParameter("key"));
                String valoreMod = request.getParameter("valoreMod");
                action_modificaProposta(request, response, keyProposta, valoreMod);
            } else if (action != null && action.equals("contrasegnaProposta")) {
                int keyProposta = SecurityHelpers.checkNumeric(request.getParameter("keyProposta"));
                String valoreMod = request.getParameter("statoValutazione");
                action_contrasegnaProposta(request, response, keyProposta, valoreMod);
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

            //Notifica al ordinante
            NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
            Notifica notifica = new NotificaImpl();
            notifica.setUtente(newProposta.getRichiesta().getOrdinante());
            notifica.setTitolo("Nuova Proposta!!!");
            notifica.setContenuto("Una nuova proposta per la richiesta #"+newProposta.getRichiesta().getCodice());
            notifica.setProposta(newProposta);
            notifica.setRichiesta(newProposta.getRichiesta());
            notificaDAO.storeNotifica(notifica);

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
        Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(key);
        if (valoreMod != null && valoreMod.equals("accetta")) {
            proposta.setStatoProposta(StatoProposta.ACCETTATO);
        } else {
            proposta.setStatoProposta(StatoProposta.RIFIUTATO);
            String moti = request.getParameter("motivazione");
            proposta.setMotivazione(moti);
        }
        //Aggiorno le modifiche
        ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().storeProposta(proposta);

        //Notifico il tecnico
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        Notifica notifica = new NotificaImpl();
        notifica.setUtente(proposta.getRichiesta().getTecnico());
        notifica.setTitolo("Aggiornamento Stato Proposta");
        notifica.setContenuto("La proposta #"+proposta.getCodiceProposta()+ " é stata valutata: "+proposta.getStatoProposta());
        notifica.setProposta(proposta);
        notifica.setRichiesta(proposta.getRichiesta());
        notificaDAO.storeNotifica(notifica);

        response.sendRedirect("/ordinante/lista-richieste");


    }

    private void action_contrasegnaProposta(HttpServletRequest request, HttpServletResponse response, int keyProposta, String valoreMod) throws DataException, IOException {
        Proposta proposta = ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().getProposta(keyProposta);

        switch (valoreMod) {
            case "ACCETTATO":
                proposta.setStatoOrdine(StatoOrdine.ACCETTATO);
                break;
            case "RESPINTO_NONFUNZIONANTE":
                proposta.setStatoOrdine(StatoOrdine.RESPINTO_NONFUNZIONANTE);
                break;
            case "RESPINTO_NONCONFORME":
                proposta.setStatoOrdine(StatoOrdine.RESPINTO_NONCONFORME);
                break;
        }

        proposta.setStatoProposta(StatoProposta.CONTRASSEGNATO);

        //Salvo Proposta
         ((AppDataLayer) request.getAttribute("datalayer")).getPropostaDAO().storeProposta(proposta);

        //Aggiorno la richiesta
        Richiesta richiesta = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(proposta.getRichiesta().getKey());
        richiesta.setStato(StatoRichiesta.COMPLETATO);
        ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().storeRichiesta(richiesta);

        //Notifica Tecnico
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        Notifica notifica = new NotificaImpl();
        notifica.setRuolo(Ruolo.TECNICO);
        notifica.setTitolo("Ordine Contrassegnato");
        notifica.setContenuto("L'ordine #"+proposta.getCodiceProposta()+ " é stata contrassegnato con: "+proposta.getStatoOrdine());
        notifica.setProposta(proposta);
        notifica.setRichiesta(proposta.getRichiesta());
        notifica.setOrdine(proposta);
        notificaDAO.storeNotifica(notifica);

        response.sendRedirect("/ordinante/lista-richieste");

    }
}
