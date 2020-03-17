<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개농장-회원가입 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
body {
	margin:0;
	color:#edf3ff;
	background:#c8c8c8;
	background:url(https://hdqwalls.com/download/material-design-4k-2048x1152.jpg) fixed;
	background-size: cover;
	font:600 16px/18px 'Open Sans',sans-serif;
}
:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width: 100%;
	margin:auto;
	max-width:510px;
	min-height:900px;
	position:relative;
	background:url(https://maxcdn.icons8.com/app/uploads/2016/03/material-1-1000x563.jpg) no-repeat center;
	background-size: cover;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(0,0,0,0.5);
}
.login-html .sign-in-htm,
.login-html .for-pwd-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	-webkit-transform:rotateY(180deg);
	        transform:rotateY(180deg);
	-webkit-backface-visibility:hidden;
	        backface-visibility:hidden;
	-webkit-transition:all .4s linear;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .for-pwd,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:25px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .for-pwd:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:800px;
	position:relative;
	-webkit-perspective:1000px;
	        perspective:1000px;
	-webkit-transform-style:preserve-3d;
	        transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:20px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:18px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	-webkit-transition:all .2s ease-in-out 0s;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	-webkit-transform:scale(1) rotate(45deg);
	        transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	-webkit-transform:scale(1) rotate(-45deg);
	        transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .for-pwd + .tab + .login-form .sign-in-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}
.login-html .for-pwd:checked + .tab + .login-form .for-pwd-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

   <script > 
	$(window.document).ready(function() {
		
		//수정하기 버튼 클릭 시 특정 컬럼만 수정 가능
		$("#edit").click(function() {
			$("#userPass").attr("readonly", false).attr("disabled", false);
			$("#userEmail").attr("readonly", false).attr("disabled", false);
			$("#userContact").attr("readonly", false).attr("disabled", false);
			$("#userAddress").attr("readonly", false).attr("disabled", false);
			
		});
		
		$('#eye').on("mousedown", function(){
		    $('#userPass').attr('type',"text");
		}).on('mouseup mouseleave', function() {
		    $('#userPass').attr('type',"password");
		});

		
	});
	</script>
    
</head>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
	String uid = (String)session.getAttribute("uid");
	UserBean USER = UserBean.getInstance(); 
	UserVO uservo = USER.userEdit(uid); 
%>

<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  <div class="login-wrap">
	<div class="login-html">
        <form id="mypageForm" class="form-horizontal" action="/user/mypagePro.jsp" method="post" >
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">마이페이지</label>
		<input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab" onclick = "document.location.href='/home.jsp'">홈으로 돌아가기</label>		
				    
		
		<div class="login-form">
			<div class="sign-in-htm">
			
				<div class="group">
                     <label class="label" for="userType">회원 종류</label>
                     <input class="form-control" name="userName" value=
                                "<%=uservo.getUserType()%>" type="text" required minlength="4" readonly>
                 </div>
				<div class="group">
					<label class="label" for="userName">아이디
                            </label>
    				<input class="form-control" name="userName" value=
                                "<%=uservo.getUserType()%>" type="text" required minlength="4" readonly>
				</div>
				
				<div class="group">
					<label class="label" for="userPass">비밀번호
                            </label>
					<input class="form-control" name="userPass" value="<%=uservo.getUserPass()  %>"
                                type="password" id="userPass" required minlength="8" readonly>
                    <br>
                    <button type="button" id="eye" class="btn btn-info">비밀번호 보기</button>
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userEmail">Email</label>
					<input class="form-control" name="userEmail" value=
                                "<%=uservo.getUserEmail() %>" type="email" id="userEmail" required readonly>
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userContact">전화번호</label>
                    <input class="form-control" name="userContact" value=
                                "<%=uservo.getUserContact() %>" type="text" id="userContact" required readonly>
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userAddress">주소</label>
                    <input  class="form-control" name="userAddress" value=
                                "<%=uservo.getUserAddress() %>" type="text" id="userAddress" required readonly>
                </div>
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
				
			</div>
			
							
		</div>			
		
	</form>
	
</body>
</html>
