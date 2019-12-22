package advisor;

import java.sql.*;

public class DatabaseBean {
	private static DatabaseBean instance = new DatabaseBean();
	
	private DatabaseBean() {}  
	public static DatabaseBean getInstance() {  
	
		return instance;
	}
	
	private Connection getConnection() throws Exception { 
		String jdbcUrl ="jdbc:mysql://localhost:3306/users_info?useSSL=false";
		String dbUser = "shop";
		String dbPass = "shop1001!";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}

	
	public void insertUser(UserVO vo) {  
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection(); 	
			String query = "insert into hut_user(userType, userName, userPass, userEmail, userContact, userAddress) values (?,?,?,?,?,?)";

			System.out.println("contact"+vo.getUserPass());
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
	
	/*
	public int userCheck(String id, String passwd) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int x = -1;
		try {
			conn = getConnection();
			String query = "select userPass from student where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,id);

			rs = pstmt.executeQuery();
			while(rs.next()){
				String dbpasswd= rs.getString(1); 
				if(passwd.equals(dbpasswd))
					x = 1;
				else
					x = 0;
			}
			
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return(x);  
	}
	*/	
}