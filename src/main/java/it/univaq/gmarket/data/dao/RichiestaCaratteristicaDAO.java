package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.RichiestaCaratteristica;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface RichiestaCaratteristicaDAO {
    RichiestaCaratteristica createRichiestaCaratteristica();


    void storeRichiestaCaratteristica(RichiestaCaratteristica richiestaCaratteristica) throws DataException;
}

