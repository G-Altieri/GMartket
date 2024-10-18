package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface CaratteristicaDAO {
    Caratteristica createCaratteristica();

   // Caratteristica getCaratteristicheByCategoria();

    List<Caratteristica> getCaratteristicheByCategoria(int categoria) throws DataException;
}
