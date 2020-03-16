package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
       public ArrayList<CartVO> showCart(int id) {
    	   ArrayList<CartVO> list = new ArrayList<CartVO>();
    	   Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
           CartVO cartvo = null;
           String sql= " select c.orderId, p.product_id, sum(c.how_many), p.product_price*sum(c.how_many), c.order_Credate "
           		+ " from hut_product p, hut_user u, hut_cart c "
           		+ " where 1 = 1 "
           		+ " and p.product_id = c.product_id "
           		+ " and u.userid = c.userid "
           		+ " and u.userid= ? "
           		+ " group by p.product_id, u.userid ";
 
           try{
 
               conn = getConnection();
 
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, id);
               rs = pstmt.executeQuery();
               
               while(rs.next()){
            	  cartvo = new CartVO();
             	  cartvo.setOrderId(rs.getInt("orderId"));
             	  cartvo.setProduct_id(rs.getInt("product_id"));
             	  cartvo.setHow_many(rs.getInt("sum(c.how_many)"));
             	  cartvo.setTotal(rs.getInt("p.product_price*sum(c.how_many)"));
             	  cartvo.setOrder_Credate(rs.getDate("order_Credate"));
             	  //int q = rs.getInt(4);
             	  list.add(cartvo);
             	  //System.out.println("수진"+x+", "+y+", "+z+", "+q);
               }
               
   			if(rs !=null) rs.close();
   			if(pstmt != null) pstmt.close();
   			if(conn != null) conn.close();
           } catch(Exception e){
               e.printStackTrace();
           } 
           return list;
       }
       
        
}
