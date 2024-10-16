package it.univaq.gmarket.data.model.impl;

import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Caratteristica;

public class RichiestaCaratteristicaImpl implements RichiestaCaratteristica {

    private int id;
    private Richiesta richiesta;
    private Caratteristica caratteristica;
    private String valore;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public Richiesta getRichiesta() {
        return richiesta;
    }

    @Override
    public void setRichiesta(Richiesta richiesta) {
        this.richiesta = richiesta;
    }

    @Override
    public Caratteristica getCaratteristica() {
        return caratteristica;
    }

    @Override
    public void setCaratteristica(Caratteristica caratteristica) {
        this.caratteristica = caratteristica;
    }

    @Override
    public String getValore() {
        return valore;
    }

    @Override
    public void setValore(String valore) {
        this.valore = valore;
    }
}
