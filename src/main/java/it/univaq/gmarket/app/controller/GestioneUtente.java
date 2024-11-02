package it.univaq.gmarket.app.controller;

import com.sun.jdi.connect.spi.Connection;
import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.data.model.impl.UtenteImpl;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;


public class GestioneUtente extends AppBaseController {

    private void action_default(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException {
        TemplateResult result = new TemplateResult(getServletContext());

        try {
            // Ottieni la lista degli utenti dal database
            List<Utente> utenti = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getAllUtenti();

            // Imposta gli utenti come attributo nella request
            request.setAttribute("utenti", utenti);
            request.setAttribute("navbarTitle", "Gestione Utente");

            // Attiva il template
            result.activate("/admin/utenti/utentiAggiungi.ftl", request, response);
        } catch (DataException | TemplateManagerException ex) {
            throw new TemplateManagerException("Errore nel recupero degli utenti", ex);
        }
    }

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            //Check dei ruoli del utente
            Ruolo[] allowedRoles = {Ruolo.AMMINISTRATORE};
            SecurityHelpers.checkUserRole(request, response, allowedRoles);
            if (response.isCommitted()) return;

            String action = request.getParameter("action");

            if (action != null && action.equals("createUser")) {
                action_createUser(request, response);
            } else if (action != null && action.equals("listUtenti")) {
                action_getAllUtenti(request, response);
            } else if (action != null && action.equals("update")) {
                int userId = SecurityHelpers.checkNumeric(request.getParameter("id"));
                action_update(request, response, userId); // Passo l'ID all'action_update
            }else if (action != null && action.equals("modifica")) {
                int userId = SecurityHelpers.checkNumeric(request.getParameter("id"));
                renderPageModifica(request, response, userId); // Passo l'ID all'action_update
            } else {
                action_default(request, response);
            }

        } catch (IOException | TemplateManagerException | DataException | NoSuchAlgorithmException |
                 InvalidKeySpecException ex) {
            handleError(ex, request, response);
        }
    }


    private void action_createUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, NoSuchAlgorithmException, InvalidKeySpecException, DataException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("temp-password");
        String confirmPassword = request.getParameter("confirm-password");
        String roleParam = request.getParameter("role");

        if (nome == null || email == null || password == null || confirmPassword == null || roleParam == null) {
            request.setAttribute("error", "Tutti i campi sono obbligatori.");
            action_default(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Le password non coincidono.");
            action_default(request, response);
            return;
        }

        // controllo se lo username esiste già nel database
        Utente existingUser = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtenteByEmail(email);

        if (existingUser != null) {
            request.setAttribute("error", "Questa email è già utilizzato");
            action_default(request, response);
            return;
        }

        Ruolo role = Ruolo.valueOf(roleParam.toUpperCase());
        String hashedPass = SecurityHelpers.getPasswordHashPBKDF2(password);

        Utente utenteNuovo = new UtenteImpl();
        utenteNuovo.setNome(nome);
        utenteNuovo.setCognome(cognome);
        utenteNuovo.setEmail(email);
        utenteNuovo.setPassword(hashedPass);
        utenteNuovo.setRuolo(role);

        ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().storeUtente(utenteNuovo);
        /*
        try {
            // Questa poi voglio spostarla ma ora funziona e rimane così
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.outlook.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication("webmarket.univaq@outlook.com", "geagiuliasamanta1");
                }
            });

            String subject = "Benvenuto in WebMarket";
            String body = "Ciao e Benvenuto in WebMarket,\n\n" +
                    "Ecco le tue credenziali per accedere:\n" +
                    "Email: " + email + "\n" +
                    "Password temporanea: " + password + "\n\n" +
                    "Ti consigliamo di cambiare la tua password al primo accesso.\n\n";

            EmailSender.sendEmail(session, email, subject, body);
            request.setAttribute("success", "Utente creato con successo e email inviata!");
        } catch (Exception e) {
            request.setAttribute("error", "Utente creato con successo, ma si è verificato un problema durante l'invio dell'email.");
            e.printStackTrace();
        }

         */

        // action_default(request, response);
        response.sendRedirect("/admin/utenti");
    }


    private void action_getAllUtenti(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, TemplateManagerException, DataException {
        try {
            // Ottieni la lista di tutti gli utenti tramite il DAO
            List<Utente> utenti = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getAllUtenti();

            // Imposta la lista degli utenti come attributo nella request
            request.setAttribute("utenti", utenti);

            request.setAttribute("navbarTitle", "Gestione Utenti");

            // Attiva il template FreeMarker per visualizzare la lista
            TemplateResult res = new TemplateResult(getServletContext());
            res.activate("/admin/utenti/utenti.ftl", request, response);
        } catch (DataException ex) {
            throw new ServletException("Errore nel recupero degli utenti dal database", ex);
        }
    }


    private void action_update(HttpServletRequest request, HttpServletResponse response, int userId) throws IOException, ServletException, TemplateManagerException, DataException, NoSuchAlgorithmException, InvalidKeySpecException {


        String newEmail = request.getParameter("new-email");
        String newNome = request.getParameter("new-nome");
        String newCognome = request.getParameter("new-cognome");
        String newP = request.getParameter("new-password");


        // Controllo che tutti i campi siano compilati
        if (newP == null || newP.trim().isEmpty() || newEmail == null || newEmail.trim().isEmpty() || newNome == null || newNome.trim().isEmpty() || newCognome == null || newCognome.trim().isEmpty()) {
            request.setAttribute("error", "Tutti i campi devono essere compilati!");
            TemplateResult res = new TemplateResult(getServletContext());
            Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);
            request.setAttribute("utente", u);  // Aggiungi questa riga
            String ruolo = u.getRuolo().toString();
            request.setAttribute("ruolo", ruolo);
            request.setAttribute("navbarTitle", "Gestione Utente ");


            request.setAttribute("user_type", u.getRuolo().toString());
            res.activate("/admin/utenti/utenteModifica.ftl", request, response);
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

    private void renderPageModifica(HttpServletRequest request, HttpServletResponse response, int userId) throws IOException, ServletException, TemplateManagerException, DataException {
        TemplateResult res = new TemplateResult(getServletContext());
        Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtente(userId);
        request.setAttribute("utente", u);  // Aggiungi questa riga
        String ruolo = u.getRuolo().toString();
        request.setAttribute("ruolo", ruolo);
        request.setAttribute("navbarTitle", "Gestione Utente ");


        request.setAttribute("user_type", u.getRuolo().toString());
        res.activate("/admin/utenti/utenteModifica.ftl", request, response);
    }


}
