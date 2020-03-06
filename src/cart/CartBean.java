package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cart.CartVO;

public class CartBean {

	private static CartBean instance = new CartBean();
	
	private CartBean() {}  
	public static CartBean getInstance() {  
	
		return instance;
	}
	
	private Connection getConnection() throws Exception { 
		String jdbcUrl ="jdbc:mysql://localhost:3306/users_info?useSSL=false";
		String dbUser = "shop"; //root
		String dbPass = "shop1001!"; //park1001!
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}
	
	//장바구니에 product insert
			public void insertProduct(CartVO vo) {  
				Connection conn=null;
				PreparedStatement pstmt = null;
				
				try {
					conn = getConnection(); 	
					String query = "insert into hut_cart(how_many) values (?) where product_id = ? and userNmae = ?";
		
					pstmt = conn.prepareStatement(query);
//					pstmt.setString(1,vo.getUserType());
//					pstmt.setString(2,vo.getUserName());
//					pstmt.setString(3,vo.getUserPass());
//					pstmt.setString(4,vo.getUserEmail());
//					pstmt.setString(5,vo.getUserContact());
//					pstmt.setString(6,vo.getUserAddress());
					pstmt.executeUpdate(); 
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close(); 
				} catch(Exception e) { 
					e.printStackTrace();
				}
		}
}
