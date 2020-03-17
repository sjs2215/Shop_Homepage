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
	String uid = (String)session.getAttribute("uid");
	
	UserBean USER = UserBean.getInstance(); 
	
	//session에 저장된 uid(user 테이블의 user_name 컬럼)로 사용자 name(user 테이블의 user_id 컬럼)알아냄.
	int name = USER.get_user_name(uid); 
	user.setUserId(name); //현재 로그인 되더 있는 사용자를 VO에 set해주고

	USER.updateUser(user); //자바빈에 VO를 넘긴다. 이 VO로 update 해~
	
	PrintWriter writer=response.getWriter();
	writer.println("<script>alert('마이페이지 수정 성공...다시 메인 페이지로 이동합니다.'); location.href='/home.jsp';</script>");
%>

</body>
</html>