package it.univaq.gmarket.data.model;

import it.univaq.gmarket.framework.data.DataItem;

public interface Caratteristica extends DataItem<Integer> {

    int getId();
    void setId(int id);

    String getNome();
    void setNome(String nome);

    Categoria getCategoria();
    void setCategoria(Categoria categoria);

    String getMisura();
    void setMisura(String misura);

}

