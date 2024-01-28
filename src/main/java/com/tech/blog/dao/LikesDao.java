package com.tech.blog.dao;
import java.sql.*;

public class LikesDao {
	Connection con;
	
	public LikesDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	
	public boolean insertLike(int lid, int pid , int uid)
	{
		boolean f = false;
		try {
			String query="INSERT INTO LIKES(LID,PID,USERID)VALUES(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,lid);
			ps.setInt(2,pid);
			ps.setInt(3,uid);
			ps.executeUpdate();
			f = true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLikeOnPost(int pid)
	{
		int count = 0;
		String q = "SELECT COUNT(*) FROM LIKES WHERE PID = ?";
		try {
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				count=set.getInt("COUNT(*)");
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 
		
		return count;
		
	}
	
	public boolean isLikedByUser(int pid, int uid)
	{
		boolean f = false;
		try {
			PreparedStatement pst = this.con.prepareStatement("SELECT * FROM LIKES WHERE PID = ? AND USERID = ?");
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			ResultSet set = pst.executeQuery();
			if(set.next())
			{
				f= true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return f;
		
		
	}
	
	
	public boolean deleteLike(int pid, int uid) {
		 boolean f = false;
		try {
			
			PreparedStatement p = this.con.prepareStatement("DELETE FROM LIKES WHERE PID = ? AND USERID = ?  ");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate(); 
			f= true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
		
		
	}
	
	
	

}
