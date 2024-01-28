package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikesDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		PrintWriter out = response.getWriter();
		//out.println("nyauu :"+uid);
		//out.println(pid);
		LikesDao ld = new LikesDao(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			boolean f=ld.insertLike(pid, pid, uid);
			out.println(f);
		}
		else
		{
			out.println(false);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
		
		
		
		
		
	}

}
