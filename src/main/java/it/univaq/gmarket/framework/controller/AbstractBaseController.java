package it.univaq.gmarket.framework.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;
import it.univaq.gmarket.framework.result.FailureResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public abstract class AbstractBaseController extends HttpServlet {

    protected abstract void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;

    //create your own datalayer derived class
    protected abstract DataLayer createDataLayer(DataSource ds) throws ServletException;

    //override to init other information to offer to all the servlets
    protected void initRequest(HttpServletRequest request, DataLayer dl) {
        String completeRequestURL = request.getRequestURL() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
        request.setAttribute("thispageurl", completeRequestURL);
        request.setAttribute("datalayer", dl);
    }

    //override to enforce your policy and/or change the login url
    protected void accessCheckFailed(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        String completeRequestURL = request.getRequestURL() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
        response.sendRedirect("/login?referrer=" + URLEncoder.encode(completeRequestURL, "UTF-8"));
    }

    //override to provide your login information in the request
    protected void accessCheckSuccessful(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        HttpSession s = request.getSession(false);
        if (s != null) {
            Map<String, Object> li = new HashMap<>();
            request.setAttribute("logininfo", li);
            li.put("sessionStartTs", s.getAttribute("session-start-ts"));
            li.put("username", s.getAttribute("username"));
            li.put("userid", s.getAttribute("userid"));
            li.put("ip", s.getAttribute("ip"));
        }
    }

    ////////////////////////////////////////////////

    private void processBaseRequest(HttpServletRequest request, HttpServletResponse response) {
        //creating the datalayer opens the actual (per-request) connection to the shared datasource
        try (DataLayer datalayer = createDataLayer((DataSource) getServletContext().getAttribute("datasource"))) {
            datalayer.init();
            initRequest(request, datalayer);
            if (checkAccess(request, response)) {
                accessCheckSuccessful(request, response);
                processRequest(request, response);
            } else {
                accessCheckFailed(request, response);
            }
        } catch (Exception ex) {
            handleError(ex, request, response);
        }
    }

    protected boolean checkAccess(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        HttpSession s = SecurityHelpers.checkSession(request);
        String uri = request.getRequestURI();
        //non ridirezioniamo verso la login se richiediamo risorse da non proteggere
        //do not redirect to login if we are requesting unprotected resources
        return !(s == null && ((Pattern) getServletContext().getAttribute("protect")).matcher(uri).find());
    }

    protected void handleError(String message, HttpServletRequest request, HttpServletResponse response) {
        new FailureResult(getServletContext()).activate(message, request, response);
    }

    protected void handleError(Exception exception, HttpServletRequest request, HttpServletResponse response) {
        new FailureResult(getServletContext()).activate(exception, request, response);
    }

    protected void handleError(HttpServletRequest request, HttpServletResponse response) {
        new FailureResult(getServletContext()).activate(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processBaseRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processBaseRequest(request, response);
    }

}
