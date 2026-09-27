<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<title>Collection Request</title>

<link rel="stylesheet" href="c3.css">

<script>

function showInfo()
{
    let waste =
        document.getElementById("wasteType").value;

    let msg = "";

    if(waste == "Mobile")
    {
        msg = "Mobile phones contain recyclable metals.";
    }

    else if(waste == "Laptop")
    {
        msg = "Laptops contain reusable electronic parts.";
    }

    else if(waste == "Battery")
    {
        msg = "Batteries must be disposed safely.";
    }

    else if(waste == "Printer")
    {
        msg = "Printers contain recyclable plastic components.";
    }

    document.getElementById("info").innerHTML = msg;
}


function validateRequest()
{
    let id =
        document.getElementById("registrationId").value;

    let waste =
        document.getElementById("wasteType").value;

    let location =
        document.getElementById("location").value;


    if(id == "")
    {
        alert("Enter Registration ID");
        return false;
    }


    if(waste == "")
    {
        alert("Select Waste Type");
        return false;
    }


    if(location == "")
    {
        alert("Enter Collection Location");
        return false;
    }


    return true;
}


function changeColor()
{
    document.getElementById("title").style.color = "green";
}

</script>

</head>


<body>


<header>

<h1 id="title"
    onmouseover="changeColor()">

Collection Request Page

</h1>

<p>
Request doorstep collection of your electronic waste
</p>

<nav>

<a href="index.jsp">Home</a>

<a href="register.jsp">Register</a>

<a href="request.jsp">Collection Request</a>

</nav>

</header>


<main>


<section>

<h2>Request Details</h2>


<form action="RequestServlet"
      method="post"
      onsubmit="return validateRequest()">


<label>Registration ID</label>

<input type="text"
       id="registrationId"
       name="registrationId"
       placeholder="Enter your registration ID">


<br><br>


<label>Select Waste Type</label>

<select id="wasteType"
        name="wasteType"
        onchange="showInfo()">

<option value="">
Select
</option>

<option value="Mobile">
Mobile
</option>

<option value="Laptop">
Laptop
</option>

<option value="Battery">
Battery
</option>

<option value="Printer">
Printer
</option>

</select>


<p id="info"></p>


<br>


<label>Collection Location</label>

<input type="text"
       id="location"
       name="location"
       placeholder="Enter collection location">


<br><br>


<label>Preferred Date</label>

<input type="date"
       name="collectionDate">


<br><br>


<button type="submit">

Submit Collection Request

</button>


</form>

</section>


<section>

<h2>Collection Process</h2>

<p>
1. Register yourself with our system.
</p>

<p>
2. Submit a collection request.
</p>

<p>
3. Our team verifies the request.
</p>

<p>
4. E-waste is collected from your location.
</p>

<p>
5. Waste is sent to an authorized recycling center.
</p>

</section>


<br>


<button>

<a href="index.jsp">
Home
</a>

</button>


</main>


</body>

</html>