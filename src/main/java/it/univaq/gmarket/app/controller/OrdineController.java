package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
public class OrdineController extends AppBaseController{


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            Ruolo[] allowedRoles = { Ruolo.TECNICO, Ruolo.ORDINANTE };
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            Utente u = SecurityHelpers.getUserSession(request, response);

            String path = request.getRequestURI();

            if (path.endsWith("/robadiGiova")) {

                int keyRichiesta = Integer.parseInt(request.getParameter("keyRichiesta"));
                actionOrdine(request, response, keyRichiesta);
            } else {

            }

        } catch (TemplateManagerException ex) {
            handleError(ex, request, response);
        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }

    }

}


 */