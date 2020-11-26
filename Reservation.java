package com.bookreservation;

import java.sql.*;

public class Reservation {

	public static boolean reserveBook(String addData) throws ClassNotFoundException, SQLException {
		int bookId = Integer.parseInt(addData.split(" ")[0]);
		String userName = addData.split(" ")[1];
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement(); 
		int rs = st.executeUpdate("insert into books_reserved (user_name, book_id) values('"+userName+"','"+bookId+"')"); 
		
		if(rs == 1) {
			return true;
		}
		con.close();
		st.close();
		
		return false;
	}

	public static boolean deleteBook(String delData) throws ClassNotFoundException, SQLException {
		int bookId = Integer.parseInt(delData.split(" ")[0]);
		String userName = delData.split(" ")[1];
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement(); 
		int rs = st.executeUpdate("delete from books_reserved where user_name = '"+userName+"' AND book_id = '"+bookId+"' "); 
		
		if(rs == 1) {
			return true;
		}
		con.close();
		st.close();
		
		return false;
	}
}
