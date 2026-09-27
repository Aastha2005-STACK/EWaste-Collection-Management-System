<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>5-Input Feedback Form</title>

    <style>
    body {
            font-family: Arial, sans-serif;
            background: #f2f7f2;
            margin: 0;
            padding: 0;
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

        input, select, textarea {
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

        button {
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

        button:hover {
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
    </style>
</head>

<body>

<div class="container">

    <h2>Customer Feedback</h2>

   <form action="${pageContext.request.contextPath}/Feedback5Servlet" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

       <label>Rating</label>
<input type="number" name="rating" min="1" max="5" required>

        <label>Category</label>
        <select name="category" required>
            <option value="">Select Category</option>
            <option value="Collection Service">Collection Service</option>
            <option value="E-Store">E-Store</option>
            <option value="Customer Support">Customer Support</option>
            <option value="Website">Website</option>
        </select>

        <label>Comment</label>
        <textarea name="comment" required></textarea>

        <button type="submit">Submit Feedback</button>

    </form>

    <br>

  <a href="${pageContext.request.contextPath}/feedback/feedback.jsp">Back</a>

</div>

</body>
</html>