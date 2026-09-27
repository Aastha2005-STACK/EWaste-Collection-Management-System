package EcommerceServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        HttpSession session = request.getSession();

        session.setAttribute("productId", productId);
        session.setAttribute("productName", productName);
        session.setAttribute("price", price);
        session.setAttribute("quantity", quantity);

        response.sendRedirect(
        	    request.getContextPath()
        	    + "/ecommerce/cart.jsp"
        	);
    }
}