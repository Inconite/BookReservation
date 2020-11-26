package com.bookreservation;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String uname = request.getParameter("uid");
		String psw = request.getParameter("psw");
//		PrintWriter out = response.getWriter();
		
		boolean isValid = false;
		try {
			isValid = Authentication.verifyUser(uname, psw);
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(isValid) {
			HttpSession session = request.getSession();
			session.setAttribute("user", uname);
			session.setAttribute("psw", psw);
			response.sendRedirect("welcome.jsp");
		}
		else { 
			HttpSession session = request.getSession();
			session.setAttribute("msg", "invalidDetails");
			response.sendRedirect("error.jsp");
		}
		
	}
}
