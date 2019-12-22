<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.DatabaseBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%

	DatabaseBean USER = DatabaseBean.getInstance(); // 이 두줄로 끝	
	
	String name =request.getParameter("userName");
	String password =request.getParameter("userPass");
	
	USER.userCheck(name, password); //이 두줄로 끝 

	int check = USER.userCheck(name, password); //이 두줄로 끝
	
	if(check==1) {
		Cookie cookie = new Cookie("userName", name);
		cookie.setMaxAge(20*60);
		response.addCookie(cookie);
		response.sendRedirect("/home.jsp");
	} else if(check==0) {%>
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