package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.NotificaDAO;
import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.NotificaImpl;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GestioneNotifiche extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {

            Ruolo[] allowedRoles = {Ruolo.TECNICO, Ruolo.ORDINANTE, Ruolo.AMMINISTRATORE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String path = request.getRequestURI();
            Utente u = SecurityHelpers.getUserSession(request, response);

            if (path.endsWith("/tecnico/read-notifica")) {
                action_readNotifica(request, response);
            } else if (path.endsWith("/notifiche")) {
                action_paginaNotifiche(request, response);
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


    private void action_paginaNotifiche(HttpServletRequest request, HttpServletResponse response) throws TemplateManagerException, IOException, DataException {
        TemplateResult res = new TemplateResult(getServletContext());

        request.setAttribute("navbarTitle", "Notifiche");

        //Notifiche
        Utente u = SecurityHelpers.getUserSession(request, response);
        List<Notifica> notificheAll = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO().getNotificheAllUser(u.getKey());
        List<Notifica> notificheNonLette = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO().getNotificheNonLetteUser(u.getKey());
        request.setAttribute("notificheAll", notificheAll);
        request.setAttribute("notificheNonLette", notificheNonLette);


        res.activate("/notifiche.ftl", request, response);
    }

//
//    private static void generaNotifica(HttpServletRequest request, HttpServletResponse response, Utente ordinante, Richiesta richiesta,
//    Proposta proposta, Proposta ordine, Ruolo ruolo){
//        System.out.println("Notifiche");
//        NotificaDAO notificaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO();
//        Notifica notifica = new NotificaImpl();
//        notifica.setRuolo(Ruolo.TECNICO);
//        notifica.setTitolo("Nuova Richiesta");
//        notifica.setContenuto("Richiesta di "+ordinante.getNome()+" "+ordinante.getCognome()+" categoria: "+richiesta.getCategoria().getNome() );
//        notifica.setRichiesta(richiesta);
//        notificaDAO.storeNotifica(notifica);
//    }
    public static void navbarNotifiche(HttpServletRequest request, HttpServletResponse response){
        //Notifiche
        Utente u = null;
        try {
            u = SecurityHelpers.getUserSession(request, response);
            if (u != null) {
                List<Notifica> notificheNonLette = ((AppDataLayer) request.getAttribute("datalayer")).getNotificaDAO().getNotificheNonLetteUser(u.getKey());
                request.setAttribute("notificheNonLette", notificheNonLette);
            }

        } catch (IOException | DataException e) {
            throw new RuntimeException(e);
        }
    }

}
