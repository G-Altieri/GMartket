package it.univaq.gmartket.data.model;

import java.util.List;

public interface Categoria {

    int getId();
    void setId(int id);

    String getNome();
    void setNome(String nome);

    Categoria getPadre();
    void setPadre(Categoria padre);

    boolean getFiglio();
    void setFiglio(boolean figlio);
}
