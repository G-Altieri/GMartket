package it.univaq.gmartket.data.model;

import it.univaq.gmartket.data.model.impl.StatoOrdine;
import it.univaq.gmartket.data.model.impl.StatoProposta;

import java.sql.Date;

public interface Proposta {

    String getCodiceProdotto();
    void setCodiceProdotto(String codiceProdotto);

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

    Date getCreated_at ();
    void setCreated_at (Date created_at);

    Date getUpdate_at ();
    void setUpdate_at (Date update_at);

    String getMotivazione();
    void setMotivazione(String motivazione);

    StatoOrdine getStatoOrdine();
    void setStatoOrdine(StatoOrdine statoOrdine);

    Date getDataOrdine ();
    void setDataOrdine (Date dataOrdine);

}
