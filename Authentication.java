package com.bookreservation;

import java.sql.*;


public class Authentication {
	public static boolean verifyUser(String uname, String psw) throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookreserv","root","root"); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where user_name = '"+uname+"'");
		
		if(rs.next()) {
			if(rs.getString(3).equals(psw)) return true;
		}
		con.close();
		st.close();
		rs.close();
		return false;
		
	}
}
