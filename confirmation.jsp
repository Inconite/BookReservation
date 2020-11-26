<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation - BookReservationService</title>
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
    <li><a href="/BookReservation/books.jsp">Reserve Books</a></li>
    <li><a href="/BookReservation/goodbye.jsp">Logout</a></li>
  </ul>
  </nav>
</header>
<div class = "body-container">
<div style = "text-align:center;" class="login">




<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");
if(userID == null || pwd == null) response.sendRedirect("/BookReservation");
else{
	boolean isValid = (boolean)request.getAttribute("message");
	if(isValid){
		out.println("Book Reserved Successfully!");
	}
	else{
		out.println("Unable to reserve the book");
	}
}

%>




<div class = "button-container">
<br><br>
 <button class = "button" type="button" name="back" onclick="history.back()"> Go Back</button> 
</div>
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>