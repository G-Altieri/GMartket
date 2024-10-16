package it.univaq.gmartket.data.model;

import it.univaq.gmartket.data.model.impl.Ruolo;

import java.util.Date;

public interface Utente {

    int getId();
    void setId(int id);

    String getNome();
    void setNome(String nome);

    String getCognome();
    void setCognome(String cognome);

    String getEmail();
    void setEmail(String email);

    String getPassword();
    void setPassword(String password);

    Date getCreated_at ();
    void setCreated_at (Date created_at);

    Date getUpdate_at ();
    void setUpdate_at (Date update_at);

    Ruolo getRuolo();
    void setRuolo(Ruolo ruolo);
}
