package it.univaq.gmarket.data.model.impl;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.data.model.*;
import it.univaq.gmarket.framework.data.DataItemImpl;

import java.sql.Timestamp;
import java.util.Date;

public class RichiestaImpl extends DataItemImpl<Integer> implements Richiesta {

    private int id;
    private String codice;
    private Utente ordinante;
    private Utente tecnico;
    private Categoria categoria;
    private String note;
    private StatoRichiesta statoRichiesta;
    private Timestamp created_at;
    private Timestamp update_at;

    @Override
    public int getId() {
        return id;
    }
    @Override
    public void setId(int id) {
        this.id= id;
    }
    @Override
    public String getCodice() {
        return codice;
    }

    @Override
    public void setCodice(String codice) {
        this.codice = codice;
    }

    @Override
    public Utente getOrdinante() {
        return ordinante;
    }

    @Override
    public void setOrdinante(Utente ordinante) {
        this.ordinante = ordinante;
    }

    @Override
    public Utente getTecnico() {
        return tecnico;
    }

    @Override
    public void setTecnico(Utente tecnico) {
        this.tecnico = tecnico;
    }

    @Override
    public Categoria getCategoria() {
        return categoria;
    }

    @Override
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public String getNote() {
        return note;
    }

    @Override
    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public StatoRichiesta getStato() {
        return statoRichiesta;
    }

    @Override
    public void setStato(StatoRichiesta statoRichiesta) {
        this.statoRichiesta = statoRichiesta;
    }

    @Override
    public Timestamp getCreated_at() {
        return created_at;
    }

    @Override
    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    @Override
    public Timestamp getUpdate_at() {
        return update_at;
    }

    @Override
    public void setUpdate_at(Timestamp update_at) {
        this.update_at = update_at;
    }
}

