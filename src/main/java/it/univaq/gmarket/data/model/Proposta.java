package it.univaq.gmarket.data.model;

import it.univaq.gmarket.data.model.impl.StatoOrdine;
import it.univaq.gmarket.data.model.impl.StatoProposta;
import it.univaq.gmarket.framework.data.DataItem;

import java.sql.Date;
import java.sql.Timestamp;

public interface Proposta extends DataItem<Integer> {

    int getId();
    void setId(int id);

    String getCodiceProposta();
    void setCodiceProposta(String codiceProdotto);

    String getNomeProduttore();
    void setNomeProduttore(String nomeProduttore);

    String getNomeProdotto();
    void setNomeProdotto(String nomeProdotto);

    double getPrezzo();
    void setPrezzo(double prezzo);


    String getLink();
    void setLink(String link);

    String getNote();
    void setNote(String note);


    Richiesta getRichiesta();
    void setRichiesta(Richiesta richiesta);

    StatoProposta getStatoProposta();
    void setStatoProposta(StatoProposta statoProposta);

    Timestamp getCreated_at ();
    void setCreated_at (Timestamp created_at);

    Timestamp getUpdate_at ();
    void setUpdate_at (Timestamp update);

    String getMotivazione();
    void setMotivazione(String motivazione);

    StatoOrdine getStatoOrdine();
    void setStatoOrdine(StatoOrdine statoOrdine);

    Timestamp getDataOrdine ();
    void setDataOrdine (Timestamp data);

}
