package it.univaq.gmarket.app.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CaratteristicaDAO;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.Caratteristica;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.data.model.impl.Ruolo;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import it.univaq.gmarket.framework.security.SecurityHelpers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RichiestaController extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //Check dei ruoli del utente
        Ruolo[] allowedRoles = {Ruolo.ORDINANTE, Ruolo.TECNICO};
        SecurityHelpers.checkUserRole(request, response, allowedRoles);
        if (response.isCommitted()) return;

        //Controllo se devo renderizzare la pagina per l'inserimento delle categorie
        String categoriaFiglio = request.getParameter("categoria_figlio");
        if (categoriaFiglio != null) {
            richiestaCaratteristicheRender(request, response, categoriaFiglio);
            return;
        }
        //Controllo se devo renderizzare la pagina (ramo else) oppure se tornare un json con le categorie
        String padreIdParam = request.getParameter("categoriaId");
        if (padreIdParam != null) {
            richiestaCategoria(request, response, padreIdParam);
        } else {
            renderPage(request, response);
        }

    }

    private void richiestaCaratteristicheRender(HttpServletRequest request, HttpServletResponse response, String categoriaFiglioId) throws TemplateManagerException, DataException {
        TemplateResult result = new TemplateResult(getServletContext());
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
        CaratteristicaDAO caratteristicaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCaratteristicaDAO();

        // Recupera la categoria figlia
        Categoria categoriaFiglio = categoriaDAO.getCategoriaById(SecurityHelpers.checkNumeric(categoriaFiglioId));

        // Ottieni i padri della categoria figlia
        List<Categoria> listCategorieAlbero = categoriaDAO.getPadriByCategoriaId(categoriaFiglio.getKey());

        // Inizializza una lista per le caratteristiche
        List<Caratteristica> caratteristicheList = new ArrayList<>();

        // Raccogli le caratteristiche da ciascuna categoria nell'albero
        for (Categoria categoria : listCategorieAlbero) {
            List<Caratteristica> caratteristiche = caratteristicaDAO.getCaratteristicheByCategoria(categoria.getKey());
            caratteristicheList.addAll(caratteristiche);
        }

        // Imposta le caratteristiche nella richiesta per FreeMarker
        request.setAttribute("caratteristicheList", caratteristicheList);
        request.setAttribute("navbarTitle", "Crea Richiesta 2/2");
        request.setAttribute("categoria_figlio", categoriaFiglio.getKey());

        // Attiva il template FreeMarker
        result.activate("/ordinante/creaRichiesta/creaRichiesta_caratteristiche.ftl", request, response);
    }

    //ritorno le categorie figlie come json
    private void richiestaCategoria(HttpServletRequest request, HttpServletResponse response, String padreIdParam) {
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();
        int padreId = Integer.parseInt(padreIdParam);
        List<Categoria> categorieFiglie = null;
        try {
            categorieFiglie = categoriaDAO.getCategorieByPadre(padreId);

            // Serializzazione della lista in JSON e invio nella risposta
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(categorieFiglie);

            response.setContentType("application/json");
            response.getWriter().write(json);
            return;
        } catch (DataException e) {
            throw new RuntimeException(e);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    //Renderizzo la pagina
    private void renderPage(HttpServletRequest request, HttpServletResponse response) throws DataException, TemplateManagerException {
        CategoriaDAO categoriaDAO = ((AppDataLayer) request.getAttribute("datalayer")).getCategoriaDAO();

        TemplateResult result = new TemplateResult(getServletContext());
        request.setAttribute("rootCategory", categoriaDAO.getCategoriePadri());
        request.setAttribute("navbarTitle", "Crea Richiesta 1/2");

        result.activate("/ordinante/creaRichiesta/creaRichiesta_categorie.ftl", request, response);
    }
}