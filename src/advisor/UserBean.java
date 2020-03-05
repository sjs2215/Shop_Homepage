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
		String dbUser = "root";
		String dbPass = "park1001!";
		
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
		public void userEdit(String userName) {
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = getConnection();
				String query = "select * from hut_user where userName = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userName);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String type = rs.getString("userType");
					String name = rs.getString("userName");
					String pass = rs.getString("userPass");
					String email = rs.getString("userEmail");
					String contact = rs.getString("userContact");
					String address = rs.getString("userAddress");
					//쿼리 결과 받아오기
					
				}
					
				
				
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e ) {
				e.printStackTrace();
			}  
		}


	//admin 유저인지 체크
		public int adminCheck(String userName) {
			Connection conn=null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String user_type="";
			int x = -1;
			
			try {
				conn = getConnection();
				String query = "select userType from hut_user where userName = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userName);
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
	
}