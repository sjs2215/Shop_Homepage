<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.*"%>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script > 
	$(window.document).ready(function() {
		
		//상품이 4개밖에 없기에 하드 코딩으로 4개 밖아둠..
		//수정하기 버튼 클릭 시 특정 컬럼만 수정 가능
		$("#edit0").click(function() {
			$("#how_many0").attr("readonly", false).attr("disabled", false);
			
		});
		$("#edit1").click(function() {
			$("#how_many1").attr("readonly", false).attr("disabled", false);
			
		});
		$("#edit2").click(function() {
			$("#how_many2").attr("readonly", false).attr("disabled", false);
			
		});
		$("#edit3").click(function() {
			$("#how_many3").attr("readonly", false).attr("disabled", false);
			
		});
		
	});
	</script>

<title>장바구니</title>
</head>
<jsp:useBean id="cart" class="cart.CartVO">
	<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>

<div class="container">
<br>
  <h2>장바구니 table</h2>
  <h4>장바구니 페이지입니다. 장바구니 초기화 후 복귀되지 않으니 주의해주세요.</h4>    
  <br>
<table class="table table-striped">
    <thead>
        <tr>
            <th>주문 번호</th>
            <th>상품 번호</th>
            <th>구매 수량</th>
            <th>금액</th>
            <th>장바구니에 담은 날짜</th>
        </tr>
    </thead>
<%
	CartBean CART = CartBean.getInstance(); 
	String uid = (String)session.getAttribute("uid");
	
	//session에 저장된 uid(user 테이블의 user_name 컬럼)로 사용자 name(user 테이블의 user_id 컬럼)알아냄.
	int name = CART.get_user_name(uid); 

	ArrayList<CartVO> list = CART.showCart(name);
	for(int i=0;i<list.size();i++){
		cart = list.get(i);
	//out.println(list.size());
%>
    <tbody>
        <tr>
            <td><%=cart.getOrderId()%></td>
            <td><%=cart.getProduct_id() %></td>
            <td>
            
            	<input type ="text" name ="how_many" id = "how_many<%=i%>" placeholder="
            <%=cart.getHow_many() %>" readonly> <button class="btn btn-success" id="edit<%=i%>" 
                                name="edit" type="button">수정하기
                                </button> 
            </td>
            <td><%=cart.getTotal()%>원</td>
            <td><%=cart.getOrder_Credate()%></td> 

<%
	}
%> 
 </tr>
    </tbody>
</table>
<br>
                        <div class="control-group">
                            <div class="controls">
                                 
                                <button class="btn btn-success" id="edit" 
                                name="edit" type="button">수정하기
                                </button> 
                                <button class="btn btn-success" id="submit" 
                                name="submit" type="submit">저장하기
                                </button> 
                            </div>
                        </div>
			
</html>


