package uta.sams.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uta.sams.beans.UserBean;
import uta.sams.dbconnection.UserDBManager;

public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();		
		request.getRequestDispatcher("/jsp/user/getUser.jsp").forward(request,response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		String username = request.getParameter("username");

		try {
			UserDBManager dbm = new UserDBManager();
			UserBean user = dbm.getUser(username);
			
			if (user != null) {
				session.setAttribute("user", user);
				response.sendRedirect("userDetails");
			}
			else {
				throw new Exception("The user was not found.");
			}
			
		}
		
		catch(Exception e) {
			response.sendRedirect("userError");
		}
	}
}
