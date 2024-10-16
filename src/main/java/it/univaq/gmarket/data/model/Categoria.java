package it.univaq.gmarket.data.model;

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
