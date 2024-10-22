package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class TecnicoController  extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            HttpSession session = SecurityHelpers.checkSession(request);
            if (session == null) {
                // Se la sessione non è valida, torno login
                response.sendRedirect("login");
                return;
            }
            // trovo user
            int userId = (int) session.getAttribute("id");
            Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);

            if (u != null) {
                request.setAttribute("user", u);
            }

            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Dashboard Tecnico");
            result.activate("/tecnico/dashboardTecnico.ftl", request, response);


        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (DataException e) {
            throw new RuntimeException(e);
        }
    }
}