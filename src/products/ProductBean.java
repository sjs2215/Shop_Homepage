package products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import products.ProductVO;

public class ProductBean {

	private static ProductBean instance = new ProductBean();
	
	private ProductBean() {}  
	public static ProductBean getInstance() {  
	
		return instance;
	}
	
	private Connection getConnection() throws Exception { 
		String jdbcUrl ="jdbc:mysql://localhost:3306/users_info?useSSL=false";
		String dbUser = "shop";
		String dbPass = "shop1001!";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}
	
	
}
