<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>E-Store - E-Waste Management</title>
    <link rel="stylesheet" href="ecommerce.css">
</head>
<body>

<header>
    <h1>♻ E-Waste E-Store</h1>
    <p>Buy Recycled & Refurbished Electronic Products</p>


<nav>
    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp">E-Store</a>
    <a href="${pageContext.request.contextPath}/ecommerce/cart.jsp">Cart</a>
    <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
</nav>


</header>

<main>
    <h2>Our Products</h2>


<div class="product-container">

    <div class="product-card">
        <div class="product-icon">💻</div>
        <h3>Refurbished Laptop</h3>
        <p>Good quality refurbished laptop.</p>
        <h3>₹25,000</h3>

        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
            <input type="hidden" name="productId" value="1">
            <input type="hidden" name="productName" value="Refurbished Laptop">
            <input type="hidden" name="price" value="25000">
            <input type="hidden" name="quantity" value="1">
            <input type="submit" value="Add to Cart">
        </form>
    </div>

    <div class="product-card">
        <div class="product-icon">📱</div>
        <h3>Refurbished Mobile</h3>
        <p>Certified refurbished smartphone.</p>
        <h3>₹8,000</h3>

        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
            <input type="hidden" name="productId" value="2">
            <input type="hidden" name="productName" value="Refurbished Mobile">
            <input type="hidden" name="price" value="8000">
            <input type="hidden" name="quantity" value="1">
            <input type="submit" value="Add to Cart">
        </form>
    </div>

    <div class="product-card">
        <div class="product-icon">⌨️</div>
        <h3>Recycled Keyboard</h3>
        <p>Eco-friendly recycled keyboard.</p>
        <h3>₹500</h3>

        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
            <input type="hidden" name="productId" value="3">
            <input type="hidden" name="productName" value="Recycled Keyboard">
            <input type="hidden" name="price" value="500">
            <input type="hidden" name="quantity" value="1">
            <input type="submit" value="Add to Cart">
        </form>
    </div>

    <div class="product-card">
        <div class="product-icon">🖥️</div>
        <h3>Refurbished Monitor</h3>
        <p>Good condition refurbished monitor.</p>
        <h3>₹4,000</h3>

        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
            <input type="hidden" name="productId" value="4">
            <input type="hidden" name="productName" value="Refurbished Monitor">
            <input type="hidden" name="price" value="4000">
            <input type="hidden" name="quantity" value="1">
            <input type="submit" value="Add to Cart">
        </form>
    </div>

    <div class="product-card">
        <div class="product-icon">🖱️</div>
        <h3>Recycled Mouse</h3>
        <p>Eco-friendly recycled mouse.</p>
        <h3>₹300</h3>

        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
            <input type="hidden" name="productId" value="5">
            <input type="hidden" name="productName" value="Recycled Mouse">
            <input type="hidden" name="price" value="300">
            <input type="hidden" name="quantity" value="1">
            <input type="submit" value="Add to Cart">
        </form>
    </div>

</div>

</main>

<footer>
    <p>♻ E-Waste Collection Management System</p>
    <p>© 2026 All Rights Reserved</p>
</footer>

</body>
</html>
