<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Good Bye - BookReservationService</title>
<%@ include file="ExternalCSS.html" %>
</head>
<body>
<div class = "body-inner">
<header>
<%@ include file="logo.html" %>
  <nav>
  <ul>
    <li><a href="/BookReservation">Home</a></li>
    <li><a href="/BookReservation/login.jsp">Login</a></li>
  </ul>
  </nav>
</header>
<div class = "body-container">
<div style = "text-align:center;" class="welcome">



<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");
if(userID == null || pwd == null) response.sendRedirect("/BookReservation");
else{
	session.invalidate();
	out.println("You have been logged out successfully!");
}
%>


  
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>