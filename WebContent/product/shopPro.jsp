<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.CartBean" %>
<%@ page import ="java.io.PrintWriter"%>

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
	
	int product_id = Integer.parseInt(request.getParameter("value")); //url로 준 거 받음
	String uid = (String)session.getAttribute("uid");
	
	System.out.println(product_id+"번 상품 주문. 주문한 고객 이름: "+uid);

	//session에 저장된 uid(user 테이블의 user_name 컬럼)로 사용자 name(user 테이블의 user_id 컬럼)알아냄.
	int name = CART.get_user_name(uid); 
	CART.insertCart(cart, product_id , name);
	
	PrintWriter writer=response.getWriter();
	writer.println("<script>alert('장바구니에 저장 성공...다시 주문 페이지로 이동합니다.'); location.href='/product/shop.jsp';</script>");

%>
</body>
</html>