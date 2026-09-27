<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>E-Waste Feedback</title>


<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f7f2;
        margin: 0;
        padding: 0;
    }

    header {
        background: #2e7d32;
        color: white;
        padding: 18px 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    header h1 {
        margin: 0;
        font-size: 24px;
    }

    nav {
        display: flex;
        align-items: center;
        gap: 20px;
        flex-wrap: wrap;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }

    nav a:hover {
        text-decoration: underline;
    }

    .search-box {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .search-box input {
        width: 130px;
        padding: 8px;
        border: none;
        border-radius: 5px;
    }

    .search-box button {
        width: auto;
        margin: 0;
        padding: 8px 12px;
        background: white;
        color: #2e7d32;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .search-box button:hover {
        background: #e8f5e9;
    }

    .container {
        width: 500px;
        margin: 50px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        color: #2e7d32;
    }

    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }

    .container input,
    .container select,
    .container textarea {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    textarea {
        height: 100px;
        resize: none;
    }

    .container button {
        width: 100%;
        margin-top: 20px;
        padding: 12px;
        background: #2e7d32;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
    }

    .container button:hover {
        background: #1b5e20;
    }

    .back {
        text-align: center;
        margin-top: 20px;
    }

    .back a {
        color: #2e7d32;
        text-decoration: none;
    }

    .back a:hover {
        text-decoration: underline;
    }
</style>


</head>

<body>

<header>

<h1> E-Waste Collection Management System</h1>

<nav>

    <a href="${pageContext.request.contextPath}/index.jsp">
        Home
    </a>

    <a href="${pageContext.request.contextPath}/ecommerce/products.jsp">
        E-Store
    </a>

    <a href="${pageContext.request.contextPath}/feedback/feedback5.jsp">
        Feedback5
    </a>

    <a href="${pageContext.request.contextPath}/feedback/searchFeedback.jsp">
        Search
    </a>
   

</nav>


</header>

<div class="container">


<h2>Feedback Form</h2>

<form action="${pageContext.request.contextPath}/FeedbackServlet"
      method="post">

    <label>Name</label>

    <input type="text"
           name="name"
           placeholder="Enter your name"
           required>

    <label>Rating</label>

    <select name="rating" required>

        <option value="">Select Rating</option>
        <option value="1">1 - Poor</option>
        <option value="2">2 - Fair</option>
        <option value="3">3 - Good</option>
        <option value="4">4 - Very Good</option>
        <option value="5">5 - Excellent</option>

    </select>

    <label>Comment</label>

    <textarea name="comment"
              placeholder="Enter your feedback"
              required></textarea>

    <button type="submit">
        Submit Feedback
    </button>

</form>

<div class="back">

    <a href="${pageContext.request.contextPath}/index.jsp">
        Back to Home
    </a>

</div>


</div>

</body>
</html>
