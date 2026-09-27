<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="ecommerce.css">
</head>
<body>

<header>
    <h1>♻ E-Waste E-Store</h1>
    <p>Secure Checkout</p>


<nav>
    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp">Products</a>
    <a href="${pageContext.request.contextPath}/ecommerce/cart.jsp">Cart</a>
</nav>


</header>

<main>


<div class="form-card">

    <h2>Checkout</h2>

    <form action="${pageContext.request.contextPath}/OrderServlet" method="post">

        <label>Full Name</label>
        <input type="text"
               name="name"
               placeholder="Enter your name"
               required>

        <label>Email</label>
        <input type="email"
               name="email"
               placeholder="Enter your email"
               required>

        <label>Phone Number</label>
        <input type="text"
               name="phone"
               placeholder="10-digit phone number"
               required>

        <label>Delivery Address</label>
        <textarea name="address"
                  placeholder="Enter delivery address"
                  required></textarea>

        <label>Total Amount</label>

        <%
        String price = (String) session.getAttribute("price");
        String quantity = (String) session.getAttribute("quantity");

        double total = 0;

        if (price != null && quantity != null) {
            total = Double.parseDouble(price)
                  * Integer.parseInt(quantity);
        }
        %>

        <input type="text"
               name="totalAmount"
               value="<%= total %>"
               readonly>

        <input type="submit"
               value="Place Order">

    </form>

</div>


</main>

<footer>
    <p>♻ E-Waste Collection Management System</p>
    <p>© 2026 All Rights Reserved</p>
</footer>

</body>
</html>
