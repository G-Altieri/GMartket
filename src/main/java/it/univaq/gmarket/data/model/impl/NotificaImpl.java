package it.univaq.gmarket.data.model.impl;

import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataItemImpl;

public class NotificaImpl extends DataItemImpl<Integer> implements Notifica {


    private String titolo;
    private String contenuto;
    private Boolean letta =false;
    private Utente utente;
    private Ruolo ruolo;
    private Richiesta richiesta;
    private Proposta proposta;
    private Proposta ordine;

    @Override
    public String getTitolo() {
        return titolo;
    }

    @Override
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    @Override
    public String getContenuto() {
        return contenuto;
    }

    @Override
    public void setContenuto(String contenuto) {
        this.contenuto = contenuto;
    }

    @Override
    public Boolean getLetta() {
        return letta;
    }

    @Override
    public void setLetta(Boolean letta) {
        this.letta = letta;
    }

    @Override
    public Utente getUtente() {
        return utente;
    }

    @Override
    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    @Override
    public Ruolo getRuolo() {
        return ruolo;
    }

    @Override
    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }

    @Override
    public Richiesta getRichiesta() {
        return richiesta;
    }
    @Override
    public void setRichiesta(Richiesta richiesta) {
        this.richiesta = richiesta;
    }
    @Override
    public Proposta getProposta() {
        return proposta;
    }
    @Override
    public void setProposta(Proposta proposta) {
        this.proposta = proposta;
    }
    @Override
    public Proposta getOrdine() {
        return ordine;
    }
    @Override
    public void setOrdine(Proposta ordine) {
        this.ordine = ordine;
    }

    @Override
    public String toString() {
        return "NotificaImpl{" +
                "id=" + getKey() +
                ", titolo='" + titolo + '\'' +
                ", contenuto='" + contenuto + '\'' +
                ", letta=" + letta +
                ", utente=" + (utente != null ? utente.getNome() : "N/A") +
                ", ruolo=" + (ruolo != null ? ruolo.name() : "N/A") +
                ", proposta=" + (proposta != null ? proposta.getKey() : "N/A") +
                ", richiesta=" + (richiesta != null ? richiesta.getKey() : "N/A") +
                ", ordine=" + (ordine != null ? ordine.getKey() : "N/A") +
                '}';
    }
}
