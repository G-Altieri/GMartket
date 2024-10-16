package it.univaq.gmartket.app.controller;

import it.univaq.gmartket.app.AppDataLayer;
import it.univaq.gmartket.framework.controller.AbstractBaseController;
import it.univaq.gmartket.framework.data.DataLayer;

import javax.servlet.ServletException;
import javax.sql.DataSource;
import java.sql.SQLException;

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
