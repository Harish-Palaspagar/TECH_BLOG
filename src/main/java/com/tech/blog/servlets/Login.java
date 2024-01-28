package com.tech.blog.servlets;
import jakarta.servlet.ServletException;
import com.tech.blog.entities.Message;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		if(u==null)
		{
		//	pw.println("Invalid Details... Try Again");
			
			Message msg = new Message("Invalid Details ! Please try again..", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
			
		}
		else
		{
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			
		}
	}

}