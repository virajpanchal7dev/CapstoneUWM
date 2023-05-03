package net.codejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class UserDAO {

	public User checkLogin(String email, String password) throws SQLException, 
			ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		String sql = "SELECT * FROM users WHERE email = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet result = statement.executeQuery();

		User user = null;

		if (result.next()) {
			user = new User();
			user.setFullname(result.getString("fullname"));
			user.setEmail(email);
			user.setId(result.getInt("id"));
			user.setIsadmin(result.getInt("isadmin"));
		}

		connection.close();

		return user;
	}
	
	public UserDetail fetchUserDetail(int id) 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT * FROM bookshop.users u, bookshop.user_detail ud";
		sql += " where u.id = ud.id";
		sql += " and u.id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		
		
		ResultSet result = statement.executeQuery();
		
		UserDetail userDetail = null;
		
		if (result.next()) {
			userDetail = new UserDetail();
			userDetail.setStd_id(result.getString("std_id"));
			userDetail.setEd_lvl(result.getString("ed_lvl"));
			userDetail.setCampus(result.getString("campus"));
			userDetail.setVisa_type(result.getString("visa_type"));
			userDetail.setSevis_id(result.getString("sevis_id"));
			userDetail.setGender(result.getString("gender"));
			userDetail.setCountry(result.getString("country"));
			userDetail.setMajor(result.getString("major"));
		}
		
		connection.close();
		
		return userDetail;
	}
	
	public List<CommonBean> fetchAllUserDetailAdmin() 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT count(*) AS recordCount FROM bookshop.users u, bookshop.user_detail ud";
		sql += " where u.id = ud.id";
		sql += " and u.id <> 1";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int cnt = result1.getInt("recordCount");
		
		String sql1 = "SELECT * FROM bookshop.users u, bookshop.user_detail ud";
		sql1 += " where u.id = ud.id";
		sql1 += " and u.id <> 1";
		PreparedStatement statement1 = connection.prepareStatement(sql1);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allusers = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < cnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setFullname(result.getString("fullname"));
				list.setEmail(result.getString("email"));
				list.setStd_id(result.getString("std_id"));
				list.setEd_lvl(result.getString("ed_lvl"));
				list.setCampus(result.getString("campus"));
				list.setVisa_type(result.getString("visa_type"));
				list.setSevis_id(result.getString("sevis_id"));
				list.setGender(result.getString("gender"));
				list.setCountry(result.getString("country"));
				list.setMajor(result.getString("major"));
			}
			list.setCount(cnt);
			allusers.add(list);
			
		}
		
		
		
		connection.close();
		
		return allusers;
	}
}
