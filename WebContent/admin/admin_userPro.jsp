<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<form name="admin_user" class="form-horizontal"  >

<body>
                <table id="userTable" class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>회원 구분</th>
                      <th>회원 타입</th>
                      <th>아이디</th>
                      <th>이메일</th>
                      <th>전화번호</th>
                      <th>user_flg</th>
                      <th>권한 부여</th>
                      <th>권한 취소</th>
                    </tr>
                  </thead>
<% request.setCharacterEncoding("utf-8");%>

<%
AdminUserBean A_USER = AdminUserBean.getInstance();

	String temp = (request.getParameter("value")); //url로 준 거 받음
	int buttonid = Integer.parseInt(temp.substring(0,1)); //첫글자 - add,revert 버튼 구별
	int userid = Integer.parseInt(temp.substring(1)); //나머지 글자 - userid

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
	else if (buttonid==3){
		request.setCharacterEncoding("UTF-8");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");


		A_USER.searchUser(keyField, keyWord);
		PrintWriter writer=response.getWriter();

		ArrayList<UserVO> list = A_USER.searchUser(keyField, keyWord);
		for(int i=0;i<list.size();i++){
			user = list.get(i);
		
	
%>
                 <tbody>
                    <tr>
                      <td id="type0"><%=user.getUserId() %> </td>
                      <td id="type"><%=user.getUserType() %></td>
                      <td id="type2"><%=user.getUserName() %></td>
                      <td id="type3"><%=user.getUserEmail() %></td>
                      <td id="type4"><%=user.getUserContact() %></td>
                      <td id="type6"> <%=user.isUser_flg() %></td>
 <% }}%>
 </tr>
                  </tbody> 
                                  </table>    
                                  </form>
</body>
</html>