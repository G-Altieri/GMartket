package it.univaq.gmarket.app.controller;

import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.framework.controller.AbstractBaseController;
import it.univaq.gmarket.framework.data.DataLayer;

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
