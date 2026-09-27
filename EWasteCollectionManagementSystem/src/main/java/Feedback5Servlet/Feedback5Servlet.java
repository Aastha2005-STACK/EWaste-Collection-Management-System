package Feedback5Servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;

@WebServlet("/Feedback5Servlet")
public class Feedback5Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rating = request.getParameter("rating");
        String category = request.getParameter("category");
        String comment = request.getParameter("comment");

        String xmlPath = getServletContext()
                .getRealPath("/feedback/feedback5.xml");

        String xslPath = getServletContext()
                .getRealPath("/feedback/feedback5.xsl");

        if (xmlPath == null || xslPath == null) {
            response.getWriter().println("<h2>File path error</h2>");
            response.getWriter().println("<p>feedback5.xml or feedback5.xsl could not be found.</p>");
            return;
        }

        File xmlFile = new File(xmlPath);
        File xslFile = new File(xslPath);

        if (!xmlFile.exists()) {
            response.getWriter().println("<h2>XML File Not Found</h2>");
            response.getWriter().println("<p>" + xmlFile.getAbsolutePath() + "</p>");
            return;
        }

        if (!xslFile.exists()) {
            response.getWriter().println("<h2>XSL File Not Found</h2>");
            response.getWriter().println("<p>" + xslFile.getAbsolutePath() + "</p>");
            return;
        }

        try {

            StringBuilder xml = new StringBuilder();

            BufferedReader reader =
                    new BufferedReader(
                            new InputStreamReader(
                                    new FileInputStream(xmlFile),
                                    "UTF-8"
                            )
                    );

            String line;

            while ((line = reader.readLine()) != null) {
                xml.append(line).append("\n");
            }

            reader.close();

            String newFeedback =
                    "    <feedback>\n" +
                    "        <name>" + escapeXML(name) + "</name>\n" +
                    "        <email>" + escapeXML(email) + "</email>\n" +
                    "        <rating>" + escapeXML(rating) + "</rating>\n" +
                    "        <category>" + escapeXML(category) + "</category>\n" +
                    "        <comment>" + escapeXML(comment) + "</comment>\n" +
                    "    </feedback>\n";

            int position = xml.lastIndexOf("</feedbacks>");

            if (position == -1) {
                response.getWriter().println("<h2>XML Structure Error</h2>");
                response.getWriter().println("<p>Closing &lt;/feedbacks&gt; tag not found in feedback5.xml.</p>");
                return;
            }

            xml.insert(position, newFeedback);

            BufferedWriter writer =
                    new BufferedWriter(
                            new OutputStreamWriter(
                                    new FileOutputStream(xmlFile),
                                    "UTF-8"
                            )
                    );

            writer.write(xml.toString());
            writer.close();

            TransformerFactory factory =
                    TransformerFactory.newInstance();

            Transformer transformer =
                    factory.newTransformer(
                            new StreamSource(xslFile)
                    );

            transformer.setOutputProperty(
                    OutputKeys.ENCODING,
                    "UTF-8"
            );

            transformer.transform(
                    new StreamSource(xmlFile),
                    new StreamResult(response.getWriter())
            );

        } catch (Exception e) {

            e.printStackTrace();

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

