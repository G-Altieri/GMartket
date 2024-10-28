package it.univaq.gmarket.data.model;

import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataItem;

public interface Notifica extends DataItem<Integer> {


    String getTitolo();

    void setTitolo(String titolo);

    String getContenuto();

    void setContenuto(String contenuto);

    Boolean getLetta();

    void setLetta(Boolean letta);

    Utente getUtente();

    void setUtente(Utente utente);

    Ruolo getRuolo();

    void setRuolo(Ruolo ruolo);

    Richiesta getRichiesta();

    void setRichiesta(Richiesta richiesta);

    Proposta getProposta();

    void setProposta(Proposta proposta);

    Proposta getOrdine();

    void setOrdine(Proposta ordine);
}
