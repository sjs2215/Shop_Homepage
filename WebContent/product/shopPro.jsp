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
	CART.insertProduct(cart); 
%>
</body>
</html>