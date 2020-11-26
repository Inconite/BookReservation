<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Reservation Service</title>
<link href="/BookReservation/header.css" type="text/css" rel="stylesheet"/>
<link href="/BookReservation/body.css" type="text/css" rel="stylesheet"/>
<link href="/BookReservation/footer.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class = "body-inner">
<header>
  <div class = "logo">
    <p>BookReservation</p>
  </div>
  <nav>
  <ul>
    <li><a href="/BookReservation">Home</a></li>
    <li><a href="/BookReservation/welcome.jsp">Dashboard</a></li>
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
String x = request.getParameter("bookID");
out.println("userID: " + userID + "Book Id: " + x);
%>
  
  
  
  <!--  Displays all books
	<h3 style = "margin-top: 60px;">Books Available:</h3>
	<table>
	<tbody>
	<tr>
	<th>Book ID</th>
	<th>Book Name</th>
	</tr>
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from books");
					
		while(rs.next()){
		%>
		<tr>
		    <td><%=rs.getString(1) %></td>
		    <td><%=rs.getString(2) %></td>
		</tr>
		<%	
		}
		rs.close();
	   	st.close();
		con.close();
	}
	catch(Exception e){
	    e.printStackTrace();
	}
}
%>




</tbody>
</table>
-->
  
  
</div>
</div>

<footer>
  <div class = "logo">
    <p>©2020 Book Reservation Service</p>
  </div>
  <nav>
  <ul>
    <li><a href="#">About Us</a></li>
  </ul>
  </nav>
</footer>

</div>
</body>
</html>