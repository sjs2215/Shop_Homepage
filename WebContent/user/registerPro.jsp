<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.UserBean" %>
<%@ page import ="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
	UserBean USER = UserBean.getInstance(); 
	USER.insertUser(user); 

	PrintWriter writer=response.getWriter();
	writer.println("<script>alert('회원가입 성공...축하드립니다.'); location.href='/thankyou.html';</script>");

%>
</body>
</html>