package RequestServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBConnection.DBConnection;

@WebServlet("/RequestServlet")

public class RequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // Get data from request.jsp

        String registrationId =
                request.getParameter("registrationId");

        String wasteType =
                request.getParameter("wasteType");

        String location =
                request.getParameter("location");

        String collectionDate =
                request.getParameter("collectionDate");


        try {

            // Get database connection

            Connection con =
                    DBConnection.getConnection();


            // SQL query

            String sql =
                "INSERT INTO collection_requests " +
                "(registration_id, waste_type, location, status) " +
                "VALUES (?, ?, ?, ?)";


            // Create PreparedStatement

            PreparedStatement ps =
                    con.prepareStatement(sql);


            // Set values

            ps.setString(1, registrationId);

            ps.setString(2, wasteType);

            ps.setString(3, location);

            ps.setString(4, "Pending");


            // Execute query

            int result =
                    ps.executeUpdate();


            response.setContentType("text/html");

            if(result > 0)
            {

                response.getWriter().println(

                    "<html>" +
                    "<head>" +
                    "<title>Request Successful</title>" +
                    "</head>" +

                    "<body>" +

                    "<h1>Collection Request Submitted Successfully!</h1>" +

                    "<p><b>Registration ID:</b> "
                    + registrationId +
                    "</p>" +

                    "<p><b>Waste Type:</b> "
                    + wasteType +
                    "</p>" +

                    "<p><b>Location:</b> "
                    + location +
                    "</p>" +

                    "<p><b>Preferred Date:</b> "
                    + collectionDate +
                    "</p>" +

                    "<p><b>Status:</b> Pending</p>" +

                    "<br>" +

                    "<a href='index.jsp'>Go to Home</a>" +

                    "</body>" +

                    "</html>"
                );

            }


            ps.close();

            con.close();

        }

        catch(Exception e)
        {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(

                "<h2>Database Error</h2>" +

                "<p>" + e.getMessage() + "</p>"

            );

        }

    }

}