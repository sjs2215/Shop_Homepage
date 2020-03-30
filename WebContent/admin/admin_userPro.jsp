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
	String temp = (request.getParameter("value")); //url로 준 거 받음
	int buttonid = Integer.parseInt(temp.substring(0,1)); //첫글자 - add,revert 버튼 구별
	int userid = Integer.parseInt(temp.substring(1)); //나머지 글자 - userid

	AdminUserBean A_USER = AdminUserBean.getInstance(); 

	if (buttonid==0){
		A_USER.update_auth_user(userid);
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('권한 부여 성공...다시 메인 페이지로 이동합니다.'); location.href='/admin/admin_user.jsp';</script>");
	}
	else if (buttonid==1){
		A_USER.revert_auth_user(userid);
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('권한 취소 성공...다시 메인 페이지로 이동합니다.'); location.href='/admin/admin_user.jsp';</script>");
	}
	

%>

</body>
</html>