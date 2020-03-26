package advisor;

import java.sql.*;

public class UserBean {
	private static UserBean instance = new UserBean();
	
	private UserBean() {}  
	public static UserBean getInstance() {  
	
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

	//회원 정보 insert-회원가입	
		public void insertUser(UserVO vo) {  
			Connection conn=null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection(); 	
				String query = "insert into hut_user(userType, userName, userPass, userEmail, userContact, userAddress) values (?,?,?,?,?,?)";
	
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,vo.getUserType());
				pstmt.setString(2,vo.getUserName());
				pstmt.setString(3,vo.getUserPass());
				pstmt.setString(4,vo.getUserEmail());
				pstmt.setString(5,vo.getUserContact());
				pstmt.setString(6,vo.getUserAddress());
				pstmt.executeUpdate(); 
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close(); 
			} catch(Exception e) { 
				e.printStackTrace();
			}
	}
	
	//회원 정보 있는지 체크-로그인	
		public int userCheck(String userName, String userPass) {
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String dbpasswd="";
			int x = -1;
			
			try {
				conn = getConnection();
				String query = "select userPass from hut_user where userName = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userName);
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
	
	//회원 정보 조회	
		public UserVO userEdit(String id) throws Exception {
			
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			UserVO uservo = null;
			
			try {
				conn = getConnection();
				String query = "select * from hut_user where userName = ?";

				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,  id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					uservo = new UserVO();
					uservo.setUserType(rs.getString("userType"));
					uservo.setUserName(rs.getString("userName"));
					uservo.setUserPass(rs.getString("userPass"));
					uservo.setUserEmail(rs.getString("userEmail"));
					uservo.setUserContact(rs.getString("userContact"));
					uservo.setUserAddress(rs.getString("userAddress"));
					
				}
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
				e.printStackTrace();
			}  
			return uservo;
		}


	//admin 유저인지 체크
		public int adminCheck(int userId) {
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String user_type="";
			int x = -1;
			
			try {
				conn = getConnection();
				String query = "select userType from hut_user where userId = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1,userId);
				rs = pstmt.executeQuery();
				if(rs.next()){
					user_type=rs.getString("userType");
					if(user_type.equals("admin"))
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
		
	//회원 정보 조회+업데이트	
		public void updateUser(UserVO user) throws Exception {
			
			Connection conn=null;
			PreparedStatement pstmt = null;
			int re= -1;
			try {
				conn = getConnection();
				String query = "update hut_user set userPass=?, userEmail=?, userContact=?, userAddress=? where userId =?";

				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, user.getUserPass());
				pstmt.setString(2,  user.getUserEmail());
				pstmt.setString(3,  user.getUserContact());
				pstmt.setString(4,  user.getUserAddress());
				pstmt.setInt(5, user.getUserId());
				re = pstmt.executeUpdate();
			
					
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
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

	
}