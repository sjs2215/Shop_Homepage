<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
	UserBean USER = UserBean.getInstance(); 
	
	String name =request.getParameter("userName");
	String password =request.getParameter("userPass");
	String userType = request.getParameter("userType");
	
	USER.userCheck(name, password); 

	int user_check = USER.userCheck(name, password); //회원 정보 있는지 체크
	int admin_check = USER.adminCheck(name);//admin인지 체크
	
	
	//user_check 부분
	if(user_check==1) {  
		Cookie cookie = new Cookie("userName", name);
		cookie.setMaxAge(20*60);
		response.addCookie(cookie);
		if(admin_check==1){
			session.setAttribute("userType",userType);
			response.sendRedirect("/admin/admin.jsp");
		}
		else{
		response.sendRedirect("/home.jsp");
		}
	} 
	else if(user_check==0) {
%>
	<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	</script>
	<%} else { %>
	<script>
	alert("아이디가 맞지 않습니다");
	history.go(-1);
	</script>
<%}%>



</body>
</html>