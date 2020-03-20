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
	
	String id_n_num = (request.getParameter("value")); //url로 준 거 받음
	int product_id = Integer.parseInt(id_n_num.substring(0,1)); //첫글자 - 상품갯수
	int how_many = Integer.parseInt(id_n_num.substring(1)); //나머지 글자 - 수량
	String uid = (String)session.getAttribute("uid");
		
	System.out.println(product_id+"번 상품을, "+how_many+"개 주문. 주문한 고객 이름: "+uid);

	//session에 저장된 uid(user 테이블의 user_name 컬럼)로 사용자 name(user 테이블의 user_id 컬럼)알아냄.
	int name = CART.get_user_name(uid); 
	CART.insertCart(cart, product_id, name, how_many);
	
	PrintWriter writer=response.getWriter();
	writer.println("<script>alert('장바구니에 저장 성공...다시 주문 페이지로 이동합니다.'); location.href='/product/shop.jsp';</script>");

%>
</body>
</html>