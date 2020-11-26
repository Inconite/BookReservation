<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - BookReservationService</title>
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
<div class="login" style = "max-width:400px;">




<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");

if(userID != null || pwd != null) response.sendRedirect("welcome.jsp");

%>

<form action="/BookReservation/regnext.jsp">
	<h1 style="margin-bottom:35px; margin-top:0px; text-align:center;">Register Account</h1>  
  	<label for="uid">Username</label>
    <input type="text" required pattern="[0-9 a-z A-Z]{3,10}"title ="Login Id must be atleast 3 characters long" id="uid" name="uid" placeholder="Username.." />
  
    <label for="fname">Full Name</label>
    <input type="text" required pattern="[a-z A-Z]{2,20}"title ="Characters a-z,A-Z are allowed" id="fname" name="fname" placeholder="Full Name.."/>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Your email.." required />
    
    <label for="pass">Password</label>
    <input type="password" required pattern="[a-z A-Z 0-9]{3,20}"title ="Atleast 5 characters required"  id="pass" name="psw" placeholder="Password.."/>
	<div style="text-align:center">  
    <input type="submit" value="Register">
    </div>
  </form>
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>