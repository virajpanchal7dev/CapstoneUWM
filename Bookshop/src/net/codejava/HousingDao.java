package net.codejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HousingDao {

	public List<CommonBean> fetchHousingLocations() 
			throws SQLException, ClassNotFoundException {
		String jdbcURL = "jdbc:mysql://localhost:3306/bookshop?useSSL=false";
		String dbUser = "root";
		String dbPassword = "password";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		String sql = "SELECT count(*) as hcnt FROM bookshop.housinglocations";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet result1 = statement.executeQuery();
		result1.next();
		
		int hcnt = result1.getInt("hcnt");
		
		String sql1 = "SELECT location_name,latitude,longitude FROM bookshop.housinglocations";
		
		PreparedStatement statement1 = connection.prepareStatement(sql1);
		
		ResultSet result = statement1.executeQuery();
		
		List<CommonBean> allHousingLocations = new ArrayList<CommonBean>();
		
		CommonBean list = new CommonBean();
		
		for(int i = 0; i < hcnt; i++) {
			list = new CommonBean();
			
			if (result.next()) {
				
				list.setLocation_name(result.getString("location_name"));
				list.setLatitude(result.getFloat("latitude"));
				list.setLongitude(result.getFloat("longitude"));
				
			}
			list.setCount(hcnt);
			allHousingLocations.add(list);
			
		}
		
		connection.close();
		
		return allHousingLocations;
	}
}
