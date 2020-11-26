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
<div class="login">




<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");

if(userID != null || pwd != null) response.sendRedirect("welcome.jsp");

%>




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
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>