package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tech.blog.entities.Message;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Redirect to the login page for GET requests
	    response.sendRedirect("login.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Logout Servlet Invoked");
		HttpSession s = request.getSession();
		s.removeAttribute("currentUser");
		Message m = new Message("Logut Successfull","Success","alert-success");
		s.setAttribute("msg", m);
		
		response.sendRedirect("login.jsp");
		
		
		
	}

}
