<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reserve Books - BookReservationService</title>
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
<h3>Search for Books:</h3>
<form action="/BookReservation/books.jsp" method = "POST">
<input style = "width:36%; float:left; margin: auto;" type = "text" name="search" placeholder="Enter book name or hit search to see all books" >
<input style = "font-size:23px ; width: auto; float:left; margin: auto 10px; padding: 4.7px 20px;" type="submit" value="Search">
</form>  
<div class = "display-search" style = "margin-top: 110px;">
<h3>Search Results:</h3>
<table>
<tbody>
<tr>
<th>Book ID</th>
<th>Book Name</th>
<th>Reserve</th>
</tr>



  
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userID = (String)session.getAttribute("user");
String pwd = (String)session.getAttribute("psw");
String searchString = request.getParameter("search");

/*if(userID == null || pwd == null){
	//response.sendRedirect("/BookReservation");
}
else{*/

	int c = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from books where book_name like '%"+searchString+"%'");
	
			while(rs.next()){
				c++;
			%>
			<tr>
			    <td><%=rs.getString(1) %></td>
			    <td><%=rs.getString(2) %></td>
			    <td style = "min-width: 10%;">
			    <form method = "POST" action = "/BookReservation/bookreserv">
			    <!--  <input style = "font-size:15px; margin: auto; padding: 1px;" name = "" type="submit" value="+"> -->
			    <button name="bookID" type="submit" value="<%= rs.getString(1) + " " + userID %>">+</button>
			    </form>
			    </td>
			</tr>    
			<%
			}
			
			if(c==0){
				out.println("<td> '"+searchString+"' was not found!</td><td></td>");
			}
			
		rs.close();
	    st.close();
	    con.close();
	}
	catch(Exception e){
	    e.printStackTrace();
	}
//}
	%>
	
	</tbody>
	</table>
	</div>
	
</div>
</div>
<%@ include file="footer.html" %>
</div>
</body>
</html>