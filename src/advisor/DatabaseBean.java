package advisor;

import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class DatabaseBean {
	private static DatabaseBean instance = new DatabaseBean();
	
	private DatabaseBean() {}  
	public static DatabaseBean getInstance() {  
		//�떛湲��넠�씠�뿬�꽌 �븯�굹 媛앹껜 留뚮뱺嫄� �엳�뒗�뜲 洹멸굅瑜� �쇅遺��뿉�꽌 媛��졇媛��빞吏� �굹以묒뿉 jsp�뙆�씪�뿉�꽌 �벐�땲源� �씠 硫붿냼�뱶媛� �븘�슂�븿. 
		//static�� �솢 �궗�슜�뻽�굹?
		//getInstance媛�吏�怨� �엳�뵲硫� �뼵�젣�뱺吏� 以꾧퍡~ 
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

	
	public void insertStudent(UserVO vo) {  
		Connection conn=null;
		PreparedStatement pstmt = null;
		int seq=0;
		Calendar cal = new GregorianCalendar();
		try {
			conn = getConnection(); 
			String query = "select userId from hut_user order by userId desc limit 1";
			ResultSet rs = pstmt.executeQuery(query);
			
			while(rs.next()){
				seq = rs.getInt(query); 

			}
			
			query = "insert into hut_user values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,seq+1);
			pstmt.setString(2,vo.getUserType());
			pstmt.setString(3,vo.getUserName());
			pstmt.setString(4,vo.getUserPass());
			pstmt.setString(5,vo.getEmail());
			pstmt.setString(6,vo.getAddress());
			pstmt.setLong(7, cal.getTimeInMillis());
			pstmt.executeUpdate(); 
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close(); 
		} catch(Exception e) { 
			e.printStackTrace();
		}
	}
	
	
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
		
}