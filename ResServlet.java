package com.bookreservation;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String addData = (String)request.getParameter("bookID");
		String delData = (String)request.getParameter("delData");
		
		//ServletRequest session = null;
		//String userName = (String)session.getAttribute("user");
		
		if(addData != null) {
			if(addData.split(" ")[1].equals("null")) {
				response.sendRedirect("index.jsp");
			}
			else {
				boolean isAdded = false;
				try {
					isAdded = Reservation.reserveBook(addData);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("message", isAdded);
				//System.out.println(isAdded);
				RequestDispatcher rd =  request.getRequestDispatcher("confirmation.jsp");
				rd.forward(request, response);
			}
		}
		
		else if(delData != null) {
			boolean isDeleted = false;
			try {
				isDeleted = Reservation.deleteBook(delData);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("message", isDeleted);
			//System.out.println(isDeleted);
			RequestDispatcher rd1 =  request.getRequestDispatcher("welcome.jsp");
			rd1.forward(request, response);
		}
		else {
			response.sendRedirect("index.jsp");
		}
		
//		if(isValid) {
//			String message = "True";
//			request.setAttribute("message", message);
//			System.out.println("Yes working");
//			RequestDispatcher rd =  request.getRequestDispatcher("books.jsp");
//			rd.forward(request, response);
//			//response.sendRedirect("books.jsp");
//		}
//		else {
//			String message = "False";
//			request.setAttribute("message", message);
//			System.out.println("Not working");
//			RequestDispatcher rd =  request.getRequestDispatcher("books.jsp");
//			rd.forward(request, response);
//		}
		
	}
}

