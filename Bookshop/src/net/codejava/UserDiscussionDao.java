package net.codejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDiscussionDao {
	
	public void insertUserPost(UserPosts posts) throws SQLException, 
		ClassNotFoundException {
		
				
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "insert into bookshop.posts(id, category, description) ";
		sql += "values (?,?,?)";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, posts.getId());
		statement.setString(2, posts.getCategory());
		statement.setString(3, posts.getDescription());
		
		statement.executeUpdate();
		
		connection.close();
	
	}
	
	public List<CommonBean> fetchAllUsersPost() 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "select count(*) as pcnt from bookshop.users u, bookshop.user_detail ud, bookshop.posts p";
		sql += " where u.id = ud.id";
		sql += " and u.id = p.id";

		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int pcnt = result1.getInt("pcnt");
		
		String sql1 = "Select u.fullname, p.category, p.description, p.pid from bookshop.users u, bookshop.user_detail ud, bookshop.posts p";
		sql1 += " where u.id = ud.id";
		sql1 += " and u.id = p.id";

		PreparedStatement statement1 = connection.prepareStatement(sql1);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allusers = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < pcnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setFullname(result.getString("fullname"));
				list.setCategory(result.getString("category"));
				list.setDescription(result.getString("description"));
				list.setPid(result.getInt("pid"));
			}
			list.setCount(pcnt);
			allusers.add(list);
			
		}
		
		connection.close();
		
		return allusers;
	}
	
	
	public CommonBean fetchUserPost(int pid) 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		
		
		String sql = "Select u.id, u.fullname, p.category, p.description, p.pid from bookshop.users u, bookshop.user_detail ud, bookshop.posts p";
		sql += " where u.id = ud.id";
		sql += " and u.id = p.id";
		sql += " and p.pid = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, pid);
		
		ResultSet result = statement.executeQuery();
		
		CommonBean bean = new CommonBean();
			
		if (result.next()) {
			
			bean.setId(result.getInt("id"));
			bean.setFullname(result.getString("fullname"));
			bean.setCategory(result.getString("category"));
			bean.setDescription(result.getString("description"));
			
		}
		
		connection.close();
		
		return bean;
	}
	
	public void insertPostReply(UserPostReplyBean replybean) throws SQLException, 
		ClassNotFoundException {
		
				
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "insert into bookshop.postreply(pid, id, reply) ";
		sql += "values (?,?,?)";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1,replybean.getPid());
		statement.setInt(2, replybean.getId());
		statement.setString(3, replybean.getReply());
		
		statement.executeUpdate();
		
		connection.close();
	
	}
	
	public List<CommonBean> fetchPostsReply(int pid) 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "select count(*) as rcnt from bookshop.users u, bookshop.user_detail ud, bookshop.posts p, bookshop.postreply r";
		sql += " where u.id = ud.id";
		sql += " and r.id = u.id";
		sql += " and p.pid = r.pid";
		sql += " and p.pid = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, pid);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int rcnt = result1.getInt("rcnt");
		
		String sql1 = "select u.fullname, r.reply from bookshop.users u, bookshop.user_detail ud, bookshop.posts p, bookshop.postreply r";
		sql1 += " where u.id = ud.id";
		sql1 += " and r.id = u.id";
		sql1 += " and p.pid = r.pid";
		sql1 += " and p.pid = ?";

		PreparedStatement statement1 = connection.prepareStatement(sql1);
		statement1.setInt(1, pid);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allusers = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < rcnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setFullname(result.getString("fullname"));
				list.setReply(result.getString("reply"));
				
			}
			list.setCount(rcnt);
			allusers.add(list);
			
		}
		
		connection.close();
		
		return allusers;
	}

}
