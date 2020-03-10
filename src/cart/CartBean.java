package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import advisor.UserVO;
import net.sf.json.util.JSONStringer;


import cart.CartVO;

public class CartBean {

	private static CartBean instance = new CartBean();
	
	private CartBean() {}  
	public static CartBean getInstance() {  
	
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

	
	//hut_cart테이블에 클릭상품 insert
	public void insertCart(CartVO vo, int productid, int userid) {  
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection(); 	
			String query = "insert into hut_cart(product_id, userId, how_many) values (?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productid);
			pstmt.setInt(2, userid);
			pstmt.setInt(3, 1); //장바구니에 담기는 개수는 항상 1개. 이후 수량 조절은 shoppingcart.jsp (jqgrid)에서 할 것.
			pstmt.executeUpdate(); 
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close(); 
		} catch(Exception e) { 
			e.printStackTrace();
		}
}
	
	//username을 이용해 userid 알아내기	
	public int get_user_name(String usernm) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int x=0;
		
		try {
			conn = getConnection();
			String query = "select userid from hut_user where username=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,usernm);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt("userid");
			}
			
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return(x);  
}

	//장바구니 retrieve
//			public JSONStringer showCart() {  
//				Connection conn=null;
//				PreparedStatement pstmt = null;
//				ResultSet rset = null;
//				JSONStringer js = null;
//				
//				StringBuffer QUERY_STRING00 = new StringBuffer();
//		        QUERY_STRING00
//		        .append("   SELECT  *  FROM HUT_PRODUCT   ");
//				
//				try {
//					conn = getConnection(); 	
//					
//		
//					pstmt = conn.prepareStatement(QUERY_STRING00.toString());
//					rset = pstmt.executeQuery();
//					js = new JSONStringer();
//					js.array();
//					while(rset.next()){
//						js.object()
//						.key("product_name").value(rset.getString("product_name"))
//						.key("product_desc").value(rset.getString("product_desc"))
//						.key("product_stock").value(rset.getInt("product_stock"))
//						.key("product_price").value(rset.getString("product_price"))
//						.endObject();
//					}
//					js.endArray();
//					
//					if(pstmt != null) pstmt.close();
//					if(conn != null) conn.close(); 
//				} catch(Exception e) { 
//					e.printStackTrace();
//				}
//				return js;
//		}
}
