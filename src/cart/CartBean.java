package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cart.CartVO;

public class CartBean {

	private static CartBean instance = new CartBean();
	
	CartBean() {}  
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
      public CartVO showCart() {
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          CartVO cartvo = null;
          String sql=
"select orderId, how_many from hut_cart where orderId = 1";

          try{

              conn = getConnection();

              pstmt = conn.prepareStatement(sql);
              //pstmt.setInt(1, user_id);
              rs = pstmt.executeQuery();
              // 결과물 편집, 리턴
              if(rs.next()){
            	  cartvo = new CartVO();
            	  cartvo.setOrderId(rs.getInt("orderId"));
            	  cartvo.setHow_many(rs.getInt("how_many"));
              }
  			if(rs !=null) rs.close();
  			if(pstmt != null) pstmt.close();
  			if(conn != null) conn.close();
          } catch(Exception e){
              e.printStackTrace();
          } 
          return cartvo;
      }
      
      // 전체 행의 수를 리턴하는 메서드
      public int getCountRow() {
         
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          String sql="select count(*) from hut_cart";
          try{
        	  // DB 접속
              conn = getConnection();
              // 쿼리 명령어 설정, 보내기, 결과물 받기
              pstmt = conn.prepareStatement(sql);
              rs = pstmt.executeQuery();
              // 결과물 편집, 리턴
              if(rs.next()){
                  return rs.getInt(1);
              }
          } catch(Exception e){
              e.printStackTrace();
          } finally {
              // db관련  커넥션 해제
          }
          return 0;
      }
}
