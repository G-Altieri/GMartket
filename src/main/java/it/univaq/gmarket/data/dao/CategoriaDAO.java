package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface CategoriaDAO {
    Categoria createCategoria();

    Categoria getCategoria(int categoria_key) throws DataException;

    List<Categoria> getAllCategorie() throws DataException;

    List<Categoria> getCategorieByPadre(int padre) throws DataException;

    void storeCategoria(Categoria categoria) throws DataException;

    Categoria getCategoriaById(int categoriaId) throws DataException;


    void deleteCategoria(Categoria categoria) throws DataException;

    List<Categoria> getFiglieByCategoriaId(int categoriaId) throws DataException;

    List<Categoria> getAllSubCategorie(int categoriaId) throws DataException;

    List<Categoria> getCategoriePadri() throws DataException;

    List<Categoria> getPadriByCategoriaId(int figliaId) throws DataException;

//    List<Categoria> getCategorieFiglie(Integer key);
}
