package it.univaq.gmartket.data.model.impl;

import it.univaq.gmartket.data.model.Caratteristica;
import it.univaq.gmartket.data.model.Categoria;

public class CaratteristicaImpl implements Caratteristica {

    private int id;
    private String nome;
    private Categoria categoria;
    private String misura;

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
    public Categoria getCategoria() {
        return categoria;
    }

    @Override
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public String getMisura() {
        return misura;
    }

    @Override
    public void setMisura(String misura) {
        this.misura = misura;
    }
}
