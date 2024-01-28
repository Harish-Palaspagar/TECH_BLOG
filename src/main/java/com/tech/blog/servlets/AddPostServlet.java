package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int cid = Integer.parseInt(request.getParameter("cid"));
		int postNumber =  Integer.parseInt(request.getParameter("postNumber"));
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String postCode =  request.getParameter("postCode");
	   //  out.println(postTitle);
	     
	     // Getting Current UserID
	     HttpSession session = request.getSession();
	     User user = (User) session.getAttribute("currentUser");
	     
	     user.getId();
	     Posts p = new Posts(postNumber,postTitle,postContent, postCode, cid, user.getId());
	     
	     PostDao dao = new PostDao(ConnectionProvider.getConnection());
	     if(dao.savePost(p))
	     {
	    	 out.println("done");
	     }
	     else
	     {
	    	 out.println("error");
	     }
	     
	     
		
		
		
		
		
	}

}
