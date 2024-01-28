package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveUser(User user)
	{
		boolean f = false;
		try {
			
			String query ="INSERT INTO USER_REGISTRATION(ID,NAME, EMAIL,PASSWORD,GENDER,ABOUT)VALUES(?,?,?,?,?,?)";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setInt(1, user.getId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getGender());
			ps.setString(6, user.getAbout());
			ps.executeUpdate();
			f = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
	}
	//get user by user name and password
	
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user = null;
		try {
			String query = "SELECT * FROM USER_REGISTRATION WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				user= new User();
				String name = set.getString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		return user;
		
	}
	
	public boolean updateUser( User user)
	{
		boolean f = false;
		
		try {
			String query ="UPDATE USER_REGISTRATION SET NAME=?, EMAIL=?,PASSWORD=?, GENDER=?, ABOUT=? WHERE ID=? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.setInt(6,user.getId());
			
			ps.executeUpdate();
			f= true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public User getUserByUserId(int userId)
	{
		User user = null;
		String q = "SELECT * FROM USER_REGISTRATION WHERE ID = ?"; 
		try {
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, userId);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				user= new User();
				String name = set.getString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
		
	}
	
	
	
	
	
		
}