package it.univaq.gmartket.app.controller;

import it.univaq.gmartket.framework.result.TemplateManagerException;
import it.univaq.gmartket.framework.result.TemplateResult;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            TemplateResult result = new TemplateResult(getServletContext());
            request.setAttribute("includeHeader", true);
            request.setAttribute("includeFooter", true);
            request.setAttribute("currentUrl", request.getRequestURI());
            result.activate("dashboardAdmin.ftl", request, response);
        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }
}
