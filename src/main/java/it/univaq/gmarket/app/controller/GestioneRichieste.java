package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.*;
import it.univaq.gmarket.data.model.impl.*;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;
import it.univaq.gmarket.framework.utils.EmailSender;
import it.univaq.gmarket.framework.utils.GeneratoreCodice;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestioneRichieste extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            String action = request.getParameter("action");

            int keyRichiesta;

            if (action != null && action.equals("submitRichiesta")) {
                action_storeRichiesta(request, response);
            } else if (action.equals("inCarico")) {
                keyRichiesta = SecurityHelpers.checkNumeric(request.getParameter("key"));
                action_prendiInCarico(request, response, keyRichiesta, u.getKey());
            }


        } catch (IOException | DataException ex) {
            handleError(ex, request, response);
        } catch (TemplateManagerException e) {
            throw new RuntimeException(e);
        }
    }

    private void action_storeRichiesta(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, DataException {
        Richiesta richiesta = new RichiestaImpl();  // Creo un'istanza di Richiesta

        HttpSession session = SecurityHelpers.checkSession(request);
        int userId = (int) session.getAttribute("id");
        Utente ordinante = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);

        richiesta.setOrdinante(ordinante);
        richiesta.setStato(StatoRichiesta.IN_ATTESA);

        Categoria categoria = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO().getCategoria(SecurityHelpers.checkNumeric(request.getParameter("categoria_figlio")));
        richiesta.setCategoria(categoria);

        String codice = GeneratoreCodice.generaCodiceUnivoco(((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO());
        richiesta.setCodice(codice);


        richiesta.setCreated_at(new Timestamp(System.currentTimeMillis()));


        String note = request.getParameter("note");
        if (note != null && !note.isEmpty()) {
            richiesta.setNote(note);
        } else {
            richiesta.setNote(null);  // Se non ci sono note, lascio null
        }

        // Salvo la nuova richiesta nel database
        ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().storeRichiesta(richiesta);

        //Numero di Caratteristiche
        int numCaratteristiche = SecurityHelpers.checkNumeric(request.getParameter("numCaratteristiche"));

        // Itero su ciascuna caratteristica
        for (int i = 0; i < numCaratteristiche; i++) {
            String caratteristicaKey = request.getParameter("caratteristica_key_" + i);
            String caratteristicaValue = request.getParameter("caratteristica_" + i);

            // Verifica che la caratteristica non sia vuota
            if (caratteristicaKey != null && !caratteristicaKey.isEmpty()) {
                RichiestaCaratteristica richiestaCaratteristica = new RichiestaCaratteristicaImpl();
                richiestaCaratteristica.setRichiesta(richiesta);

                // Recupera la caratteristica associata alla chiave
                Caratteristica caratteristica = ((AppDataLayer) request.getAttribute("datalayer"))
                        .getCaratteristicaDAO().getCaratteristica(SecurityHelpers.checkNumeric(caratteristicaKey));
                richiestaCaratteristica.setCaratteristica(caratteristica);

                // Gestisco il valore della caratteristica
                if (caratteristicaValue != null && !caratteristicaValue.isEmpty()) {
                    richiestaCaratteristica.setValore(caratteristicaValue);
                } else {
                    richiestaCaratteristica.setValore("indifferente");
                }
                // Salvo la caratteristica della richiesta nel database
                ((AppDataLayer) request.getAttribute("datalayer"))
                        .getRichiestaCaratteristicaDAO().storeRichiestaCaratteristica(richiestaCaratteristica);
            }
        }

        //Notifico tutti i tecnici
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        Notifica notifica = new NotificaImpl();
        notifica.setRuolo(Ruolo.TECNICO);
        notifica.setTitolo("Nuova Richiesta");
        notifica.setContenuto("Richiesta di "+ordinante.getNome()+" "+ordinante.getCognome()+" categoria: "+richiesta.getCategoria().getNome() );
        notifica.setRichiesta(richiesta);
        notificaDAO.storeNotifica(notifica);



        // Reindirizzo l'utente alla pagina delle richieste
        response.sendRedirect("/ordinante");
    }


    private void action_prendiInCarico(HttpServletRequest request, HttpServletResponse response, int keyRichiesta, int tecnico_id) throws IOException, ServletException, DataException, TemplateManagerException {
        Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(tecnico_id);

        Richiesta richiesta = ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().getRichiesta(keyRichiesta);
        richiesta.setStato(StatoRichiesta.ASSEGNATO);
        richiesta.setTecnico(u);
        ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO().storeRichiesta(richiesta);

        //Notifico l ordinante della presa in carico
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        Notifica notifica = new NotificaImpl();
        notifica.setUtente(richiesta.getOrdinante());
        notifica.setTitolo("La tua richiesta é stata presa in carico!!!");
        notifica.setContenuto("La richiesta #"+richiesta.getCodice()+" é stata presa in carico da: "+u.getNome()+" "+u.getCognome() );
        notifica.setRichiesta(richiesta);
        notificaDAO.storeNotifica(notifica);

        //Email per l'ordinante
        EmailSender sender = (EmailSender) getServletContext().getAttribute("emailsender");
        String subject = "Richiesta #"+richiesta.getCodice()+" presa in carico";
        String body = "Gentile utente,\n\n" +
                "Le informiamo che la richiesta #"+richiesta.getCodice()+" é stata presa in carico da: "+u.getNome()+" "+u.getCognome()+" \n\n" +
                "Saluti, \n" +
                "Il team di GMarket";

        sender.sendEmail(richiesta.getOrdinante().getEmail(), subject, body);

        response.sendRedirect("/tecnico");
    }


}
