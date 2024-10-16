package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("navbarTitle", "Dashboard Amministratore");
            request.setAttribute("currentUrl", request.getRequestURI());
            result.activate("/admin/dashboardAdmin.ftl", request, response);
        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }
}
