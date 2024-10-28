package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GestioneNotifiche extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {

            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            if (path.endsWith("/tecnico/read-notifica")) {
                action_readNotifica(request, response);
            } else {
                response.sendRedirect("/home");
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void action_readNotifica(HttpServletRequest request, HttpServletResponse response) throws DataException {
        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
        int key = SecurityHelpers.checkNumeric(request.getParameter("key"));
        Notifica notifica = notificaDAO.getNotifica(key);
        notifica.setLetta(true);
        notificaDAO.storeNotifica(notifica);
        return;
    }

}
