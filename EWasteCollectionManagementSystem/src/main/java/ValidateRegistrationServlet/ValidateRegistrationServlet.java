package ValidateRegistrationServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidateRegistrationServlet")
public class ValidateRegistrationServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String field = request.getParameter("field");
        String value = request.getParameter("value");

        response.setContentType("text/plain");

        if (field == null || value == null) {
            response.getWriter().write("Invalid request.");
            return;
        }

        value = value.trim();

        if (field.equals("name")) {

            if (value.isEmpty()) {
                response.getWriter().write("Name is required.");
            } 
            else if (!value.matches("[a-zA-Z ]+")) {
                response.getWriter().write("Name should contain only letters.");
            } 
            else {
                response.getWriter().write("Valid name.");
            }

        } 
        else if (field.equals("email")) {

            if (value.isEmpty()) {
                response.getWriter().write("Email is required.");
            } 
            else if (!value.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
                response.getWriter().write("Enter a valid email address.");
            } 
            else {
                response.getWriter().write("Valid email.");
            }

        } 
        else if (field.equals("phone")) {

            if (value.isEmpty()) {
                response.getWriter().write("Phone number is required.");
            } 
            else if (!value.matches("[0-9]{10}")) {
                response.getWriter().write("Phone number must contain 10 digits.");
            } 
            else {
                response.getWriter().write("Valid phone number.");
            }

        } 
        else if (field.equals("address")) {

            if (value.isEmpty()) {
                response.getWriter().write("Address is required.");
            } 
            else if (value.length() < 5) {
                response.getWriter().write("Address is too short.");
            } 
            else {
                response.getWriter().write("Valid address.");
            }

        } 
        else if (field.equals("waste")) {

            if (value.isEmpty()) {
                response.getWriter().write("Please select waste type.");
            } 
            else {
                response.getWriter().write("Waste type selected.");
            }

        } 
        else {
            response.getWriter().write("Unknown field.");
        }
    }
}