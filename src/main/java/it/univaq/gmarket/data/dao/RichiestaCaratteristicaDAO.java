package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface RichiestaCaratteristicaDAO {
    RichiestaCaratteristica createRichiestaCaratteristica();


    void storeRichiestaCaratteristica(RichiestaCaratteristica richiestaCaratteristica) throws DataException;


    RichiestaCaratteristica getRichiestaCaratteristica(int richiesta_key) throws DataException;

    List<RichiestaCaratteristica> getRichiesteCaratteristicaByRichiesta(Integer key) throws DataException;
}

