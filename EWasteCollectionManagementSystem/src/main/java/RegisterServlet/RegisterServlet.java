package RegisterServlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBConnection.DBConnection;


@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {


        // Get values from JSP form

        String id =
                request.getParameter("rid");

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");

        String address =
                request.getParameter("address");

        String waste =
                request.getParameter("waste");


        try {

            // Get database connection

            Connection con =
                    DBConnection.getConnection();


            // SQL query

            String sql =
                    "INSERT INTO users " +
                    "(registration_id, name, email, phone, address, waste_type) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";


            // PreparedStatement

            PreparedStatement ps =
                    con.prepareStatement(sql);


            // Set values

            ps.setString(1, id);

            ps.setString(2, name);

            ps.setString(3, email);

            ps.setString(4, phone);

            ps.setString(5, address);

            ps.setString(6, waste);


            // Execute INSERT

            int result =
                    ps.executeUpdate();


            if(result > 0) {

                response.setContentType("text/html");

                response.getWriter().println(

                    "<html>" +
                    "<body>" +

                    "<h1>Registration Successful</h1>" +

                    "<p>Registration ID: " + id + "</p>" +

                    "<p>Name: " + name + "</p>" +

                    "<p>Email: " + email + "</p>" +

                    "<p>Waste Type: " + waste + "</p>" +

                    "<br>" +

                    "<a href='index.jsp'>Go to Home</a>" +

                    "</body>" +
                    "</html>"

                );

            }


            ps.close();

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Database Error</h2>"
            );

        }

    }

}