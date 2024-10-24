package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GeneralController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {

            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.AMMINISTRATORE, Ruolo.ORDINANTE, Ruolo.TECNICO};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            if (u == null) {
                response.sendRedirect("/logout");
            }

            Ruolo role = u.getRuolo();
            String redirect = "";
            switch (role) {
                case AMMINISTRATORE -> {
                    redirect = "/admin";
                }
                case ORDINANTE -> {
                    redirect = "/ordinante";
                }
                case TECNICO -> {
                    redirect = "/tecnico";
                }
            }

            response.sendRedirect(redirect);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
