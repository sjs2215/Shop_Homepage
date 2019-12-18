<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.DatabaseBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="student" class="advisor.UserVO">
	<jsp:setProperty name="student" property="*"/>
</jsp:useBean>
<%
DatabaseBean manager = DatabaseBean.getInstance(); // 이 두줄로 끝
manager.insertStudent(student); //이 두줄로 끝 
response.sendRedirect("home.jsp");
%>
</body>
</html>