package products;

import java.sql.*;

import advisor.*;

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
	
	//회원 정보 조회	
	public ProductVO userEdit(String id) throws Exception {
		
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ProductVO productvo = null;
		
		try {
			conn = getConnection();
			String query = "select * from hut_product where product = ?";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				productvo = new ProductVO();
				productvo.setProduct_name(rs.getString("product_name"));
				productvo.setProduct_price(rs.getString("product_price"));
				productvo.setProduct_stock(rs.getInt("product_stock"));
			}
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}  
		return productvo;
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
