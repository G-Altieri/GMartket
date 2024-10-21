package it.univaq.gmarket.data.model.impl;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.framework.data.DataItemImpl;

public class CategoriaImpl extends DataItemImpl<Integer> implements Categoria {

    private int id;
    private String nome;
    private Integer padre;
    private boolean figlio;

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

//    @Override
//    public Categoria getPadre() {
//        return padre;
//    }

    //    @Override
//    public void setPadre(Categoria padre) {
//        this.padre = padre;
//    }
    @Override
    public Integer getPadre() {
        return padre;
    }

    @Override
    public void setPadre(Integer padre) {
        this.padre = padre;
    }

    @Override
    public boolean getFiglio() {
        return figlio;
    }

    @Override
    public void setFiglio(boolean figlio) {
        this.figlio = figlio;
    }

    @Override
    public String toString() {
        return "Categoria{id=" + this.id + ", nome='" + this.nome +  ", padre='" + this.padre + ", figlio= " + this.figlio +"'}";
    }

}


