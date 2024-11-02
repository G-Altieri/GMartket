package it.univaq.gmarket.framework.utils;



import com.lowagie.text.DocumentException;
import it.univaq.gmarket.data.model.Proposta;
import it.univaq.gmarket.data.model.Richiesta;
import it.univaq.gmarket.data.model.impl.StatoProposta;
import it.univaq.gmarket.framework.result.TemplateManagerException;
import it.univaq.gmarket.framework.result.TemplateResult;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Logger;

public class EmailSender {

    public enum Event {
        NUOVA_PROPOSTA,
        RISPOSTA_PROPOSTA,
        INVIO_ORDINE,
    }

    private String emailFrom, password;
    private Properties properties;

    public EmailSender(String emailFrom, String password, Properties properties) {
        this.emailFrom = emailFrom;
        this.password = password;
        this.properties = properties;
    }

    public void sendEmail(String to,String subject, String messageText) {
        // Uso un thread perchè potrebbe metterci del tempo ad inviare l'email
        new Thread(() -> {

            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(emailFrom, password);
                }
            });

            try {
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session);

                // Set From: header field of the header.
                message.setFrom(new InternetAddress(emailFrom));

                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                // Set Subject: header field
                message.setSubject(subject);

                // Now set the actual message
                message.setText(messageText);

