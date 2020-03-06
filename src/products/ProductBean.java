package products;

import java.sql.*;

//import products.ProductVO;

public class ProductBean {

	private static ProductBean instance = new ProductBean();
	
	private ProductBean() {}  
	public static ProductBean getInstance() {  
	
		return instance;
	}
	
	private Connection getConnection() throws Exception { 
		String jdbcUrl ="jdbc:mysql://localhost:3306/users_info?useSSL=false";
		String dbUser = "root";
		String dbPass = "park1001!";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}
	
	public int ProductData(String userName, String userPass) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String dbpasswd="";
		int x = -1;
		
		try {
			conn = getConnection();
			String query = "SELECT * FROM hut_product";
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd=rs.getString("userPass");
				if(dbpasswd.equals(userPass))
					x=1;//인증 성공
				else
					x=0;
			}else 
				x=-1;
			
			
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return(x);  
}
	//HUT_PRODUCT
}
