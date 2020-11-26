<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page - BookReservationService</title>
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
    <li><a href="/BookReservation/register.jsp">Sign Up</a></li>
  </ul>
  </nav>
</header>
<div class = "body-container">
<div style="text-align:center;" class="login">
  
  
  
  
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String errorMessage = (String)session.getAttribute("msg");
if(errorMessage == null ){
	response.sendRedirect("/BookReservation");
}
else if(errorMessage.equals("invalidDetails")) {
	out.println("Invalid Login Details...."); 
	out.println("Please try again.");
}
%>



  
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>