package SearchFeedbackServlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import javax.xml.xpath.*;

import org.w3c.dom.*;

@WebServlet("/SearchFeedbackServlet")
public class SearchFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String rating = request.getParameter("rating");

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            String filePath =
                    getServletContext()
                    .getRealPath("/feedback/feedbackDB.xml");

            File xmlFile = new File(filePath);

            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();

            DocumentBuilder builder =
                    factory.newDocumentBuilder();

            Document document =
                    builder.parse(xmlFile);

            XPathFactory xPathFactory =
                    XPathFactory.newInstance();

            XPath xpath =
                    xPathFactory.newXPath();

            String expression =
                    "/feedbacks/feedback[rating>="
                    + rating + "]";

            NodeList result =
                    (NodeList) xpath.evaluate(
                            expression,
                            document,
                            XPathConstants.NODESET
                    );

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Search Result</title>");
            out.println("</head>");

            out.println("<body>");

            out.println("<h2>Feedback with Rating >= "
                    + rating + "</h2>");

            out.println("<table border='1'>");

            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Name</th>");
            out.println("<th>Email</th>");
            out.println("<th>Rating</th>");
            out.println("<th>Category</th>");
            out.println("<th>Comment</th>");
            out.println("</tr>");

            for (int i = 0; i < result.getLength(); i++) {

                Element feedback =
                        (Element) result.item(i);

                out.println("<tr>");

                out.println("<td>"
                        + getValue(feedback, "id")
                        + "</td>");

                out.println("<td>"
                        + getValue(feedback, "name")
                        + "</td>");

                out.println("<td>"
                        + getValue(feedback, "email")
                        + "</td>");

                out.println("<td>"
                        + getValue(feedback, "rating")
                        + "</td>");

                out.println("<td>"
                        + getValue(feedback, "category")
                        + "</td>");

                out.println("<td>"
                        + getValue(feedback, "comment")
                        + "</td>");

                out.println("</tr>");
            }

            out.println("</table>");

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            e.printStackTrace();

            out.println("<h2>Error</h2>");
            out.println("<p>"
                    + e.getMessage()
                    + "</p>");
        }
    }

    private String getValue(Element element,
                            String tagName) {

        NodeList nodes =
                element.getElementsByTagName(tagName);

        if (nodes.getLength() > 0) {

            return nodes.item(0)
                    .getTextContent();

        }

        return "";
    }
}