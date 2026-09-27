<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Search Feedback</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7f4;
            color: #333;
        }

        .search-page {
            min-height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
        }

        .search-card {
            width: 500px;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
            text-align: center;
        }

        .search-card h2 {
            color: #0b8f52;
            font-size: 30px;
            margin-bottom: 10px;
        }

        .search-card p {
            color: #666;
            margin-bottom: 30px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            outline: none;
            border-color: #0b8f52;
            box-shadow: 0 0 5px rgba(11,143,82,.3);
        }

        .search-btn {
            background: #0b8f52;
            color: white;
            border: none;
            padding: 14px 35px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: .3s;
        }

        .search-btn:hover {
            background: #06753f;
            transform: scale(1.05);
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            color: #0b8f52;
            text-decoration: none;
            font-weight: bold;
        }

        .back-btn:hover {
            color: #06753f;
        }
    </style>

</head>

<body>

    <div class="search-page">

        <div class="search-card">

            <h2>Search Feedback</h2>

            <p>
                Search feedback records using rating conditions
            </p>

           <form action="${pageContext.request.contextPath}/SearchFeedbackServlet" method="get">

                <div class="form-group">

                    <label for="rating">
                        Minimum Rating
                    </label>

                    <input
                        type="number"
                        id="rating"
                        name="rating"
                        min="1"
                        max="5"
                        placeholder="Enter rating (1-5)"
                        required>

                </div>

                <button type="submit" class="search-btn">
                    Search Feedback
                </button>

            </form>

            <a href="${pageContext.request.contextPath}/feedback/feedback.jsp" class="back-btn">
                Back
            </a>

        </div>

    </div>

</body>
</html>