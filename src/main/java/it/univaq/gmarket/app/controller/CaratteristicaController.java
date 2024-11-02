package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CaratteristicaController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //Check dei ruoli del utente
        Ruolo[] allowedRoles = {Ruolo.AMMINISTRATORE};
        SecurityHelpers.checkUserRole(request, response, allowedRoles);
        if (response.isCommitted()) return;

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "elimina":
                    action_delete(request, response);
                    break;
                case "modifica":
                    action_modifica(request, response);
                    break;
                case "aggiungi":
                    action_aggiungi(request, response);
                    break;
                default:
                    SecurityHelpers.disposeSession(request);
                    if (request.getParameter("referrer") != null) {
                        response.sendRedirect(request.getParameter("referrer"));
                    } else {
                        response.sendRedirect("/admin/categorie");
                    }
                    break;
            }
        }
    }

    private void action_aggiungi(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Recupero del DAO delle caratteristiche e categoria
        CaratteristicaDAO caratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCaratteristicaDAO();
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();

        // Recupero dei dati dal form
        String nome = request.getParameter("nome");
        String unitaDiMisura = request.getParameter("misura");
        String categoria = request.getParameter("categoria");
        try {
            // Creazione di una nuova istanza di Caratteristica
            Caratteristica nuovaCaratteristica = caratteristicaDAO.createCaratteristica();
            nuovaCaratteristica.setNome(nome);
            nuovaCaratteristica.setMisura(unitaDiMisura);
            nuovaCaratteristica.setCategoria( categoriaDAO.getCategoria(SecurityHelpers.checkNumeric(categoria)));

            // Salvataggio della nuova caratteristica nel database tramite store()
            caratteristicaDAO.storeCaratteristica(nuovaCaratteristica);

            // Reindirizzamento alla pagina precedente (referrer) o ad una pagina predefinita
            String referrer = request.getParameter("referrer");
            if (referrer != null && !referrer.isEmpty()) {
                response.sendRedirect(referrer);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/categorie");
            }
        } catch (DataException e) {
            throw new RuntimeException(e);  // Gestione dell'eccezione
        }
    }

    private void action_delete(HttpServletRequest request, HttpServletResponse response) throws IOException, DataException {
        CaratteristicaDAO caratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCaratteristicaDAO();
        int caratteristicaId = SecurityHelpers.checkNumeric(request.getParameter("id"));
        Caratteristica car = caratteristicaDAO.getCaratteristica(caratteristicaId);
        try {
            caratteristicaDAO.deleteCaratteristica(caratteristicaId);  // Funzione per eliminare la caratteristica
            // Reindirizzamento alla pagina precedente (referrer)
            String referrer = request.getParameter("referrer");
            if (referrer != null && !referrer.isEmpty()) {
                response.sendRedirect(referrer);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/categorie");
            }
        } catch (DataException e) {
            request.setAttribute("error","La Caratteristica non puo essere eliminata, ha dei riferimenti in delle richieste");
            response.sendRedirect("/admin/categorie/visualizza/"+car.getCategoria().getKey()+"?error=La Caratteristica non puo essere eliminata, ha dei riferimenti in delle richieste");
            throw new RuntimeException(e);
        }

    }

    private void action_modifica(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Recupero del DAO delle caratteristiche
        CaratteristicaDAO caratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCaratteristicaDAO();

        // Recupero dell'ID della caratteristica da modificare
        int caratteristicaId = Integer.parseInt(request.getParameter("id"));

        // Recupero dei nuovi valori dal form
        String nuovoNome = request.getParameter("nome");
        String nuovaUnitaDiMisura = request.getParameter("misura");

        try {
            // Recupero della caratteristica esistente tramite il suo ID
            Caratteristica caratteristicaEsistente = caratteristicaDAO.getCaratteristica(caratteristicaId);

            if (caratteristicaEsistente != null) {
                // Aggiornamento dei valori della caratteristica
                caratteristicaEsistente.setNome(nuovoNome);
                caratteristicaEsistente.setMisura(nuovaUnitaDiMisura);

                // Salvataggio dei cambiamenti tramite il metodo store()
                caratteristicaDAO.storeCaratteristica(caratteristicaEsistente);

                // Reindirizzamento alla pagina precedente (referrer) o ad una pagina predefinita
                String referrer = request.getParameter("referrer");
                if (referrer != null && !referrer.isEmpty()) {
                    response.sendRedirect(referrer);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/categorie");
                }
            } else {
                // Gestione del caso in cui la caratteristica non esista (reindirizzamento o gestione errori)
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Caratteristica non trovata");
            }
        } catch (DataException e) {
            throw new RuntimeException(e);  // Gestione dell'eccezione
        }
    }
}
