package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface CaratteristicaDAO {
    Caratteristica createCaratteristica();

   // Caratteristica getCaratteristicheByCategoria();

    Caratteristica getCaratteristica(int id) throws DataException;

    // Metodo per eliminare la caratteristica
    void deleteCaratteristica(int id) throws DataException;

    // Metodo per aggiornare la caratteristica
    void storeCaratteristica(Caratteristica caratteristica) throws DataException;

    List<Caratteristica> getCaratteristicheByCategoria(int categoria) throws DataException;
}
