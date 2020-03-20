<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.*" %>
<%@ page import ="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="cart" class="cart.CartVO">
	<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>
<%
	CartBean CART = CartBean.getInstance(); 

	//url로 준 거 받음
	int delete = Integer.parseInt(request.getParameter("value"));
	
	//session에 저장된 uid(user 테이블의 user_name 컬럼)로 사용자 name(user 테이블의 user_id 컬럼)알아냄.
	String uid = (String)session.getAttribute("uid");
	int name = CART.get_user_name(uid);
	
	ArrayList<CartVO> list = CART.showCart(name);
	if(delete==1){
		CART.deleteCart(name);
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('주문 초기화 성공...다시 주문 페이지로 이동합니다.'); location.href='/product/shop.jsp';</script>");

	}
	
	for(int i=0;i<list.size();i++){
		cart = list.get(i);
	 
		int product_id = cart.getProduct_id();
		int sum_qty = cart.getHow_many();
		
		//total_price는 새로 계산
		int product_price = CART.get_product_price(product_id);
		int total_price = sum_qty*product_price;
		
		CART.insertOrder(name, product_id, sum_qty, total_price);

		
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('주문 성공...다시 주문 페이지로 이동합니다.'); location.href='/product/shop.jsp';</script>");

	}
%>

</body>
</html>