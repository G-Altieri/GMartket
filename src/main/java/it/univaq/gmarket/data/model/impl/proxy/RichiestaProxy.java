package it.univaq.gmarket.data.model.impl.proxy;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.RichiestaImpl;
import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.framework.data.DataItemProxy;
import it.univaq.gmarket.framework.data.DataLayer;

import java.sql.Timestamp;
import java.util.Date;

public class RichiestaProxy extends RichiestaImpl implements DataItemProxy {

    protected boolean modified;
    protected DataLayer dataLayer;

    public RichiestaProxy(DataLayer data) {
        super();
        //dependency injection
        this.dataLayer = data;
        this.modified = false;
    }


    @Override
    public void setCodice(String codice) {
        super.setCodice(codice);
        this.modified = true;
    }


    @Override
    public void setOrdinante(Utente utente) {
        super.setOrdinante(utente);
        this.modified = true;
    }


    @Override
    public void setTecnico(Utente tecnico) {
        super.setTecnico(tecnico);
        this.modified = true;
    }

    @Override
    public void setCategoria(Categoria categoria) {
        super.setCategoria(categoria);
        this.modified = true;
    }

    public void setNote(String note) {
        super.setNote(note);
        this.modified = true;
    }

    @Override
    public void setStato(StatoRichiesta stato) {
        super.setStato(stato);
        this.modified = true;
    }

    @Override
    public void setCreated_at(Timestamp created) {
        super.setCreated_at(created);
        this.modified = true;
    }

    @Override
    public void setUpdate_at(Timestamp update) {
        super.setUpdate_at(update);
        this.modified = true;
    }


    //METODI DEL PROXY
    //PROXY-ONLY METHODS

    @Override
    public void setModified(boolean dirty) {
        this.modified = dirty;
    }

    @Override
    public boolean isModified() {
        return modified;
    }

}
