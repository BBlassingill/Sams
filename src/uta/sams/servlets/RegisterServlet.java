package uta.sams.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uta.sams.beans.UserBean;
import uta.sams.dbconnection.UserDBManager;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		request.getRequestDispatcher("jsp/user/register.jsp").forward(request,response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			UserDBManager dbm = new UserDBManager();
			
			UserBean user = new UserBean();
			user.setUsername(username);
			user.setPassword(password);
			
			if (dbm.registerUser(user)) {
				response.sendRedirect("login");
			}
			
			else {
				response.sendRedirect("error"); //TODO: May need to create a separate error page
			}
		}
		
		catch(Exception e) {
			System.out.println(e);
			response.sendRedirect("error");
		}

		
	}
}
