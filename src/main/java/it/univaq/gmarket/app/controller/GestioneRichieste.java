package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaCaratteristicaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;
import it.univaq.gmarket.data.model.*;
import it.univaq.gmarket.data.model.impl.*;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;
import it.univaq.gmarket.framework.utils.GeneratoreCodice;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

public class GestioneRichieste extends AppBaseController{

    private void action_default(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException {
        TemplateResult res = new TemplateResult(getServletContext());
        request.setAttribute("page_title", "Gestione Utenti");
        res.activate("/admin/utenti/utenti.ftl", request, response);
    }

   /*
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String action = request.getParameter("action");

            if (action != null && action.equals("listRichieste")) {

                action_getAllRichieste(request, response);
                // action_getAllRichieste(request, response);
            } else {

                action_default(request, response);
            }

        } catch (IOException | TemplateManagerException | DataException ex) {
            handleError(ex, request, response);
        }
    }

    */

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        try {
            String action = request.getParameter("action");

            if (action != null && action.equals("submitRichiesta")) {

                action_storeRichiesta(request, response);

            } else {
                action_default(request, response);

            }

        } catch (IOException | TemplateManagerException | DataException ex) {
            handleError(ex, request, response);
        }
    }

    private void action_storeRichiesta(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, DataException {
        Richiesta richiesta = new RichiestaImpl();  // Creo un'istanza di Richiesta


        HttpSession session = SecurityHelpers.checkSession(request);
        int userId = (int) session.getAttribute("id");
        Utente ordinante = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);

        richiesta.setOrdinante(ordinante);


        richiesta.setStato(StatoRichiesta.IN_ATTESA);


        Categoria categoria = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO().getCategoria(SecurityHelpers.checkNumeric(request.getParameter("categoria_figlio")));
        richiesta.setCategoria(categoria);


        String codice = GeneratoreCodice.generaCodiceUnivoco(
                ((AppDataLayer) request.getAttribute("datalayer")).getRichiestaDAO());
        richiesta.setCodice(codice);
        System.out.println(codice);

        richiesta.setCreated_at(new Date());


        String note = request.getParameter("note");
        if (note != null && !note.isEmpty()) {
            richiesta.setNote(note);
        } else {
            richiesta.setNote(null);  // Se non ci sono note, lascio null
        }
        System.out.println("6");
        // Salvo la nuova richiesta nel database
        ((AppDataLayer) request.getAttribute("datalayer"))
                .getRichiestaDAO().storeRichiesta(richiesta);

        /* Recupero le caratteristiche associate alla categoria della richiesta
        List<Caratteristica> caratteristiche = ((AppDataLayer) request.getAttribute("datalayer"))
                .getCaratteristicaDAO().getCaratteristicheByCategoria(n);

        // Associo le caratteristiche alla richiesta
        for (Caratteristica caratteristica : caratteristiche) {
            RichiestaCaratteristica richiestaCaratteristica = new RichiestaCaratteristicaImpl();
            richiestaCaratteristica.setRichiesta(richiesta);  // Associo la richiesta
            richiestaCaratteristica.setCaratteristica(caratteristica);  // Associo la caratteristica

            // Gestisco il caso in cui il valore della caratteristica sia "indifferente"
            String indifferente = request.getParameter(caratteristica.getKey() + "-indifferente");
            if (indifferente != null && indifferente.equals("on")) {
                richiestaCaratteristica.setValore("indifferente");
            } else {
                // Altrimenti recupero il valore inserito dall'utente
                String valore = request.getParameter("caratteristica_" + caratteristica.getKey());
                if (valore != null && !valore.isEmpty()) {
                    richiestaCaratteristica.setValore(valore);
                } else {
                    richiestaCaratteristica.setValore("indifferente");
                }
            }

            // Salvo la caratteristica della richiesta nel database
            ((AppDataLayer) request.getAttribute("datalayer"))
                    .getRichiestaCaratteristicaDAO().storeRichiestaCaratteristica(richiestaCaratteristica);
        }

         */

        // Reindirizzo l'utente alla pagina delle richieste
        response.sendRedirect("richieste_ordinante");
    }





}
