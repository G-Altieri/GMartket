package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Utente;
import it.univaq.gmarket.framework.data.DataException;

public interface UtenteDAO {

    Utente createUtente();

    Utente getUtente(int utente_key) throws DataException;

    Utente getUtenteByEmail(String email) throws DataException;

    void storeUtente(Utente utente) throws DataException;

}
