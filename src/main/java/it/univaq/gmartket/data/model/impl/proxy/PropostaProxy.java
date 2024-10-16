package it.univaq.gmartket.data.model.impl.proxy;

import it.univaq.gmartket.data.model.Richiesta;
import it.univaq.gmartket.data.model.impl.PropostaImpl;
import it.univaq.gmartket.data.model.impl.StatoOrdine;
import it.univaq.gmartket.data.model.impl.StatoProposta;
import it.univaq.gmartket.framework.data.DataItemProxy;
import it.univaq.gmartket.framework.data.DataLayer;

import java.sql.Date;

public class PropostaProxy extends PropostaImpl implements DataItemProxy {


    protected boolean modified;
    protected DataLayer dataLayer;

    public PropostaProxy(DataLayer data) {
        super();
        this.dataLayer = data;
        this.modified = false;
    }

    @Override
    public void setNomeProduttore(String produttore) {
        super.setNomeProduttore(produttore);
        this.modified = true;
    }

    @Override
    public void setNomeProdotto(String prodotto) {
        super.setNomeProdotto(prodotto);
        this.modified = true;
    }

    @Override
    public void setCodiceProdotto(String codiceProdotto) {
        super.setCodiceProdotto(codiceProdotto);
        this.modified = true;
    }

    @Override
    public void setLink(String link) {
        super.setLink(link);
        this.modified = true;
    }

    @Override
    public void setNote(String note) {
        super.setNote(note);
        this.modified = true;
    }

    @Override
    public void setStatoProposta(StatoProposta stato) {
        super.setStatoProposta(stato);
        this.modified = true;
    }

    @Override
    public void setStatoOrdine(StatoOrdine stato) {
        super.setStatoOrdine(stato);
        this.modified = true;
    }



    @Override
    public void setCreated_at(Date created_at) {
        super.setCreated_at(created_at);
        this.modified = true;
    }

    @Override
    public void setUpdate_at(Date update) {
        super.setUpdate_at(update);
        this.modified = true;
    }

    @Override
    public void setDataOrdine(Date data) {
        super.setDataOrdine(data);
        this.modified = true;
    }

    @Override
    public void setMotivazione(String motivazione) {
        super.setMotivazione(motivazione);
        this.modified = true;
    }

    @Override
    public void setRichiesta(Richiesta richiesta) {
        super.setRichiesta(richiesta);
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
