package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
	
		PrintWriter pw = response.getWriter();
		
        
        
        // Fetching Data 
        
    	String check = request.getParameter("check");
    	if(check==null)
    	{
    		pw.println("Plz Agree Terms and Conditions");
    	}
    	else
    	{
    		int id = Integer.parseInt(request.getParameter("user_id"));
    		String name = request.getParameter("user_name");
    		String email = request.getParameter("user_email");
    		String password = request.getParameter("user_password");
    		String gender = request.getParameter("gender");
    		String about = request.getParameter("about");
    		
    		//Creating User Object 
    		
    		User user = new User(id, name,password, email, gender, about);
    		
    		
    		//Creating UserDao Object
    		
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		 if (dao.saveUser(user)) {
                 pw.println("done");
             } else {
                 pw.println("Error");
             }
    	}
    	
    	

	
		
		
		
	}

}
