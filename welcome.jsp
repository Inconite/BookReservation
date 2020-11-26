<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard - BookReservationService</title>
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
<div class="welcome">
  
  
  
  
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");

if(userID == null || pwd == null){
	response.sendRedirect("/BookReservation");
}
else{
out.println("<center><h2>Welcome  "+ userID+"!</h2></center> ");
out.println("</br>" + "<h3>List of Books Reserved by you: </h3>");

try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select books.id, books.book_name from books join books_reserved as br on books.id = br.book_id where br.user_name = '"+userID+"' ");
				
%>
<table>
<tbody>
<tr>
<th>Book ID</th>
<th>Book Name</th>
<th>Delete</th>
</tr>

<%
while(rs.next()){
%>
<tr>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td style = "min-width: 8%;">
	<form method = "POST" action = "/BookReservation/bookreserv">
	<button style= "color:red;" name="delData" type="submit" value="<%= rs.getString(1) + " " + userID %>">X</button>
	</form>
	</td>
</tr>
<%
}
%>
</tbody>
</table>
<%
    rs.close();
    st.close();
    con.close();
}
catch(Exception e){
    e.printStackTrace();
}
}
%>



<br>
<br>
<h3>Search for Books:</h3>
<form style="margin-bottom: 90px;" action="/BookReservation/books.jsp" method = "POST">
<input style = "width:36%; float:left; margin: auto;" type = "text" name="search" placeholder="Enter book name or hit search to see all books" >
<input style = "font-size:23px ;width: auto; float:left; margin: auto 10px; padding: 4.7px 20px;" type="submit" value="Search">
</form>  
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>