package it.univaq.gmartket.data.model.impl.proxy;


import it.univaq.gmartket.data.model.impl.CategoriaImpl;
import it.univaq.gmartket.framework.data.DataItemProxy;
import it.univaq.gmartket.framework.data.DataLayer;

public class CategoriaProxy extends CategoriaImpl implements DataItemProxy {

    protected boolean modified;
    protected DataLayer dataLayer;

    public CategoriaProxy(DataLayer data) {
        super();
        this.dataLayer = data;
        this.modified = false;
    }

    @Override
    public void setNome(String nome) {
        super.setNome(nome);
        this.modified = true;
    }

    @Override
    public void setFiglio(boolean figlio) {
        super.setFiglio(figlio);
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

