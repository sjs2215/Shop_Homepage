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
		String dbUser = "root"; //root
		String dbPass = "park1001!"; //park1001!
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}
	
	//주문하기 화면(shop.jsp)에서 상품명, 가격, 재고 조회 기능
	public ProductVO productEdit(int id) throws Exception {
		
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ProductVO productvo = null;
		
		try {
			conn = getConnection();
			String query = "select * from hut_product where product_id = ?";

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,  id);
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
	
}
