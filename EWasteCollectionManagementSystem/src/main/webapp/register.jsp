<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>User Registration</title>

    <link rel="stylesheet" href="c2.css">

    <script>

        function generateID()
        {
            let id = "EW" + Math.floor(Math.random() * 10000);

            document.getElementById("rid").value = id;
        }
   
        function validateField(field) {

            let value = document.getElementById(field).value;

            let message = document.getElementById(field + "Message");

            if (value.trim() === "") {
                message.innerHTML = "This field is required.";
                message.style.color = "red";
                return;
            }

            let xhr = new XMLHttpRequest();

            xhr.open(
                "GET",
                "ValidateRegistrationServlet?field=" +
                encodeURIComponent(field) +
                "&value=" +
                encodeURIComponent(value),
                true
            );

            xhr.onreadystatechange = function() {

                if (xhr.readyState === 4 && xhr.status === 200) {

                    message.innerHTML = xhr.responseText;

                    if (xhr.responseText.startsWith("Valid")) {
                        message.style.color = "green";
                    } 
                    else if (xhr.responseText.includes("selected")) {
                        message.style.color = "green";
                    } 
                    else {
                        message.style.color = "red";
                    }
                }
            };

            xhr.send();
        }

        
        function checkAllFields() {

            let name = document.getElementById("name").value.trim();
            let email = document.getElementById("email").value.trim();
            let phone = document.getElementById("phone").value.trim();
            let address = document.getElementById("address").value.trim();
            let waste = document.getElementById("waste").value.trim();

            if (name === "" ||
                email === "" ||
                phone === "" ||
                address === "" ||
                waste === "") {

                alert("Please fill all required fields.");
                return false;
            }

            return true;
        }
       
    </script>

</head>


<body>


<header class="header">

    <h1>♻ User Registration</h1>

    <p>Register yourself for E-Waste Collection Service</p>

    <nav>

        <a href="index.jsp">Home</a>

        <a href="register.jsp">Register</a>

        <a href="request.jsp">Collection Request</a>

    </nav>

</header>


<main>

<section class="register-section">

<h2>User Registration Form</h2>


<!-- Form sends data to Servlet -->

<form action="RegisterServlet" method="post" onsubmit="return checkAllFields()">


<fieldset>

<legend>Personal Details</legend>


<label>Registration ID</label>

<div class="id-box">

<input type="text"
       id="rid"
       name="rid"
       readonly>

<button type="button"
        onclick="generateID()">

Generate ID

</button>

</div>


<label>Name</label>
<input type="text" id="name" name="name"
       placeholder="Enter your name"
       onkeyup="validateField('name')">
<p id="nameMessage"></p>


<label>Email</label>
<input type="email" id="email" name="email"
       placeholder="Enter your email"
       onkeyup="validateField('email')">
<p id="emailMessage"></p>


<label>Phone</label>
<input type="text" id="phone" name="phone"
       placeholder="Enter your phone number"
       onkeyup="validateField('phone')">
<p id="phoneMessage"></p>


<label>Address</label>
<textarea id="address" name="address"
          placeholder="Enter your address"
          onkeyup="validateField('address')"></textarea>
<p id="addressMessage"></p>

<label>Waste Type</label>
<select id="waste" name="waste" onchange="validateField('waste')">
    <option value="">Select Waste Type</option>
    <option value="Mobile">Mobile</option>
    <option value="Laptop">Laptop</option>
    <option value="Battery">Battery</option>
    <option value="Printer">Printer</option>
</select>
<p id="wasteMessage"></p>


<div class="btn-group">

<input type="submit"
       value="Register">

<input type="reset"
       value="Clear">

</div>


</fieldset>

</form>

</section>

</main>


<footer>

<p>♻ E-Waste Collection Management System</p>

<p>© 2026 All Rights Reserved</p>

</footer>


</body>

</html>