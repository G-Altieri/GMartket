package it.univaq.gmartket.data.model.impl.proxy;

import it.univaq.gmartket.data.model.impl.UtenteImpl;
import it.univaq.gmartket.data.model.impl.Ruolo;
import it.univaq.gmartket.framework.data.DataLayer;
import it.univaq.gmartket.framework.data.DataItemProxy;
import java.util.Date;

public class UtenteProxy extends UtenteImpl implements DataItemProxy {

    protected DataLayer dataLayer;
    protected boolean modified;

    public UtenteProxy(DataLayer data) {
        super();
        this.dataLayer = data;
        this.modified = false;
    }

    @Override
    public void setId(int id) {
        super.setId(id);
        this.modified = true;
    }

    @Override
    public void setNome(String nome) {
        super.setNome(nome);
        this.modified = true;
    }

    @Override
    public void setCognome(String cognome) {
        super.setCognome(cognome);
        this.modified = true;
    }

    @Override
    public void setEmail(String email) {
        super.setEmail(email);
        this.modified = true;
    }

    @Override
    public void setPassword(String password) {
        super.setPassword(password);
        this.modified = true;
    }


    @Override
    public void setCreated_at(Date created_at) {
        super.setCreated_at(created_at);
        this.modified = true;
    }



    @Override
    public void setUpdate_at(Date update_at) {
        super.setUpdate_at(update_at);
        this.modified = true;
    }

    @Override
    public void setRuolo(Ruolo ruolo) {
        super.setRuolo(ruolo);
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
