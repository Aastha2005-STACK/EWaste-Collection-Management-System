package EcommerceServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DBConnection;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        HttpSession session = request.getSession();

        String price =
            (String) session.getAttribute("price");

        String productId =
            (String) session.getAttribute("productId");

        String quantity =
            (String) session.getAttribute("quantity");

        try {

            Connection con = DBConnection.getConnection();

            double total =
                Double.parseDouble(price)
                * Integer.parseInt(quantity);

            String sql =
                "INSERT INTO orders " +
                "(customer_name,email,phone,address,total_amount) " +
                "VALUES (?,?,?,?,?)";

            PreparedStatement ps =
                con.prepareStatement(
                    sql,
                    PreparedStatement.RETURN_GENERATED_KEYS
                );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setDouble(5, total);

            ps.executeUpdate();

            ResultSet rs =
                ps.getGeneratedKeys();

            int orderId = 0;

            if(rs.next()) {
                orderId = rs.getInt(1);
            }

            String itemSql =
                "INSERT INTO order_items " +
                "(order_id,product_id,quantity,price) " +
                "VALUES (?,?,?,?)";

            PreparedStatement itemPs =
                con.prepareStatement(itemSql);

            itemPs.setInt(1, orderId);
            itemPs.setInt(2,
                Integer.parseInt(productId));
            itemPs.setInt(3,
                Integer.parseInt(quantity));
            itemPs.setDouble(4,
                Double.parseDouble(price));

            itemPs.executeUpdate();

            session.setAttribute(
                "orderId",
                orderId
            );

            session.setAttribute(
                "totalAmount",
                total
            );

            response.sendRedirect(
            	    request.getContextPath()
            	    + "/ecommerce/orderSuccess.jsp"
            	);

        }
        catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Database Error: " + e.getMessage()
            );
        }
    }
}