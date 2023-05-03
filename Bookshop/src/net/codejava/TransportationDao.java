package net.codejava;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransportationDao {
	
	public int checkIfRequested(int id) throws SQLException, 
		ClassNotFoundException {
		
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT count(*) AS cnt FROM bookshop.transportation t";
		sql += " where t.id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int cnt = result1.getInt("cnt");
		
		connection.close();
		
		return cnt;
	}
	
	
	public int checkAfterRequested(int id) throws SQLException, 
	ClassNotFoundException {
	
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT request AS request FROM bookshop.transportation t";
		sql += " where t.id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		String res = result1.getString("request");
		
		int request = 0;
		if(!res.equals(null)) 
			request = Integer.parseInt(res);
		else
			request = 0;
		
		connection.close();
		
		return request;
	}
	
	public void insertTransportationRequest(UserTransportationReq req) throws SQLException, 
		ClassNotFoundException {
		
				
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "insert into bookshop.transportation(id,flightdate,arrivaldate,request) ";
		sql += "values (?,?,?,?)";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, req.getId());
		statement.setString(2, req.getFlightdate());
		statement.setString(3, req.getArrivaldate());
		statement.setInt(4, req.getRequest());
		
		statement.executeUpdate();
		
		connection.close();
		
	}
	
	
	public List<CommonBean> fetchAllTransportationRequest() 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT count(*) as tcnt FROM bookshop.users u, bookshop.user_detail ud, bookshop.transportation t";
		sql += " where u.id = ud.id";
		sql += " and u.id = t.id";
		sql += " and u.isadmin = 2";
		sql += " and t.request = 0";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int tcnt = result1.getInt("tcnt");
		
		String sql1 = "SELECT * FROM bookshop.users u, bookshop.user_detail ud, bookshop.transportation t";
		sql1 += " where u.id = ud.id";
		sql1 += " and u.id = t.id";
		sql1 += " and u.isadmin = 2";
		sql1 += " and t.request = 0";
		PreparedStatement statement1 = connection.prepareStatement(sql1);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allusers = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < tcnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setFullname(result.getString("fullname"));
				list.setEmail(result.getString("email"));
				list.setStd_id(result.getString("std_id"));
				list.setRequest(result.getInt("request"));
				list.setFlightdate(result.getString("flightdate"));
				list.setArrivaldate(result.getString("arrivaldate"));
				list.setId(result.getInt("id"));
				list.setTid(result.getInt("tid"));
			}
			list.setCount(tcnt);
			allusers.add(list);
			
		}
		
		connection.close();
		
		return allusers;
	}
	
	public void uploadTicketToPendingRequests(int tid, InputStream fileContent) throws SQLException, 
		ClassNotFoundException {
	
			
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		//String sql = "insert into bookshop.transportation(id,flightdate,arrivaldate,request) ";
		String sql = "update bookshop.transportation set request = 1, ticket = ? where tid = ?";
		
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setBinaryStream(1, fileContent);
		statement.setInt(2, tid);
		
		statement.executeUpdate();
		
		connection.close();
		
	}
	
	public List<CommonBean> fetchTicket(int id) 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT count(*) as tcnt FROM bookshop.users u, bookshop.user_detail ud, bookshop.transportation t";
		sql += " where u.id = ud.id";
		sql += " and u.id = t.id";
		sql += " and u.isadmin = 2";
		sql += " and t.request = 1";
		sql += " and u.id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int tcnt = result1.getInt("tcnt");
		
		String sql1 = "SELECT * FROM bookshop.users u, bookshop.user_detail ud, bookshop.transportation t";
		sql1 += " where u.id = ud.id";
		sql1 += " and u.id = t.id";
		sql1 += " and u.isadmin = 2";
		sql1 += " and t.request = 1";
		sql1 += " and u.id = ?";
		PreparedStatement statement1 = connection.prepareStatement(sql1);
		statement1.setInt(1, id);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allusers = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < tcnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setFullname(result.getString("fullname"));
				list.setEmail(result.getString("email"));
				list.setStd_id(result.getString("std_id"));
				list.setRequest(result.getInt("request"));
				list.setFlightdate(result.getString("flightdate"));
				list.setArrivaldate(result.getString("arrivaldate"));
				list.setId(result.getInt("id"));
				list.setTid(result.getInt("tid"));
				list.setTicket(result.getBlob("ticket"));
			}
			list.setCount(tcnt);
			allusers.add(list);
			
		}
		
		connection.close();
		
		return allusers;
	}
}
