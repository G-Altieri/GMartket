package it.univaq.gmartket.data.model;

public interface RichiestaCaratteristica {

    int getId();
    void setId(int id);

    Richiesta getRichiesta();
    void setRichiesta(Richiesta richiesta);

    Caratteristica getCaratteristica();
    void setCaratteristica (Caratteristica caratteristica);

    String getValore();
    void setValore(String valore);

}
