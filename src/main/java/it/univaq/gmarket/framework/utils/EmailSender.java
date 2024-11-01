package it.univaq.gmarket.framework.utils;



import com.lowagie.text.DocumentException;
import it.univaq.gmarket.data.model.Richiesta;
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
        RICHIESTA_REGISTRATA, // Mik
    }

    private String emailFrom, password;
    private Properties properties;

    public EmailSender(String emailFrom, String password, Properties properties) {
        this.emailFrom = emailFrom;
        this.password = password;
        this.properties = properties;
    }

    public void sendEmail(String to, String messageText) {
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
                message.setSubject("This is the Subject Line!");

                // Now set the actual message
                message.setText(messageText);

                // Send message
                Transport.send(message);
                System.out.println("Email inviata correttamente");
                Logger.getLogger(EmailSender.class.getName()).info("Sent message successfully....");
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

        switch (event) {
            case RICHIESTA_REGISTRATA:
                Richiesta richiesta = (Richiesta) obj;

                datamodel = new HashMap<>();
                datamodel.put("richiesta", richiesta);
              //  htmlresult = result.activate("/pdf_templates/pdf_richiesta.ftl", new StringWriter());
                //result.activate("/home", request, response);

                sb.append("Richiesta: ").append(richiesta.getCodice()).append("\n");
                sb.append("Data: ").append(richiesta.getCreated_at()).append("\n");
                sb.append("Ordinante: ").append(richiesta.getOrdinante().getEmail()).append("\n");
                sb.append("Note: ").append(richiesta.getNote()).append("\n");
                sb.append("Caratteristiche: ").append("\n");
//                    for ( ccv : richiesta.getCaratteristicheConValore()) {
//                        sb.append(ccv.getCaratteristica().getNome()).append(": ").append(ccv.getValore()).append("\n");
//                    }

                values.put("filename", "richiesta_" + richiesta.getCodice());
                values.put("subject", "Richiesta: " + richiesta.getCodice());
                values.put("text", sb.toString());

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
