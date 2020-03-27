<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.*" %>
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
	int id = Integer.parseInt((request.getParameter("value")));
	AdminUserBean A_USER = AdminUserBean.getInstance(); 

	A_USER.updateUser(id); //자바빈에 VO를 넘긴다. 
	
	PrintWriter writer=response.getWriter();
	writer.println("<script>alert('권한 부여 성공...다시 메인 페이지로 이동합니다.'); location.href='/admin/admin_user.jsp';</script>");
%>

</body>
</html>