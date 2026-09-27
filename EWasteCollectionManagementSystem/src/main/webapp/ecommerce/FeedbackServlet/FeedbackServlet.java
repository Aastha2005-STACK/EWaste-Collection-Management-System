package FeedbackServlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 System.out.println("===== FEEDBACK SERVLET STARTED =====");

    	 

        String name = request.getParameter("name");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        String xmlPath = getServletContext()
                .getRealPath("/feedback/feedback3.xml");

        String xslPath = getServletContext()
                .getRealPath("/feedback/feedback3.xsl");

        File xmlFile = new File(xmlPath);
        
        System.out.println("XML PATH: " + xmlPath);
        System.out.println("XML EXISTS: " + xmlFile.exists());
        System.out.println("XSL PATH: " + xslPath);

        try {

            StringBuilder xml = new StringBuilder();

            BufferedReader reader =
                    new BufferedReader(new FileReader(xmlFile));

            String line;

            while ((line = reader.readLine()) != null) {
                xml.append(line).append("\n");
            }

            reader.close();

            String newFeedback =
                    "    <feedback>\n" +
                    "        <name>" + escapeXML(name) + "</name>\n" +
                    "        <rating>" + escapeXML(rating) + "</rating>\n" +
                    "        <comment>" + escapeXML(comment) + "</comment>\n" +
                    "    </feedback>\n";

            int position = xml.lastIndexOf("</feedbacks>");

            if (position == -1) {
                throw new IOException(
                        "Closing </feedbacks> tag not found."
                );
            }

            xml.insert(position, newFeedback);

            BufferedWriter writer =
                    new BufferedWriter(new FileWriter(xmlFile));

            writer.write(xml.toString());
            writer.close();

            response.setContentType("text/html;charset=UTF-8");

            TransformerFactory factory =
                    TransformerFactory.newInstance();

            Transformer transformer =
                    factory.newTransformer(
                            new StreamSource(new File(xslPath))
                    );
            
            System.out.println("Starting XSLT transformation...");

            transformer.transform(
                    new StreamSource(xmlFile),
                    new StreamResult(response.getWriter())
            );
            
            System.out.println("XSLT transformation completed...");

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<h2>Error while processing feedback</h2>"
            );

            response.getWriter().println(
                    "<p>" + escapeHTML(e.getMessage()) + "</p>"
            );
        }
    }

    private String escapeXML(String text) {

        if (text == null) {
            return "";
        }

        return text
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&apos;");
    }

    private String escapeHTML(String text) {

        if (text == null) {
            return "";
        }

        return text
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;");
    }
}