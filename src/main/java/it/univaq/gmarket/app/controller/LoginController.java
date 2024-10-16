package it.univaq.gmarket.app.controller;


//import it.univaq.gmartket.data.model.Utente;

import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends AppBaseController {
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            if (request.getParameter("login") != null) {
                handleLogin(request, response);
            } else {
                //String https_redirect_url = SecurityHelpers.checkHttps(request);
                //request.setAttribute("https-redirect", https_redirect_url);
                renderLoginPage(request, response);
            }
        } catch (IOException | TemplateManagerException ex) {
            handleError(ex, request, response);
        }
    }


    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, TemplateManagerException {
        response.sendRedirect("/admin");
       /* String email = request.getParameter("email");
        String password = request.getParameter("password");
        Ruolo role = Ruolo.valueOf(request.getParameter("role"));


        System.out.println("email " + email + " password " + password + " ruolo " + role);
        // Mi prendo la sessione in caso esista già
        HttpSession s = SecurityHelpers.checkSession(request);

        // Se mi ero loggato con un ruolo, è scaduta la sessione e sto cambiando ruolo,
        // redireziono verso la dashboard corretta per il nuovo ruolo
       /* if (s != null && s.getAttribute("role") != null && !s.getAttribute("role").equals(role)) {
            s.invalidate();
            handleRedirect(role, request, response);
            return;
        } */

        // Se non ha inserito email e password redireziono con errore
   /*     if (email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login?error=3");
        }

      /*  try {
            Utente u = ((AppDataLayer) request.getAttribute("datalayer")).getUtenteDAO().getUtenteByEmail(email);
            System.out.println("u  "+u);
            if (u != null && SecurityHelpers.checkPasswordHashPBKDF2(password, u.getPassword())) {

                SecurityHelpers.createSession(request, email, u.getKey(), u.getTipologiaUtente());

                String redirectPage;
                redirectPage = switch (u.getTipologiaUtente()) {

                    case ORDINANTE -> "home";
                    case TECNICO -> "home";
                    case AMMINISTRATORE -> "home";
                    default -> "login";
                };

                String referrer = request.getParameter("referrer");

                if (referrer != null) {// && SecurityHelpers.isPageAllowedForUserType(referrer, u.getTipologiaUtente().toString())) {
                    response.sendRedirect(referrer);

             //   } else if (referrer != null) {
                   // System.out.println("Referrer non autorizzato, redirigo alla homepage.");
                  //  response.sendRedirect(redirectPage);
                } else {
                    response.sendRedirect(redirectPage);
                }
                return;
            } else {
                request.setAttribute("error", "Username o password non corretti");
                renderLoginPage(request, response);
            }

            // Selezione del giusto utente
           /* switch (role) {
                case ORDINANTE:
                    u = dl.getOrdinanteDAO().getOrdinanteByEmail(email);
                    break;
                case TECNICO:
                    u = dl.getTecnicoPreventiviDAO().getTecnicoPreventiviByEmail(email);
                    break;
                case TECNICO_ORDINI:
                    u = dl.getTecnicoOrdiniDAO().getTecnicoOrdiniByEmail(email);
                    break;
                case AMMINISTRATORE:
                    u = dl.getAmministratoreDAO().getAmministratoreByEmail(email);
                    break;
                default:
                    handleError("Login fallito!", request, response);
            }

            // Se la password è errata
          /*  if (u == null || !SecurityHelpers.checkPasswordHashPBKDF2(password, u.getPassword())) {
                response.sendRedirect("login?error=2");
                return;
            } */

        // Creo la sessione
        //  SecurityHelpers.createSession(request, email, u.getKey(), role);
        //     SecurityHelpers.createSession(request, "giovanni", 3, role);
        // Se ha un referrer, lo reindirizzo lì
        /*    if (request.getParameter("referrer") != null) {
                response.sendRedirect(request.getParameter("referrer"));
                return;
            }*/
        //  response.sendRedirect("/home");
        //  // Reindirizzo in base al ruolo
        //  handleRedirect(role, request, response);

        //  } catch (NoSuchAlgorithmException | InvalidKeySpecException | DataException e) {
    /*    } catch (Exception e) {
            //Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            handleError(e, request, response);
        }*/

   /*     TemplateResult result = new TemplateResult(getServletContext());
        request.setAttribute("referrer", request.getParameter("referrer"));
        request.setAttribute("includeHeader", true);
        request.setAttribute("includeFooter", true);
        request.setAttribute("currentUrl", request.getRequestURI());
        result.activate("dashboardAdmin.ftl", request, response); */
    }

    /*
    private void handleRedirect(Ruolo role, HttpServletRequest request, HttpServletResponse response) throws IOException {
        switch (role) {
            case ORDINANTE:
                response.sendRedirect("ordinante");
                break;
            case TECNICO_PREVENTIVI:
                response.sendRedirect("tecnico_preventivi");
                break;
            case TECNICO_ORDINI:
                response.sendRedirect("tecnico_ordini");
                break;
            case AMMINISTRATORE:
                response.sendRedirect("admin");
                break;
            default:
                handleError("Login fallito!", request, response);
        }
    } */


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