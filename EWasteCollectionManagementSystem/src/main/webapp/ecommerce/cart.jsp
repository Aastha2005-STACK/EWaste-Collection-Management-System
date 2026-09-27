<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="ecommerce.css">
</head>
<body>

<header>
    <h1>♻ E-Waste E-Store</h1>
    <p>Shopping Cart</p>


<nav>
    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp">Products</a>
    <a href="${pageContext.request.contextPath}/ecommerce/cart.jsp">Cart</a>
</nav>


</header>

<main>


<h2>🛒 Your Shopping Cart</h2>

<div class="cart-box">

    <%
    String productName = (String) session.getAttribute("productName");
    String price = (String) session.getAttribute("price");
    String quantity = (String) session.getAttribute("quantity");

    if (productName != null) {
    %>

    <h3><%= productName %></h3>

    <p>Price: ₹<%= price %></p>

    <p>Quantity: <%= quantity %></p>

    <br>

    <a href="${pageContext.request.contextPath}/ecommerce/checkout.jsp"
       class="btn">
        Proceed to Checkout
    </a>

    <%
    } else {
    %>

    <p class="empty-cart">
        Your cart is empty.
    </p>

    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp"
       class="btn">
        Continue Shopping
    </a>

    <%
    }
    %>

</div>


</main>

<footer>
    <p>♻ E-Waste Collection Management System</p>
    <p>© 2026 All Rights Reserved</p>
</footer>

</body>
</html>
