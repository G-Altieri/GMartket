package it.univaq.gmarket.data.model;

import it.univaq.gmarket.data.model.impl.StatoRichiesta;
import it.univaq.gmarket.framework.data.DataItem;
import it.univaq.gmarket.framework.data.DataItemImpl;

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

    Date getCreated_at ();
    void setCreated_at (Date created_at);

    Date getUpdate_at ();
    void setUpdate_at (Date update_at);


}

