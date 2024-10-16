package it.univaq.gmartket.data.model;

public interface Caratteristica {

    int getId();
    void setId(int id);

    String getNome();
    void setNome(String nome);

    Categoria getCategoria();
    void setCategoria(Categoria categoria);

    String getMisura();
    void setMisura(String misura);

}

