package it.univaq.gmartket.data.model.impl;

import it.univaq.gmartket.data.model.*;
import java.sql.Date;

public class PropostaImpl implements Proposta {

    private String codiceProdotto;
    private String nomeProduttore;
    private String nomeProdotto;
    private double prezzo;
    private String link;
    private String note;
    private Richiesta richiesta;
    private StatoProposta statoProposta;
    private Date created_at;
    private Date update_at;
    private String motivazione;
    private StatoOrdine statoOrdine;
    private Date dataOrdine;

    @Override
    public String getCodiceProdotto() {
        return codiceProdotto;
    }

    @Override
    public void setCodiceProdotto(String codiceProdotto) {
        this.codiceProdotto = codiceProdotto;
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
    public Date getDataOrdine() {
        return dataOrdine;
    }

    @Override
    public void setDataOrdine(Date dataOrdine) {
        this.dataOrdine = dataOrdine;
    }
}

