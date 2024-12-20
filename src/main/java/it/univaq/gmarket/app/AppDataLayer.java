package it.univaq.gmarket.app;


import it.univaq.gmarket.app.controller.RichiestaController;
import it.univaq.gmarket.data.dao.*;
import it.univaq.gmarket.data.dao.impl.*;
import it.univaq.gmarket.data.model.*;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.data.DataLayer;

import javax.sql.DataSource;
import java.sql.SQLException;


public class AppDataLayer extends DataLayer {

    //comando per aggiornare i file con tailwindcss: npx tailwindcss -i ./src/main/webapp/styles/global.css -o ./src/main/webapp/styles/tailwind2.css --watch

    public AppDataLayer(DataSource datasource) throws SQLException {
        super(datasource);
    }

    @Override
    public void init() throws DataException {
        //registriamo i nostri dao
        registerDAO(Utente.class, new UtenteDAO_SQL(this));
        registerDAO(Categoria.class, new CategoriaDAO_SQL(this));
        registerDAO(Caratteristica.class, new CaratteristicaDAO_SQL(this));
        registerDAO(Richiesta.class, new RichiestaDAO_SQL(this));
        registerDAO(RichiestaCaratteristica.class, new RichiestaCaratteristicaDAO_SQL(this));
        registerDAO(Proposta.class, new PropostaDAO_SQL(this));
        registerDAO(Notifica.class, new NotificaDAO_SQL(this));
    }

    public UtenteDAO getUtenteDAO() {
        return (UtenteDAO) getDAO(Utente.class);
    }


    public CategoriaDAO getCategoriaDAO() {
        return (CategoriaDAO) getDAO(Categoria.class);
    }


    public CaratteristicaDAO getCaratteristicaDAO() {
        return (CaratteristicaDAO) getDAO(Caratteristica.class);
    }

    public RichiestaDAO getRichiestaDAO() {
        return (RichiestaDAO) getDAO(Richiesta.class);
    }


    public RichiestaCaratteristicaDAO getRichiestaCaratteristicaDAO() {
        return (RichiestaCaratteristicaDAO) getDAO(RichiestaCaratteristica.class);
    }

    public PropostaDAO getPropostaDAO() {
        return (PropostaDAO) getDAO(Proposta.class);
    }

    public NotificaDAO getNotificaDAO() {
        return (NotificaDAO) getDAO(Notifica.class);
    }
}
