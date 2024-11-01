package it.univaq.gmarket.app.controller;


//import it.univaq.gmartket.data.model.Utente;

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

public class LoginController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            if (request.getParameter("login") != null) {
                handleLogin(request, response);
            } else {
                String https_redirect_url = SecurityHelpers.checkHttps(request);
                request.setAttribute("https-redirect", https_redirect_url);
                renderLoginPage(request, response);
            }
        } catch (IOException | TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }


    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateManagerException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Controllo per vedere se e login semplificato
        if (email.equals("generale@generale.com") && password.equals("generale")) {
            Ruolo role = Ruolo.valueOf(request.getParameter("role"));
            loginSemplificato(request, response, role, email);
            return;
        }

        try {
            // Se non ha inserito email e password redireziono con errore
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "x");
                renderLoginPage(request, response);
            }

            //Recupero l utente nel db se esiste
            AppDataLayer dl = (AppDataLayer) request.getAttribute("datalayer");
            Utente u = dl.getUtenteDAO().getUtenteByEmail(email);

            if (u == null) {
                request.setAttribute("error", "x");
                renderLoginPage(request, response);
                return;
            }

            Ruolo role = u.getRuolo();

            System.out.println("email " + email + " password " + password + " ruolo " + role);

            // Mi prendo la sessione in caso esista già
            HttpSession s = SecurityHelpers.checkSession(request);

            // Se mi ero loggato con un ruolo, è scaduta la sessione e sto cambiando ruolo,
            // redireziono verso la dashboard corretta per il nuovo ruolo
            if (s != null && s.getAttribute("role") != null && !s.getAttribute("role").equals(role)) {
                s.invalidate();
                handleRedirect(role, request, response);
                return;
            }


            // Se la password è errata
            if (u == null || !SecurityHelpers.checkPasswordHashPBKDF2(password, u.getPassword())) {
                request.setAttribute("error", "x");
                renderLoginPage(request, response);
                return;
            }

            // Creo la sessione
            SecurityHelpers.createSession(request, email, u.getKey(), u.getRuolo());

            // Se ha un referrer, lo reindirizzo lì
            if (request.getParameter("referrer") != null) {
                response.sendRedirect(request.getParameter("referrer"));
                return;
            }

            // Reindirizzo in base al ruolo
            handleRedirect(role, request, response);

        } catch (NoSuchAlgorithmException | InvalidKeySpecException | DataException e) {
            //Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            handleError(e, request, response);
        }

    }

    private void loginSemplificato(HttpServletRequest request, HttpServletResponse response, Ruolo role, String email) throws IOException {
        int idUtente = 0;
        switch (role) {
            case ORDINANTE:
                idUtente = 1;
                break;
            case TECNICO:
                idUtente = 2;
                break;
            case AMMINISTRATORE:
                idUtente = 3;
                break;
            default:
                handleError("Login fallito!", request, response);
        }
        // Creo la sessione
        SecurityHelpers.createSession(request, email, idUtente, role);

        // Se ha un referrer, lo reindirizzo lì
        if (request.getParameter("referrer") != null) {
            response.sendRedirect(request.getParameter("referrer"));
            return;
        }

        // Reindirizzo in base al ruolo
        handleRedirect(role, request, response);

    }


    private void handleRedirect(Ruolo role, HttpServletRequest request, HttpServletResponse response) throws IOException {
        switch (role) {
            case ORDINANTE:
                response.sendRedirect("/ordinante");
                break;
            case TECNICO:
                response.sendRedirect("/tecnico");
                break;
            case AMMINISTRATORE:
                response.sendRedirect("/admin");
                break;
            default:
                handleError("Login fallito!", request, response);
        }
    }


    private void renderLoginPage(HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateManagerException {
        TemplateResult result = new TemplateResult(getServletContext());
        //    AppDataLayer dl = (AppDataLayer) request.getAttribute("datalayer");
        // Per questi errori preferisco avere una gestione con messaggio direttamente
        // nella pagina di login in modo tale da poter far loggare l'utente più velocemente
        //if (request.getParameter("error") != null) displayError(datamodel, request.getParameter("error"));
        request.setAttribute("referrer", request.getParameter("referrer"));
        request.setAttribute("includeHeader", false);
        request.setAttribute("includeFooter", false);
        result.activate("login.ftl", request, response);
    }
}