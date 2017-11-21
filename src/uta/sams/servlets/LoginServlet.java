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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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
		String username = request.getParameter("j_username");
		String password = request.getParameter("j_password");
//		GetSet sets = new GetSet();
//		sets.setEmailAddress(emailAddress);
//		sets.setPassword(password);
		try{
			//call db manager and authenticate user, return value will be 0 or
			//an integer indicating a role
			UserDBManager dbm = new UserDBManager();
			UserBean user = dbm.getUser(username);
			
			if (user != null && user.isCorrectPassword(password)) {
				//Check password
				session.setAttribute("user", user);
				response.sendRedirect("welcome");
			}
			
			else {
				response.sendRedirect("jsp/user/error.jsp");
			}
//			if(user != null){
//				session.setAttribute("user", user);
//				response.sendRedirect("index");
//			}
//			else{
//				//redirect back to login if authentication fails
//				//need to add a "invalid username or password" response
//				response.sendRedirect("login");
//			}
		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("jsp/user/error.jsp");
		}
	}
}
