package it.univaq.gmartket.app;
/*
import it.univaq.gmartket.data.dao.UtenteDAO;
import it.univaq.gmartket.data.dao.impl.UtenteDAO_MySQL;
import it.univaq.gmartket.data.model.Utente; */
import it.univaq.gmartket.framework.data.DataException;
import it.univaq.gmartket.framework.data.DataLayer;

import javax.sql.DataSource;
import java.sql.SQLException;

public class AppDataLayer extends DataLayer {

    public AppDataLayer(DataSource datasource) throws SQLException {
        super(datasource);
    }
    @Override
    public void init() throws DataException {
        //registriamo i nostri dao
        //register our daos
    //   registerDAO(Utente.class, new UtenteDAO_MySQL(this));
    }

  /*  public UtenteDAO getUtenteDAO() {
        return (UtenteDAO) getDAO(Utente.class);
    } */

}
