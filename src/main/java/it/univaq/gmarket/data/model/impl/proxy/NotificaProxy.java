package it.univaq.gmarket.data.model.impl.proxy;

import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.impl.NotificaImpl;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataItemProxy;
import it.univaq.gmarket.framework.data.DataLayer;

public class NotificaProxy extends NotificaImpl implements DataItemProxy {

    protected boolean modified;
    protected DataLayer dataLayer;

    public NotificaProxy(DataLayer data) {
        super();
        this.dataLayer = data;
        this.modified = false;
    }

    // Override dei metodi setter per impostare 'modified' a true

    @Override
    public void setTitolo(String titolo) {
        super.setTitolo(titolo);
        this.modified = true;
    }

    @Override
    public void setContenuto(String contenuto) {
        super.setContenuto(contenuto);
        this.modified = true;
    }

    @Override
    public void setLetta(Boolean letta) {
        super.setLetta(letta);
        this.modified = true;
    }

    @Override
    public void setUtente(Utente utente) {
        super.setUtente(utente);
        this.modified = true;
    }

    @Override
    public void setRuolo(Ruolo ruolo) {
        super.setRuolo(ruolo);
        this.modified = true;
    }

    @Override
    public void setRichiesta(Richiesta x) {
        super.setRichiesta(x);
        this.modified = true;
    }

    @Override
    public void setProposta(Proposta x) {
        super.setProposta(x);
        this.modified = true;
    }

    @Override
    public void setOrdine(Proposta x) {
        super.setOrdine(x);
        this.modified = true;
    }

    // Metodi del Proxy per gestire lo stato modificato

    @Override
    public void setModified(boolean dirty) {
        this.modified = dirty;
    }

    @Override
    public boolean isModified() {
        return modified;
    }

}
