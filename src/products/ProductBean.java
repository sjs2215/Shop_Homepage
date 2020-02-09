package products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	//product_id를 파라메터로 받아와서 해당 가격,수량 출력
	public void productInfo(String product_id) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String query = "select product_price, product_stock from hut_product where product_id=?";
			pstmt = conn.prepareStatement(query);			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rs.getString("product_price");
				rs.getString("product_stock");
			}
			
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
	}
}
