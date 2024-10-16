package it.univaq.gmartket.data.model.impl;

import it.univaq.gmartket.data.model.*;
import java.util.Date;

public class RichiestaImpl implements Richiesta {

    private String codice;
    private Utente ordinante;
    private Utente tecnico;
    private Categoria categoria;
    private String note;
    private StatoRichiesta statoRichiesta;
    private Date created_at;
    private Date update_at;

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
    public Date getCreated_at() {
        return created_at;
    }

    @Override
    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public Date getUpdate_at() {
        return update_at;
    }

    @Override
    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }
}

