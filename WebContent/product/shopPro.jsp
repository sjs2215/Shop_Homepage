<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.CartBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="cart" class="cart.CartVO">
	<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>
<%
	CartBean CART = CartBean.getInstance(); 
	
	String uid = (String)session.getAttribute("uid");
	
	int product=1;

	int name = CART.get_user_name(uid);
	CART.insertCart(cart, product , name);
%>
</body>
</html>