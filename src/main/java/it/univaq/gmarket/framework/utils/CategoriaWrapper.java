package it.univaq.gmarket.framework.utils;

import it.univaq.gmarket.data.model.Categoria;

import java.util.ArrayList;
import java.util.List;

// Classe per contenere la categoria e il livello nella gerarchia
public class CategoriaWrapper {
    private Categoria categoria;
    private int livello;
    private List<CategoriaWrapper> sottocategorie;

    public CategoriaWrapper(Categoria categoria, int livello) {
        this.categoria = categoria;
        this.livello = livello;
        this.sottocategorie = new ArrayList<>();
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public int getLivello() {
        return livello;
    }

    public List<CategoriaWrapper> getSottocategorie() {
        return sottocategorie;
    }

    public void setSottocategorie(List<CategoriaWrapper> sottocategorie) {
        this.sottocategorie = sottocategorie;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CategoriaWrapper { ");
        sb.append("categoria = ").append(categoria != null ? categoria.getNome() : "null");
        sb.append(", livello = ").append(livello);
        sb.append(", sottocategorie = [");

        // Aggiungiamo tutte le sottocategorie in una stringa
        for (CategoriaWrapper sottocategoria : sottocategorie) {
            sb.append(sottocategoria.toString()).append(", ");
        }

        // Rimuove l'ultima virgola e spazio, se ci sono sottocategorie
        if (!sottocategorie.isEmpty()) {
            sb.setLength(sb.length() - 2); // Rimuove l'ultimo ", "
        }

        sb.append("] }");
        return sb.toString();
    }
}