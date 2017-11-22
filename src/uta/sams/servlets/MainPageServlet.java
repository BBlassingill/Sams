package uta.sams.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uta.sams.beans.UserBean;
import uta.sams.dbconnection.UserDBManager;


/**
 * Servlet implementation class LoginServlet
 */

public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		
		request.getRequestDispatcher("/jsp/user/login.jsp").forward(request,response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		//Process login
		if (request.getParameter("login") != null) {
			String username = request.getParameter("j_username");
			String password = request.getParameter("j_password");

			try{
				UserDBManager dbm = new UserDBManager();
				UserBean user = dbm.getUser(username);
				
				if (user != null && user.isCorrectPassword(password)) {
					session.setAttribute("user", user);
					response.sendRedirect("welcome");
				}
				
				else {
					response.sendRedirect("error");
				}
			}
				
			catch(Exception e){
				System.out.println(e);
				response.sendRedirect("error");
				
			}
				
		}
		
		//Process register
		else {
			response.sendRedirect("register");
		}
		
	}
}
