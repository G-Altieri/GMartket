package it.univaq.gmarket.data.model;

import it.univaq.gmarket.framework.data.DataItem;

public interface Categoria extends DataItem<Integer> {

    int getId();
    void setId(int id);

    String getNome();
    void setNome(String nome);

//    Categoria getPadre();
//    void setPadre(Categoria padre);

    Integer getPadre();

    void setPadre(Integer padre);

    boolean getFiglio();

    void setFiglio(boolean figlio);

}
