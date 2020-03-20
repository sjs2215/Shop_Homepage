<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="java.io.PrintWriter"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  	th {
  		color:#556B2F;
  	}
  
  </style>

    <script type="text/javascript"> 
    $(document).ready(function(){  
	    //초기화 버튼 클릭 시 url로 1 전달
	    $("button[name=clear]").click(function () {

            $("form[name=cart]")

            .attr({ action: "shoppingcartPro.jsp?value="+$(this).val(), method: "post" })

            .submit();

        });	
    });

	
	</script>

<title>장바구니</title>
</head>
<%
	String uid2 = (String)session.getAttribute("uid");
%>
<jsp:useBean id="cart" class="cart.CartVO">
	<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>
<body>
<form id="shoppingcartForm" name="cart" class="form-horizontal" action="/product/shoppingcartPro.jsp" method="post" >
<div class="container">
<br>
  <h2><%=uid2 %>님의 주문 항목입니다.</h2>
  <h4>항목을 수정하고 싶다면, 탈퇴하세요.</h4>   
  <h4>초기화 작업은 롤백되지 않으니 주의하세요.</h4>  
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
%>
    <tbody>
        <tr>
            <td><%=cart.getOrderId()%></td>
            <td><%=cart.getProduct_id() %></td>
            <td>
            <!-- for문 변수 i로 버튼 id 구분 -->
            	<input type ="text" name ="sum_qty" id = "sum_qty" placeholder="
            	<%=cart.getHow_many() %>" readonly> 
            	<!--  
            	<button class="btn btn-warning" id="edit<%=i%>" 
            	name="edit" type="button">수정하기 </button> 
            	<button class="btn btn-success" id="done<%=i%>" 
                name="submit" type="button">저장하기 </button> -->
            </td>
            <td><%=cart.getTotal()%>원</td>
            <td><%=cart.getOrder_Credate()%></td> 
            <!--  <td>
            	<button class="btn btn-danger" id="delete<%=i%>" 
                name="delete" type="button">삭제하기 </button>
            </td>-->

<%
	}
%> 
 </tr>
    </tbody>
</table>
<br>
                        <div class="control-group">
                            <div class="controls">
                                <button class="btn btn-success" id="again" 
                                name="clear" type="button" onClick="location.href='/product/shop.jsp'">다시 주문하러가기
                                </button>  
                                <button class="btn btn-info" id="clear" value="1"
                                name="clear" >초기화하기
                                </button> 
                                <button class="btn btn-primary" id="submit" 
                                name="submit" type="submit">주문하기
                                </button> 
                                
                                
                            </div>
                        </div>
	
</form>
</body>		
</html>


