package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;


public interface RichiestaDAO {

        Richiesta createRichiesta();

        Richiesta getRichiesta(int Richiesta_key) throws DataException;


        // Per metterlo nel db
        void storeRichiesta(Richiesta Richiesta) throws DataException;

        void deleteRichiesta(int richiesta_key) throws DataException;

        boolean isCodiceUnico(String codice) throws DataException;

        List<Richiesta> getAllRichiesteOrdinante(int utente_key) throws DataException;

        List<Richiesta> getRichiesteByCompletatoSpedite() throws DataException;

    List<Richiesta> getRichiesteByCompletatoSpediteByOrdinante(int utente_key) throws DataException;

    List<Richiesta> getRichiesteByAssegnato() throws DataException;

    List<Richiesta> getRichiesteByAssegnatoByOrdinante(int utente_key) throws DataException;

    List<Richiesta> getAllRichiesteTecnico() throws DataException;
        List<Richiesta> getAllRichiesteByTecnico(int key) throws DataException;
}