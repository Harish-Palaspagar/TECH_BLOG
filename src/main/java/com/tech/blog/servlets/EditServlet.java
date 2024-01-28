package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String email = request.getParameter("user_email");
		String name = request.getParameter("user_name");
		
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		
		//Get Session Data
		
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		
		user.setEmail(email);
		user.setName(name);
		user.setAbout(about);
		user.setPassword(password);
		
		// Update in Database
		
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		
		boolean ans = userdao.updateUser(user);
		if(ans)
		{
			out.println("UPDATED");
		}
		else
		{
			out.println("UPDATE FAILED");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
