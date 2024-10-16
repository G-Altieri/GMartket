package it.univaq.gmarket.app.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutController extends AppBaseController {

    private void action_logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login");
     /*   SecurityHelpers.disposeSession(request);
        if (request.getParameter("referrer") != null) {
            response.sendRedirect(request.getParameter("referrer"));
        } else {
            response.sendRedirect("login");
        } */
    }

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        action_logout(request, response);
    }

}
