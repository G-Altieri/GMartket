package it.univaq.gmartket.data.model.impl.proxy;


import it.univaq.gmartket.data.model.impl.RichiestaCaratteristicaImpl;
import it.univaq.gmartket.data.model.Richiesta;
import it.univaq.gmartket.data.model.Caratteristica;
import it.univaq.gmartket.framework.data.DataItemProxy;
import it.univaq.gmartket.framework.data.DataLayer;

public class RichiestaCaratteristicaProxy extends RichiestaCaratteristicaImpl implements DataItemProxy {

    protected boolean modified;
    protected DataLayer dataLayer;

    public RichiestaCaratteristicaProxy(DataLayer data) {
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
    public void setRichiesta(Richiesta richiesta) {
        super.setRichiesta(richiesta);
        this.modified = true;

    }

    @Override
    public void setCaratteristica(Caratteristica caratteristica) {
        super.setCaratteristica(caratteristica);
        this.modified = true;
    }

    @Override
    public void setValore(String valore) {
        super.setValore(valore);
        this.modified = true;
    }

    @Override
    public void setModified(boolean dirty) {
        this.modified = dirty;
    }

    @Override
    public boolean isModified() {
        return modified;
    }

}
