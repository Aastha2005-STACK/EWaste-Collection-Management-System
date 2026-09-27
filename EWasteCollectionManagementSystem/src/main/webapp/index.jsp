<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>E-Waste Collection Management System</title>

<link rel="stylesheet" href="j.css">

</head>


<body>

<header>

<h1>♻ E-Waste Collection Management System</h1>

<p>Recycle Electronic Waste For A Better Environment</p>

<nav>

<a href="index.jsp">Home</a>

<a href="register.jsp">Register</a>

<a href="index.jsp#about">About</a>

<a href="index.jsp#services">Services</a>

<a href="index.jsp#centers">Centers</a>

<a href="index.jsp#support">Contact</a>

<a href="${pageContext.request.contextPath}/ecommerce/products.jsp">E-Store</a> 

<a href="${pageContext.request.contextPath}/feedback/feedback.jsp">Feedback</a> 

</nav> 


</header>

</nav>

</header>


<section class="hero">

<div class="hero-content">

<h2>Give Your Old Electronics A New Life</h2>

<p>
Dispose your unwanted electronic devices
safely and help keep our planet clean.
</p>

<a href="request.jsp" class="btn">
Request Pickup
</a>

</div>

</section>


<section class="impact">

<div class="card">

<h2>5000+</h2>

<p>Devices Recycled</p>

</div>


<div class="card">

<h2>2500+</h2>

<p>Happy Customers</p>

</div>


<div class="card">

<h2>25</h2>

<p>Collection Centers</p>

</div>


<div class="card">

<h2>100%</h2>

<p>Eco Friendly</p>

</div>

</section>


<section id="dynamic-display">
    <h2>Live Tracker</h2>

    <div class="stats-box">
        <p>
            <span id="liveCounter">Loading...</span>
        </p>

        <section id="ajax-info">
            <h2>AJAX E-Waste Information</h2>

            <button type="button" onclick="loadEwasteInfo()">
                Load E-Waste Information
            </button>

            <div id="ewasteData"></div>
        </section>
    </div>
</section>


<section id="about">

<h2>About E-Waste</h2>


<div class="slider-container">

<div class="slide active">

<img
src="https://images.unsplash.com/photo-1518770660439-4636190af475?w=1200"
class="slider-img">

</div>


<div class="slide">

<img
src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=1200"
class="slider-img">

</div>


<div class="slide">

<img
src="https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?w=1200"
class="slider-img">

</div>

</div>


<p class="about-text">

Electronic waste includes discarded mobile phones,
computers, televisions, printers, batteries,
laptops and many electronic devices.

Proper recycling helps reduce pollution,
recover valuable materials,
and create a cleaner future.

</p>

</section>


<section id="services">

<h2>Our Services</h2>


<div class="service-container">


<div class="service-card">

<div class="icon">🚛</div>

<h3>Doorstep Collection</h3>

<p>
Schedule a pickup from your home or office
at your preferred time.
</p>

</div>


<div class="service-card">

<div class="icon">♻</div>

<h3>Safe Recycling</h3>

<p>
Collected electronic waste is recycled
using eco-friendly methods.
</p>

</div>


<div class="service-card">

<div class="icon">💾</div>

<h3>Data Destruction</h3>

<p>
Your confidential data is permanently erased
before recycling.
</p>

</div>


<div class="service-card">

<div class="icon">🏭</div>

<h3>Authorized Centers</h3>

<p>
Only certified recycling centers are used
for disposal.
</p>

</div>

</div>


<br>

<h3 style="text-align:center;">
Project Completion
</h3>

<progress value="85" max="100"></progress>

</section>


<section class="why">

<h2>Why Choose Us?</h2>


<div class="why-container">


<div class="why-card">

<h3>🌍 Eco Friendly</h3>

<p>
We help reduce pollution through responsible recycling.
</p>

</div>


<div class="why-card">

<h3>⚡ Fast Pickup</h3>

<p>
Quick doorstep collection across multiple locations.
</p>

</div>


<div class="why-card">

<h3>😊 Trusted Service</h3>

<p>
Thousands of satisfied customers trust our service.
</p>

</div>


<div class="why-card">

<h3>📜 Certified Process</h3>

<p>
Government approved recycling methods are followed.
</p>

</div>

</div>

</section>


<section id="centers">

<h2>Collection Centers</h2>


<table>

<tr>

<th>Center ID</th>

<th>City</th>

<th>Contact</th>

<th>Status</th>

</tr>


<tr>

<td>EC001</td>

<td>Chennai</td>

<td>9876543210</td>

<td>Open</td>

</tr>


<tr>

<td>EC002</td>

<td>Trichy</td>

<td>9876543211</td>

<td>Open</td>

</tr>


<tr>

<td>EC003</td>

<td>Coimbatore</td>

<td>9876543212</td>

<td>Open</td>

</tr>


<tr>

<td>EC004</td>

<td>Madurai</td>

<td>9876543213</td>

<td>Open</td>

</tr>


<tr>

<td>EC005</td>

<td>Salem</td>

<td>9876543214</td>

<td>Open</td>

</tr>

</table>

</section>


<section id="awareness">

<h2>E-Waste Awareness</h2>

<p class="awareness-text">

Electronic waste contains valuable materials such as copper,
aluminium, silver and gold.

Improper disposal can pollute soil, water and air.

Recycling helps recover these materials while protecting our
environment.

</p>


<div class="tips-container">


<div class="tip-box">

<h3>♻ Recycle</h3>

<p>
Always recycle old electronic devices through authorized centers.
</p>

</div>


<div class="tip-box">

<h3>🔋 Battery Safety</h3>

<p>
Never throw batteries into household garbage.
</p>

</div>


<div class="tip-box">

<h3>💻 Donate</h3>

<p>
Donate working laptops and mobiles to people who need them.
</p>

</div>


<div class="tip-box">

<h3>🔒 Erase Data</h3>

<p>
Delete personal information before giving away any device.
</p>

</div>

</div>

</section>


<section class="impact-section">

<h2>Our Environmental Impact</h2>


<div class="impact-container">


<div class="impact-box">

<h1>15+</h1>

<p>Years of Experience</p>

</div>


<div class="impact-box">

<h1>98%</h1>

<p>Customer Satisfaction</p>

</div>


<div class="impact-box">

<h1>50+</h1>

<p>Corporate Partners</p>

</div>


<div class="impact-box">

<h1>100%</h1>

<p>Safe Recycling</p>

</div>

</div>

</section>


<section id="support">

<h2>Customer Support</h2>


<div class="support-box">

<p>
<strong>Email:</strong> support@ewaste.com
</p>

<p>
<strong>Phone:</strong> +91 9876543210
</p>

<p>
<strong>Working Hours:</strong>
Monday - Saturday (9:00 AM - 6:00 PM)
</p>

<p>
Need help with e-waste collection?
Our support team is always ready to assist you.
</p>

</div>

</section>


<section id="map">

<h2>Our Location</h2>

<iframe
src="https://www.google.com/maps?q=Chennai&output=embed"
width="100%"
height="350"
style="border:0;"
loading="lazy">
</iframe>

</section>


<footer>

<div class="footer-content">

<h2>♻ E-Waste Collection Management System</h2>

<p>
Together We Can Build A Cleaner, Greener And Sustainable Future.
</p>

<hr>

<p>
© 2026 E-Waste Collection Management System.
All Rights Reserved.
</p>

</div>

</footer>

<script>
    const contextPath = "${pageContext.request.contextPath}";
</script>

<script src="${pageContext.request.contextPath}/j.js"></script>

</body>

</html>