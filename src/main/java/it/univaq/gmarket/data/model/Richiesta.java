package it.univaq.gmarket.data.model;

import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.framework.data.DataItem;
import it.univaq.gmarket.framework.data.DataItemImpl;

import java.sql.Timestamp;
import java.util.Date;


public interface Richiesta extends DataItem<Integer> {


    int getId();
    void setId(int id);


    String getCodice();
    void setCodice(String codice);

    Utente getOrdinante();
    void setOrdinante(Utente ordinante);

    Utente getTecnico();
    void setTecnico(Utente tecnico);

    // Categoria del nipote
    Categoria getCategoria();
    void setCategoria(Categoria categoria);

    String getNote();
    void setNote(String note);

    StatoRichiesta getStato();
    void setStato(StatoRichiesta statoRichiesta);

    Timestamp getCreated_at ();
    void setCreated_at (Timestamp created_at);

    Timestamp getUpdate_at ();
    void setUpdate_at (Timestamp update_at);


}

