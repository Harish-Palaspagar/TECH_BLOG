package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;


public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		
		this.con =  con;
	}
	
	public ArrayList <Category> getAllCategories()
	{
		ArrayList<Category> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM CATEGORIES";
			Statement st = con.createStatement();
			ResultSet set = st.executeQuery(query);
			while(set.next())
			{
				int cid = set.getInt("CID");
				String name = set.getString("NAME");
				String description = set.getString("DESCRIPTION");
				System.out.println(cid);
				Category c = new Category(cid, name, description);
				list.add(c);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public boolean savePost(Posts p)
	{
		
		boolean f = false;
		try {
			String query = "INSERT INTO POSTS(PID,PTITLE, PCONTENT,PCODE,CATID,USERID)VALUES(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, p.getPid());
			ps.setString(2,p.getPtitle());
			ps.setString(3, p.getPcontent());
			ps.setString(4, p.getPcode());
			ps.setInt(5, p.getCatid());
			ps.setInt(6, p.getUserId());
			ps.executeUpdate();
			f= true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	//Get All the Posts
		public List<Posts>getAllPosts()
	  {
			//Fetch all the Posts
			List<Posts> list = new  ArrayList<>();
			try {
				PreparedStatement ps = con.prepareStatement("SELECT * FROM POSTS ORDER BY PID DESC");
				ResultSet set = ps.executeQuery();
				while(set.next())
				{
					int pid = set.getInt("PID");
					String ptitle = set.getString("PTITLE");
					String pcontent = set.getString("PCONTENT");
					String pcode = set.getString("PCODE");
					int catid = set.getInt("CATID");
					int userid = set.getInt("USERID");	
					Posts post = new Posts(pid, ptitle,pcontent,pcode,catid,userid);
					list.add(post);
					
					
				}
			    } 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				return list;
		     }
		
		
		
		
		public List<Posts>getPostByCatId(int catId)
		{
			//Fetch all the Posts By ID
			List<Posts> list = new  ArrayList<>();
			try {
				PreparedStatement ps = con.prepareStatement("SELECT * FROM POSTS WHERE CATID = ?");
				ps.setInt(1, catId);
				ResultSet set = ps.executeQuery();
				while(set.next())
				{
					int pid = set.getInt("PID");
					String ptitle = set.getString("PTITLE");
					String pcontent = set.getString("PCONTENT");
					String pcode = set.getString("PCODE");
					int userid = set.getInt("USERID");	
					Posts post = new Posts(pid, ptitle,pcontent,pcode,catId,userid);
					list.add(post);	
				}
			    } 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			
			return list;
		}
		
		
		
		
		
	public Posts getPostByPostId(int postId)
	{
		Posts post = null;
		
		String query = "SELECT * FROM POSTS WHERE PID = ?";
		
		PreparedStatement ps;
		try {
			ps = this.con.prepareStatement(query);
			ps.setInt(1, postId);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				int pid = set.getInt("PID");
				String ptitle = set.getString("PTITLE");
				String pcontent = set.getString("PCONTENT");
				String pcode = set.getString("PCODE");
				int catid = set.getInt("CATID");
				int userid = set.getInt("USERID");	
				 post = new Posts(pid, ptitle,pcontent,pcode,catid,userid);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return post;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}