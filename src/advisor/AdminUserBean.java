package advisor;

import java.sql.*;
import java.util.ArrayList;

import cart.CartVO;

public class AdminUserBean {
	private static AdminUserBean instance = new AdminUserBean();
	
	private AdminUserBean() {}  
	public static AdminUserBean getInstance() {  
	
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


	
	//모든 회원 정보 조회	
		public ArrayList<UserVO> allUser() throws Exception {
			ArrayList<UserVO> list = new ArrayList<UserVO>();
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			UserVO uservo = null;
			
			try {
				conn = getConnection();
				String query = "select * from hut_user ";

				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					uservo = new UserVO();
					uservo.setUserId(rs.getInt("userId"));
					uservo.setUserType(rs.getString("userType"));
					uservo.setUserName(rs.getString("userName"));
					uservo.setUserEmail(rs.getString("userEmail"));
					uservo.setUserContact(rs.getString("userContact"));
					uservo.setUserRegdate(rs.getDate("userRegdate"));
					uservo.setUser_flg(rs.getBoolean("user_flg"));
					list.add(uservo);
				}
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
				e.printStackTrace();
			}  
			return list;
		}
		
		//(admin)회원 정보 조회+권한 부여 - 업데이트	
		public void update_auth_user(int userid) throws Exception {
			
			Connection conn=null;
			PreparedStatement pstmt = null;
			int re= -1;
			try {
				conn = getConnection();
				String query = "update hut_user set user_flg =1 where userId = ?";

				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, userid);
				re = pstmt.executeUpdate();
			
					
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
				e.printStackTrace();
			}  
		}
		
		//(admin)회원 권한 취소 - 업데이트	
		public void revert_auth_user(int userid) throws Exception {
			
			Connection conn=null;
			PreparedStatement pstmt = null;
			int re= -1;
			try {
				conn = getConnection();
				String query = "update hut_user set user_flg =0 where userId = ?";

				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, userid);
				re = pstmt.executeUpdate();
			
					
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
				e.printStackTrace();
			}  
		}	
}