                // Send message
                Transport.send(message);
                System.out.println("Email inviata correttamente");
               // Logger.getLogger(EmailSender.class.getName()).info("Sent message successfully....");
            } catch (MessagingException mex) {
                Logger.getLogger(EmailSender.class.getName()).severe(mex.getMessage());
            }
        }).start();
    }

    public void sendPDFWithEmail(ServletContext context, String to, Object obj, Event event) {
        TemplateResult result = new TemplateResult(context);
        String htmlresult = "";
        Map<String, Object> datamodel = new HashMap<>();
        Map<String, String> values = new HashMap<>();
        StringBuilder sb = new StringBuilder();
        StringWriter writer = null;
        Proposta proposta = null;

        switch (event) {
            case NUOVA_PROPOSTA:
                 // Cast the proposal object
                proposta = (Proposta) obj;
                // Configure data for the template
                datamodel.put("proposta", proposta);  // Add the proposal object to the data model

                // Prepare to store the generated HTML content
                writer = new StringWriter();  // Using StringWriter for capturing HTML output
                // Process the template to generate the email content
                try {
                    // Activate the TemplateResult to generate output to the writer
                    result.activate("/pdf/proposta.ftl", datamodel, writer);
                    htmlresult = writer.toString();  // Convert the writer's output to a string
                } catch (TemplateManagerException e) {
                    e.printStackTrace();
                    htmlresult = "";  // Ensure htmlresult is initialized even if an error occurs
                }

                // Create the plain text summary for the email body (text format)
                sb.append("Proposta: ").append(proposta.getCodiceProposta()).append("\n");
                sb.append("Nome Prodotto: ").append(proposta.getNomeProdotto()).append("\n");
                sb.append("Produttore: ").append(proposta.getNomeProduttore()).append("\n");
                sb.append("Prezzo: ").append(proposta.getPrezzo()).append("\n");

                // Set additional email metadata like filename, subject, etc.
                values.put("filename", "proposta_" + proposta.getCodiceProposta());  // Dynamic filename for proposal
                values.put("subject", "Nuova Proposta " + proposta.getCodiceProposta());  // Subject line
                values.put("text", sb.toString());  // Plain text content for the email

                // Send the email using a new email sender instance
                newEmailSender(context, to, htmlresult, values);
                break;
            case RISPOSTA_PROPOSTA:
                proposta = (Proposta) obj;  // Cast the proposal object

                // Configure data for the template
                datamodel.put("proposta", proposta);  // Add the proposal object to the data model

                // Prepare to store the generated HTML content
                writer=  new StringWriter();  // Using StringWriter for capturing HTML output
                // Process the template to generate the email content
                try {
                    // Activate the TemplateResult to generate output to the writer
                    result.activate("/pdf/proposta.ftl", datamodel, writer);
                    htmlresult = writer.toString();  // Convert the writer's output to a string
                } catch (TemplateManagerException e) {
                    e.printStackTrace();
                    htmlresult = "";  // Ensure htmlresult is initialized even if an error occurs
                }

                // Create the plain text summary for the email body (text format)
                sb.append("La Proposta: ").append(proposta.getCodiceProposta()).append("\n");
                sb.append("é stata: ").append(proposta.getStatoProposta()).append("\n");
                if(proposta.getStatoProposta().equals(StatoProposta.RIFIUTATO)){
                    sb.append("motivazione: ").append(proposta.getMotivazione()).append("\n");
                }
                sb.append("Nome Prodotto: ").append(proposta.getNomeProdotto()).append("\n");
                sb.append("Produttore: ").append(proposta.getNomeProduttore()).append("\n");
                sb.append("Prezzo: ").append(proposta.getPrezzo()).append("\n");

                // Set additional email metadata like filename, subject, etc.
                values.put("filename", "proposta_" + proposta.getCodiceProposta());  // Dynamic filename for proposal
                values.put("subject", "Risposta Proposta: " + proposta.getCodiceProposta());  // Subject line
                values.put("text", sb.toString());  // Plain text content for the email

                // Send the email using a new email sender instance
                newEmailSender(context, to, htmlresult, values);
                break;
                case INVIO_ORDINE:
                proposta = (Proposta) obj;  // Cast the proposal object

                // Configure data for the template
                datamodel.put("proposta", proposta);  // Add the proposal object to the data model

                // Prepare to store the generated HTML content
                writer=  new StringWriter();  // Using StringWriter for capturing HTML output
                // Process the template to generate the email content
                try {
                    // Activate the TemplateResult to generate output to the writer
                    result.activate("/pdf/ordine.ftl", datamodel, writer);
                    htmlresult = writer.toString();  // Convert the writer's output to a string
                } catch (TemplateManagerException e) {
                    e.printStackTrace();
                    htmlresult = "";  // Ensure htmlresult is initialized even if an error occurs
                }

                // Create the plain text summary for the email body (text format)
                sb.append("L'Ordine: ").append(proposta.getCodiceProposta());
                sb.append(" é stato spedito").append("\n");
                sb.append("Nome Prodotto: ").append(proposta.getNomeProdotto()).append("\n");
                sb.append("Produttore: ").append(proposta.getNomeProduttore()).append("\n");
                sb.append("Prezzo: ").append(proposta.getPrezzo()).append("\n");

                // Set additional email metadata like filename, subject, etc.
                values.put("filename", "ordine_" + proposta.getCodiceProposta());  // Dynamic filename for proposal
                values.put("subject", "L'Ordine é stato spedito: " + proposta.getCodiceProposta());  // Subject line
                values.put("text", sb.toString());  // Plain text content for the email

                // Send the email using a new email sender instance
                newEmailSender(context, to, htmlresult, values);
                break;


        }

    }

    private void newEmailSender(ServletContext context, String to, String htmlresult, Map<String, String> values) {

        new Thread(() -> {
            String outputPdf = context.getRealPath("/WEB-INF/") + values.get("filename") + ".pdf";

            try {

                // Create a new document
                ITextRenderer renderer = new ITextRenderer();
                renderer.setDocumentFromString(htmlresult);
                renderer.layout();

                // Write PDF to file
                FileOutputStream fos = new FileOutputStream(outputPdf);
                renderer.createPDF(fos);
                fos.close();

                // Creazione della sessione di posta
                Session session = Session.getInstance(properties, new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(emailFrom, password);
                    }
                });

                // Messaggio da allegare all'email
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(this.emailFrom)); // Inserire il proprio indirizzo email
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); // Inserire il destinatario
                message.setSubject(values.get("subject"));

                // Creazione del corpo del messaggio
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText(values.get("text"));

                // Creazione della parte dell'allegato
                MimeBodyPart attachmentPart = new MimeBodyPart();
                DataSource source = new FileDataSource(outputPdf);
                attachmentPart.setDataHandler(new DataHandler(source));
                attachmentPart.setFileName(values.get("filename") + ".pdf");

                // Composizione del messaggio
                MimeMultipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                multipart.addBodyPart(attachmentPart);

                // Impostazione del contenuto del messaggio
                message.setContent(multipart);

                // Invio del messaggio
                Transport.send(message);

                Logger.getLogger(EmailSender.class.getName()).info("Email inviata con successo!");

                // Cancella il file PDF dopo l'invio dell'email
                File pdfFile = new File(outputPdf);
                if (pdfFile.exists()) {
                    if (pdfFile.delete()) {
                        Logger.getLogger(EmailSender.class.getName()).info("File PDF eliminato con successo.");
                    } else {
                        Logger.getLogger(EmailSender.class.getName()).warning("Impossibile eliminare il file PDF.");
                    }
                } else {
                    Logger.getLogger(EmailSender.class.getName()).warning("File PDF non trovato durante la cancellazione.");
                }

            } catch (MessagingException | IOException e) {
                Logger.getLogger(EmailSender.class.getName()).severe(e.getMessage());
            } catch (DocumentException e) {
                throw new RuntimeException(e);
            }
        }).start();
    }
}
