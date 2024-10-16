package it.univaq.gmartket.data.model.impl;
import it.univaq.gmartket.data.model.Categoria;

    public class CategoriaImpl implements Categoria {

        private int id;
        private String nome;
        private Categoria padre;
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

        @Override
        public Categoria getPadre() {
            return padre;
        }

        @Override
        public void setPadre(Categoria padre) {
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
    }


