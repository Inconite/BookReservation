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
  </ul>
  </nav>
</header>
<div class = "body-container">
<div class="login">




<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%

String uName = request.getParameter("uid"); 
String fName = request.getParameter("fname"); 
String email = request.getParameter("email"); 
String psw = request.getParameter("psw");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
Statement st = con.createStatement(); 
int rs = st.executeUpdate("insert into users (user_name, password, full_name, email) values ('"+uName+"', '"+psw+"', '"+fName+"', '"+email+"') ;"); 

if(rs == 1) {
	out.println("Registration was successful. Now you can login.");
}else{
	out.println("Error occured! Please try again.");
}

con.close();
st.close();
%>




</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>