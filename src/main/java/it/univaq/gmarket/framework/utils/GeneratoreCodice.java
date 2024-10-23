package it.univaq.gmarket.framework.utils;

import java.security.SecureRandom;
import java.util.HashSet;
import java.util.Set;

import it.univaq.gmarket.data.dao.PropostaDAO;
import it.univaq.gmarket.data.dao.RichiestaDAO;

import it.univaq.gmarket.framework.data.DataException;

public class GeneratoreCodice {

    // Set di caratteri alfanumerici (numeri + lettere maiuscole)
    private static final String CHAR_SET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int CODICE_LENGTH = 5;
    private static final SecureRandom random = new SecureRandom();

    // Funzione per generare un codice alfanumerico casuale di 5 caratteri
    public static String generaCodiceUnivoco(RichiestaDAO richiestaDAO) throws DataException {
        String codice;
        boolean isUnico;
        do {
            codice = generaCodiceCasuale();  // Genera un codice casuale
            isUnico = verificaUnicita(codice, richiestaDAO);  // Verifica che il codice sia unico nel DB
        } while (!isUnico);  // Continua a rigenerare il codice finché non è unico

        return codice;  // Ritorna il codice univoco
    }

    // Funzione per generare un codice casuale di 5 caratteri
    private static String generaCodiceCasuale() {
        StringBuilder codiceBuilder = new StringBuilder(CODICE_LENGTH);
        for (int i = 0; i < CODICE_LENGTH; i++) {
            int randomIndex = random.nextInt(CHAR_SET.length());
            codiceBuilder.append(CHAR_SET.charAt(randomIndex));
        }
        return codiceBuilder.toString();

    }

    // Funzione per verificare se il codice è unico nel database
    private static boolean verificaUnicita(String codice, RichiestaDAO richiestaDAO) throws DataException {
        // Controlla nel database se il codice è già presente (puoi adattare la query nel DAO)
        return richiestaDAO.isCodiceUnico(codice);
    }


    // Funzione per generare un codice alfanumerico casuale di 5 caratteri
    public static String generaCodiceUnivocoProposta(PropostaDAO propostaDAO) throws DataException {
        String codice;
        boolean isUnico;
        do {
            codice = generaCodiceCasuale();  // Genera un codice casuale
            isUnico = verificaUnicitaProposta(codice, propostaDAO);  // Verifica che il codice sia unico nel DB
        } while (!isUnico);  // Continua a rigenerare il codice finché non è unico

        return codice;  // Ritorna il codice univoco
    }

    // Funzione per verificare se il codice è unico nel database
    private static boolean verificaUnicitaProposta(String codice, PropostaDAO propostaDAO) throws DataException {
        // Controlla nel database se il codice è già presente (puoi adattare la query nel DAO)
        return propostaDAO.isCodiceUnico(codice);
    }

}
