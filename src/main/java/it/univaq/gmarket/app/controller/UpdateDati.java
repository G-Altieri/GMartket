package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
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
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdateDati extends AppBaseController {

    private void action_default(HttpServletRequest request, HttpServletResponse response, int userId) throws IOException, ServletException, TemplateManagerException, DataException {
        TemplateResult res = new TemplateResult(getServletContext());
        Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);
        request.setAttribute("utente", u);  // Aggiungi questa riga
        String ruolo = u.getRuolo().toString();
        request.setAttribute("ruolo", ruolo);
        request.setAttribute("page_title", "Modifica Utente");
        request.setAttribute("user_type", u.getRuolo().toString());
        res.activate("/admin/utenti/utenteModifica.ftl", request, response);
    }


    private void action_update(HttpServletRequest request, HttpServletResponse response, int userId) throws IOException, ServletException, TemplateManagerException, DataException, NoSuchAlgorithmException, InvalidKeySpecException {


        String newEmail = request.getParameter("new-email");
        String newNome = request.getParameter("new-nome");
        String newCognome = request.getParameter("new-cognome");
        String newP = request.getParameter("new-password");



        // Controllo che tutti i campi siano compilati
        if (newP == null || newP.trim().isEmpty() ||  newEmail == null || newEmail.trim().isEmpty()  || newNome == null || newNome.trim().isEmpty()  || newCognome == null || newCognome.trim().isEmpty()) {
            request.setAttribute("errore", "Tutti i campi devono essere compilati!");
            action_default(request, response, userId);
            return;
        }

        Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);




        String hashedPass = SecurityHelpers.getPasswordHashPBKDF2(newP);
        u.setEmail(newEmail);
        u.setNome(newNome);
        u.setCognome(newCognome);
        u.setPassword(hashedPass);
        ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().storeUtente(u);


        response.sendRedirect("/admin/utenti");


    }


    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  throws ServletException {
        try {
            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.AMMINISTRATORE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            // Recupera l'ID dall'input hidden del form
            int userId = Integer.parseInt(request.getParameter("id")); // Recupero dell'ID

            String action = request.getParameter("action");



            if (action != null && action.equals("update")) {// Verifica dell'azione

                action_update(request, response, userId); // Passo l'ID all'action_update
            } else {
                action_default(request, response, userId);
            }

        } catch (IOException | TemplateManagerException | DataException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
            handleError(ex, request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Modifica utente servlet";
    }

}
