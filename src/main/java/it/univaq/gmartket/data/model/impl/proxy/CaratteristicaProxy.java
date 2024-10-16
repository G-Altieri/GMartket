package it.univaq.gmartket.data.model.impl.proxy;

import it.univaq.gmartket.data.model.Categoria;
import it.univaq.gmartket.data.model.impl.CaratteristicaImpl;
import it.univaq.gmartket.framework.data.DataItemProxy;
import it.univaq.gmartket.framework.data.DataLayer;

public class CaratteristicaProxy extends CaratteristicaImpl implements DataItemProxy {

    protected boolean modified;
    protected DataLayer dataLayer;
    protected int categoria_id = 0;

    public CaratteristicaProxy(DataLayer data) {
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
    public void setCategoria(Categoria categoria) {
        super.setCategoria(categoria);
        this.categoria_id = categoria.getId();
        this.modified =true;
    }

    @Override
    public void setMisura(String misura) {
        super.setMisura(misura);
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