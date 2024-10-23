package it.univaq.gmarket.data.model.impl;

import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.framework.data.DataItemImpl;

import java.sql.Timestamp;

public class PropostaImpl extends DataItemImpl<Integer> implements Proposta {

    private int id;
    private String codiceProposta;
    private String nomeProduttore;
    private String nomeProdotto;
    private double prezzo;
    private String link;
    private String note;
    private Richiesta richiesta;
    private StatoProposta statoProposta;
    private Timestamp created_at;
    private Timestamp update_at;
    private String motivazione;
    private StatoOrdine statoOrdine;
    private Timestamp dataOrdine;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id= id;
    }

    @Override
    public String getCodiceProposta() {
        return codiceProposta;
    }

    @Override
    public void setCodiceProposta(String codiceProdotto) {
        this.codiceProposta = codiceProdotto;
    }

    @Override
    public String getNomeProduttore() {
        return nomeProduttore;
    }

    @Override
    public void setNomeProduttore(String nomeProduttore) {
        this.nomeProduttore = nomeProduttore;
    }

    @Override
    public String getNomeProdotto() {
        return nomeProdotto;
    }

    @Override
    public void setNomeProdotto(String nomeProdotto) {
        this.nomeProdotto = nomeProdotto;
    }

    @Override
    public double getPrezzo() {
        return prezzo;
    }

    @Override
    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    @Override
    public String getLink() {
        return link;
    }

    @Override
    public void setLink(String link) {
        this.link = link;
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
    public Richiesta getRichiesta() {
        return richiesta;
    }

    @Override
    public void setRichiesta(Richiesta richiesta) {
        this.richiesta = richiesta;
    }

    @Override
    public StatoProposta getStatoProposta() {
        return statoProposta;
    }

    @Override
    public void setStatoProposta(StatoProposta statoProposta) {
        this.statoProposta = statoProposta;
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
    public void setUpdate_at(Timestamp update) {
        this.update_at = update;
    }

    @Override
    public String getMotivazione() {
        return motivazione;
    }

    @Override
    public void setMotivazione(String motivazione) {
        this.motivazione = motivazione;
    }

    @Override
    public StatoOrdine getStatoOrdine() {
        return statoOrdine;
    }

    @Override
    public void setStatoOrdine(StatoOrdine statoOrdine) {
        this.statoOrdine = statoOrdine;
    }

    @Override
    public Timestamp getDataOrdine() {
        return dataOrdine;
    }

    @Override
    public void setDataOrdine(Timestamp data) {
        this.dataOrdine = data;
    }
}

