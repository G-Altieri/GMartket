package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface PropostaDAO {

    Proposta createProposta();

    Proposta getProposta(int key) throws DataException;

    void storeProposta(Proposta proposta) throws DataException;

    List<Proposta> getAllProposteByRichiesta(Richiesta richiesta) throws DataException;


    Proposta getPropostaSpeditaByRichiesta(Richiesta richiesta) throws DataException;

    Proposta getPropostaAccettataByRichiesta(Richiesta richiesta) throws DataException;

    boolean isCodiceUnico(String codice) throws DataException;


}
