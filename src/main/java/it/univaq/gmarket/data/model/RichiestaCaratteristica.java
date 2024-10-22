package it.univaq.gmarket.data.model;

import it.univaq.gmarket.framework.data.DataItem;
import it.univaq.gmarket.framework.data.DataItemImpl;

public interface RichiestaCaratteristica extends DataItem<Integer> {


    int getId();
    void setId(int id);

    Richiesta getRichiesta();
    void setRichiesta(Richiesta richiesta);

    Caratteristica getCaratteristica();
    void setCaratteristica (Caratteristica caratteristica);

    String getValore();
    void setValore(String valore);

}
