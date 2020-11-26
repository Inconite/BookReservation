package com.bookreservation;

import java.sql.*;

public class JDBCConnect {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		String uname = "Zator";
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement(); 
		ResultSet rs = st.executeQuery("select * from users where username = '"+uname+"'"); 
		if(rs.next()) {
			System.out.println(rs.getString(3).equals("1234"));
		}
		
		
		con.close();
	}

}