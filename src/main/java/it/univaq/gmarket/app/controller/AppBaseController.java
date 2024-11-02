package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.controller.AbstractBaseController;
import it.univaq.gmarket.framework.data.DataLayer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

public abstract class AppBaseController extends AbstractBaseController {


    @Override
    protected DataLayer createDataLayer(DataSource ds) throws ServletException {
        try {
            return new AppDataLayer(ds);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

}
