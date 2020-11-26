<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Reservation Service</title>
<%@ include file="ExternalCSS.html" %>
</head>
<body>
<div class = "body-inner">
<header>
<%@ include file="logo.html" %>
  <nav>
  <ul>
    <li><a href="/BookReservation">Home</a></li>
    <li><a href="/BookReservation/welcome.jsp">Dashboard</a></li>
    <li><a href="/BookReservation/login.jsp">Login</a></li>
    <li><a href="/BookReservation/register.jsp">Sign Up</a></li>
  </ul>
  </nav>
</header>

<div class = "body-container">
<div class = "home">
<div class = "home-content">
<h1>Welcome to Book Reservation Service!</h1>
<p style = "margin-top:30px">Sign Up and start reserving your favorite books.</p>
<form action="/BookReservation/register.jsp" method="POST">
    <input style= "width: auto;" type="submit" value="Sign Up">
</form>
</div>
</div>

 <!-- <div class="welcome">

 <form action="/BookReservation/verifyuser" method="POST">
 	<h1 style="margin-bottom:35px; margin-top:0px; text-align:center;">Login</h1>
  	<label for="uid">User Id</label>
    <input type="text" id="uid" name="uid" placeholder="User Id.." required>
    <label for="pass">Password</label>
    <input type="password" id="psw" name="psw" placeholder="Password.." required>
  	<div style="text-align:center">  
    <input type="submit" value="Login">
    </div>
  </form>
 
</div>   -->
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>