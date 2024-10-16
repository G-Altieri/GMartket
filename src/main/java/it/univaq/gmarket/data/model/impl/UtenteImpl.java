package it.univaq.gmarket.data.model.impl;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataItem;
import it.univaq.gmarket.framework.data.DataItemImpl;

import java.util.Date;

public class UtenteImpl extends DataItemImpl<Integer> implements Utente {

    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String password;
    private Date created_at;
    private Date update_at;
    private Ruolo ruolo;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getNome() {
        return nome;
    }

    @Override
    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String getCognome() {
        return cognome;
    }

    @Override
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public void setPassword(String password) {
        this.password = password;
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

    @Override
    public Ruolo getRuolo() {
        return ruolo;
    }

    @Override
    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }
}

