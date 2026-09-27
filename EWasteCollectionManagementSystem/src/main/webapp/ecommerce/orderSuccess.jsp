<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Order Successful</title>
    <link rel="stylesheet" href="ecommerce.css">
</head>
<body>

<header>
    <h1>♻ E-Waste E-Store</h1>
    <p>Order Confirmation</p>
</header>

<main>
    <div class="success-box">

    <div class="success-icon">✓</div>

    <h2>Order Placed Successfully!</h2>

    <%
    Integer orderId = (Integer) session.getAttribute("orderId");
    Double total = (Double) session.getAttribute("totalAmount");
    %>

    <p>
        <strong>Order ID:</strong>
        <%= orderId %>
    </p>

    <p>
        <strong>Total Amount:</strong>
        ₹<%= total %>
    </p>

    <p>
        Thank you for shopping with us.
    </p>

    <br>

    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp" class="btn">
        Continue Shopping
    </a>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn">
        Go to Home
    </a>

</div>


</main>

<footer>
    <p>♻ E-Waste Collection Management System</p>
    <p>© 2026 All Rights Reserved</p>
</footer>

</body>
</html>
