package it.univaq.gmarket.app.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.univaq.gmarket.app.AppDataLayer;
import it.univaq.gmarket.data.dao.CategoriaDAO;
import it.univaq.gmarket.data.model.Categoria;
import it.univaq.gmarket.framework.data.DataException;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RichiestaController extends AppBaseController {

    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //Controllo se devo renderizzare la pagina (ramo else) oppure se tornare un json con le categorie
        String padreIdParam = request.getParameter("categoriaId");
        if (padreIdParam != null) {
            richiestaCategoria(request, response, padreIdParam);
        } else {
            renderPage(request, response);
        }

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
        request.setAttribute("navbarTitle", "Crea Richiesta");
        result.activate("/ordinante/creaRichiesta.ftl", request, response);
    }
}