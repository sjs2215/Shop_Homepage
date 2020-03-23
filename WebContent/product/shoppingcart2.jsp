<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cart.*"%>
<%@ page import="advisor.*"%>
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
    	
    	//주문 확인 부분은 숨겨놓기
    	$('.order_info').hide();
    	
	    //초기화 버튼 클릭 시 url로 1 전달
	    $("button[name=clear]").click(function () {

            $("form[name=cart]")

            .attr({ action: "shoppingcartPro.jsp?value="+$(this).val(), method: "post" })

            .submit();

        });
	    
	    //결제 버튼 클릭 시 보여줌.
	    $("button[name=order]").click(function(){
	    	$('.order_info').show();
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
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
	UserBean USER = UserBean.getInstance(); 
	UserVO uservo = USER.userEdit(uid2); 
%>
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

	int total=0;
	ArrayList<CartVO> list = CART.showCart(name);
	for(int i=0;i<list.size();i++){
		cart = list.get(i);
		total += cart.getTotal();
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
                                <button class="btn btn-success btn-lg" id="again" 
                                name="again" type="button" onClick="location.href='/product/shop.jsp'">'더' 주문하러 가기
                                </button>  
                                <button class="btn btn-info btn-lg" id="clear" value="1"
                                name="clear" >초기화하기
                                </button> 
                                <button class="btn btn-primary btn-lg" id="order" 
                                name="order" type="button" onClick="location.href='#'">결제하러 가기
                                </button> 
                                
                                
                            </div>
                        </div>
                        
<br><br>                        
                        
                        <div class="order_info">
                        
                        	<h1>예약 확인 및 취소</h1>
                        	<h3>고객님의 예약정보는 아래와 같습니다.</h3>
							<br>

						<table class="table table-striped">
						    <thead>
						        <tr>
						            <th>결제 방법</th>
						            <th>예약 상태</th>
						            <th>예약자</th>
						            <th>총 금액</th>
						            
						        </tr>
						    </thead>
						
						      <tbody>
						        <tr class="warning">
						            <td>무통장 입금</td>
						            <td>입금대기</td>
						            <td><%=uid2 %>님</td> 
						            <td><%=total%>원</td>
						        </tr>
						      </tbody>
						</table>

<br>

            <h3>주문/배송 info</h3>
						<table class="table table-striped">
						    <thead>
						        <tr>
						            <th>판매자명</th>
						            <th>판매자 대표번호</th>
						            <th>예약자</th>
						            <th>연락처</th>
						            <th>주소</th>
						            <th> 이메일</th>
						        </tr>
						    </thead>
						
						      <tbody>
						        <tr class="info">
						            <td>헛개닷컴(주)</td>
						            <td>02-112-1562</td>
						            <td><%=uid2 %>님</td> 
						            <td><%=uservo.getUserContact() %></td>
						            <td><%=uservo.getUserAddress() %></td>
						            <td><%=uservo.getUserEmail() %></td>
						        </tr>
						      </tbody>
						</table>            


<br><br>
<div align="right">
<button class="btn btn-danger btn-lg" id="clear" value="1" name="clear" >주문 취소하기 </button>
</div>
<br><br>
<h3>
<%=cart.getOrder_Credate() %> 자정까지 입금완료 하지 않을 경우 자동취소 됩니다.

인터넷 예약의 특성상 입금시간이 지체되면 예약이 중복 될 수 있어 빠른 입금을 부탁드립니다.<br>

<span style="font-weight:bold;">입금확인이 되면. 예약완료정보(업소연락처,예약번호등)가 핸드폰으로 전송</span>됩니다.

무통장입금시 반드시 예약자명으로 입금하셔야합니다. 입금확인이 되지 않을 수 있습니다.<br>

예약시점 이후 <span style="font-weight:bold;">24시간</span> 이내에 입금완료 하지 않는 경우 <span style="font-weight:bold;">자동 취소</span>됩니다.<br>
       </h3>        
                        </div>
	
</form>
</body>		
</html>


