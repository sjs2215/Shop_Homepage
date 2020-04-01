<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@ page import="advisor.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(window.document).ready(function() {

	//user의 경우 권한 버튼 없애기
	$("#userTable td[id^='type']:contains('user')").each(function () {

		$(this).next().next().next().next().html("");
		$(this).next().next().next().next().next().html("불가");
	    $(this).next().next().next().next().next().next().html("불가");

	});
	
	//[admin이면서 user_flg가 false일 때만] 해당 행 전체 색깔 처리
	$("#userTable td[id^='type']:contains('admin')").each(function () {
		$("#userTable td[id^='type6']:contains('false')").each(function () {
		    $(this).css ("color","red");
		    $(this).siblings().css ("color","red");
		});
	});
	
	//버튼 클릭 시 해당 row의 userid도 전송
    //각 product id는 value 값을 url로 전달
    $("button[name=add]").click(function () {

        $("form[name=admin_user]")

        .attr({ action: "admin_userPro.jsp?value="+$(this).attr('id')+$(this).val(), method: "post" })

        .submit();

    });
	
	//버튼 클릭 시 해당 row의 userid도 전송
    //각 product id는 value 값을 url로 전달
    $("button[name=revert]").click(function () {

        $("form[name=admin_user]")

        .attr({ action: "admin_userPro.jsp?value="+$(this).attr('id')+$(this).val(), method: "post" })

        .submit();

    });	
	
	//search 버튼 클릭 시
	    $("button[name=search]").click(function () {

        $("form[name=admin_user]")

        .attr({ action: "admin_userPro.jsp?value="+$(this).attr('id')+$(this).val(), method: "post" })

        .submit();

    });	
	
	
	//$("#search").click(function(e){
		//if($("#text").val()==""){
			//alert("검색 키워드를 입력하세요.");
			
		//}
		//e.preventDefault();
	//});
});

</script>
<style>
.text-primary {
    color: #4e73df;
}
.font-weight-bold {
    font-weight: 700;
}
.m-0 {
    margin: 0;
}
h6, .h6 {
    font-size: 1rem;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #e3e6f0;
    border-radius: 0.35rem;
    margin:20px auto;
}
.card-header {
    padding: 0.75rem 1.25rem;
    margin-bottom: 0;
    background-color: #f8f9fc;
    border-bottom: 1px solid #e3e6f0;
}
.shadow {
    box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15) !important;
}
.display-flex {
    display: flex;
}
.align-center {
    align-items: center;
}
.ml-auto {
    margin-left: auto !important;
}
.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #6e707e;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #d1d3e2;
    border-radius: 0.35rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.btn-primary {
    color: #fff;
    background-color: #4e73df;
    border-color: #4e73df;
}
.card-body {
    flex: 1 1 auto;
    padding: 1.25rem;
}
.table-responsive {
    display: block;
    width: 100%;
    overflow-x: auto;
}
.table-responsive > .table-bordered {
    border: 0;
}
.table-bordered th, .table-bordered td {
    border: 1px solid #e3e6f0;
}
.table thead th {
    vertical-align: middle;
    border-bottom: 2px solid #e3e6f0;
}
.table-bordered thead th, .table-bordered thead td {
    border-bottom-width: 2px;
}
.table-bordered thead th {
    background: #5d71e4;
    color: #fff;
}
</style>
<!------ Include the above in your HEAD tag ---------->
</head>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<body>
<form name="admin_user" class="form-horizontal" action="/admin/admin_userPro.jsp" method="post" >
<div class="container">
	<div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="display-flex align-center">
                <h6 class="m-0 font-weight-bold text-primary">회원 정보 테이블. 권한 승인하기</h6>
                <div class="ml-auto display-flex align-center">
                  <select class="form-control" id="keyWord" name="keyField">
                  	<option value="0" name="keyField">--------선택--------</option>
                  	<option value="userType">회원 타입</option>
                  	<option value="userEmail">이메일</option>
                  	<option value="userAddress">주소</option>
                  </select>
                  <input type="text" id="keyWord" name="keyWord" class="form-control" placeholder="Search">
                  <button name="search" id="3" value="3" class="btn btn-md btn-primary ml-2">Search</button>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
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
                  
<%
	AdminUserBean A_USER = AdminUserBean.getInstance(); 
	String uid = (String)session.getAttribute("uid");
	ArrayList<UserVO> list;

		list = A_USER.allUser();

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
                      <td><button name="add" class="btn btn-success btn-lg" id="0" type="submit" value="<%=user.getUserId()%>">부여 </button></td>
                      <td><button name="revert" class="btn btn-warning btn-lg" id="1" type="submit" value="<%=user.getUserId()%>">취소 </button></td>
<%
	}
%>                       
                    </tr>
                  </tbody>
                </table>

              </div>
            </div>
          </div>
          
          <div align="right">    
</div>
          <div style="text-align:center;font-size:14px;padding-top:20px;padding-bottom:20px;">Get free icon packs for your next project at <a href="http://iiicons.in/" target="_blank" style="color:#ff5e63;font-weight:bold;">www.iiicons.in</a></div>
</div>
</form>
</body>
</html>