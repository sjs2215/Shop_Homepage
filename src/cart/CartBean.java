package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import advisor.UserVO;
import net.sf.json.util.JSONStringer;


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

	
	//hut_cart���̺� Ŭ����ǰ insert
	public void insertCart(CartVO vo, int productid, int userid) {  
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection(); 	
			String query = "insert into hut_cart(product_id, userId, how_many) values (?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productid);
			pstmt.setInt(2, userid);
			pstmt.setInt(3, 1); //��ٱ��Ͽ� ���� ������ �׻� 1��. ���� ���� ������ shoppingcart.jsp (jqgrid)���� �� ��.
			pstmt.executeUpdate(); 
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close(); 
		} catch(Exception e) { 
			e.printStackTrace();
		}
}
	
	//username�� �̿��� userid �˾Ƴ���	
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

	  //��ٱ��� retrieve
      public List<CartVO> showCart(int user_id) {
          List<CartVO> list = new ArrayList<CartVO>();
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          String sql="select c.orderId, p.product_name, sum(c.how_many), p.product_price*sum(c.how_many)"
          		+ "from hut_product p, hut_user u, hut_cart c"
          		+ "where 1 = 1"
          		+ "and p.product_id = c.product_id"
          		+ "and u.userid = c.userid"
          		+ "and u.userid=?"
          		+ "group by p.product_id, u.userid ";

          try{
              // DB ����
              conn = getConnection();
              // ���� ��ɾ� ����, ������, ����� �ޱ�
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, user_id);
              rs = pstmt.executeQuery();
              // ����� ����, ����
              while(rs.next()){
            	  CartVO cart = new CartVO();
            	  cart.setOrderId(rs.getInt("c.orderId"));
            	  cart.setProduct_id(rs.getInt("p.product_name"));
            	  cart.setHow_many(rs.getInt("sum(c.how_many)"));
            	  cart.setHow_many(rs.getInt("p.product_price*sum(c.how_many)"));
                  list.add(cart);
              }
          } catch(Exception e){
              e.printStackTrace();
          } finally {
              // db����  Ŀ�ؼ� ����
          }
          return list;
      }
      
      // ��ü ���� ���� �����ϴ� �޼���
      public int getCountRow() {
         
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          String sql="select count(*) from hut_cart";
          try{
        	  // DB ����
              conn = getConnection();
              // ���� ��ɾ� ����, ������, ����� �ޱ�
              pstmt = conn.prepareStatement(sql);
              rs = pstmt.executeQuery();
              // ����� ����, ����
              if(rs.next()){
                  return rs.getInt(1);
              }
          } catch(Exception e){
              e.printStackTrace();
          } finally {
              // db����  Ŀ�ؼ� ����
          }
          return 0;
      }
}
