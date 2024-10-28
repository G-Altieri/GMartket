package it.univaq.gmarket.data.dao;

import it.univaq.gmarket.data.model.Notifica;
import it.univaq.gmarket.framework.data.DataException;

import java.util.List;

public interface NotificaDAO {
    Notifica createNotifica();

    Notifica getNotifica(int notificaId) throws DataException;

    List<Notifica> getAllNotifiche() throws DataException;

    void storeNotifica(Notifica notifica) throws DataException;

    void deleteNotifica(Notifica notifica) throws DataException;

    List<Notifica> getNotificheTecnicoListaRichiesteLibere() throws DataException;
}
