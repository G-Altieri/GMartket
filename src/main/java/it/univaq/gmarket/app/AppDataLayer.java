package it.univaq.gmarket.app;
/*
import it.univaq.gmartket.data.dao.UtenteDAO;
import it.univaq.gmartket.data.dao.impl.UtenteDAO_MySQL;
import it.univaq.gmartket.data.model.Utente; */
import it.univaq.gmarket.data.dao.UtenteDAO;
import it.univaq.gmarket.data.dao.impl.UtenteDAO_SQL;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.dao.impl.CategoriaDAO_SQL;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;

import javax.sql.DataSource;
import java.sql.SQLException;


//npx tailwindcss -i ./src/main/webapp/styles/global.css -o ./src/main/webapp/styles/tailwind2.css --watch
public class AppDataLayer extends DataLayer {

    public AppDataLayer(DataSource datasource) throws SQLException {
        super(datasource);
    }
    @Override
    public void init() throws DataException {
        //registriamo i nostri dao
        //register our daos
       registerDAO(Utente.class, new UtenteDAO_SQL(this));
       registerDAO(Categoria.class, new CategoriaDAO_SQL(this));

    }

    public UtenteDAO getUtenteDAO() {
        return (UtenteDAO) getDAO(Utente.class);
    }


    public CategoriaDAO getCategoriaDAO() {
        return (CategoriaDAO) getDAO(Categoria.class);
    }

}
