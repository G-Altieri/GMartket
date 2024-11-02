package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.Categoria;
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

public class AdminController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.AMMINISTRATORE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            //Recupero informazioni
            List<Categoria> categorie = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO().getAllCategorie();
            List<Utente> utenti = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getAllUtenti();
            request.setAttribute("numeroUtenti", utenti.size());
            request.setAttribute("numeroCategorie", categorie.size());

            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Dashboard Amministratore");

            result.activate("/admin/dashboardAdmin.ftl", request, response);


        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (DataException e) {
            throw new RuntimeException(e);
        }
    }
}

