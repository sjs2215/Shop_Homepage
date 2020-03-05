<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개농장-로그인 페이지</title>
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
	min-height:800px;
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

	<script type="text/javascript">
		$(function() { 
			$("#registerForm").validate(); 
			
			
			$.extend( $.validator.messages, { 
				required: "필수 항목입니다.", 
				remote: "항목을 수정하세요.", 
				email: "유효하지 않은 E-Mail주소입니다.", 
				url: "유효하지 않은 URL입니다.", 
				date: "올바른 날짜를 입력하세요.", 
				dateISO: "올바른 날짜(ISO)를 입력하세요.", 
				number: "유효한 숫자가 아닙니다.", 
				digits: "숫자만 입력 가능합니다.", 
				creditcard: "신용카드 번호가 바르지 않습니다.", 
				equalTo: "같은 값을 다시 입력하세요.", 
				extension: "올바른 확장자가 아닙니다.", 
				maxlength: $.validator.format( "{0}자를 넘을 수 없습니다. " ), 
				minlength: $.validator.format( "{0}자 이상 입력하세요." ), 
				rangelength: $.validator.format( "문자 길이가 {0} 에서 {1} 사이의 값을 입력하세요." ), 
				range: $.validator.format( "{0} 에서 {1} 사이의 값을 입력하세요." ), 
				max: $.validator.format( "{0} 이하의 값을 입력하세요." ), 
				min: $.validator.format( "{0} 이상의 값을 입력하세요." ) 
				} ); 
			});



		
		$(document).ready(function(){  
			
			$("select").change(function(){  
		        var value = $("select[name=userType] option:selected").val(); 
		        
		        if(value=="admin"){
		        	swal({
	        			title: "관리자 회원 가입 경고",
	        			text: "담당자 승인 후에 가입신청이 완료됩니다.\n이메일 문의: soojinsarah@naver.com", 
	        			icon: "warning",
	        			showCancelButton: true
	        		});
		        }
		        
		    });  
			
		    $("#submit").click(function(){ 

		    	var value = $("select[name=userType] option:selected").val();  

		        if(value==""){
		        	swal("회원 가입 실패","회원 종류를 선택하세요.", "error");  
			        return false;
		        }
		        else
		        	return true;
		    });  
		  });  


		
	</script>
</head>

<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  <div class="login-wrap">
	<div class="login-html">
        <form id="registerForm" class="form-horizontal" action="/user/registerPro.jsp" method="post" onsubmit="return validationCheck();">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">회원가입</label>
		<input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab"></label>		
				    
		
		<div class="login-form">
			<div class="sign-in-htm">
			
				<div class="group">
                            <label class="label" for=
                            "userType">회원 종류</label>

                            <div class="controls">
                            <select class="form-control" name="userType">
                            	<option> </option>
                            	<option value = "admin" > 관리자 </option>
                            	<option value = "user"  > 일반 회원 </option>
                            	</select> 
                            </div>
                 </div>
				<div class="group">
					<label class="label" for="userName">아이디
                            </label>
    				<input class="form-control" name="userName" placeholder=
                                "아이디를 입력하시오 " type="text" required minlength="4">
                            
				</div>
				
				<div class="group">
					<label class="label" for="userPass">비밀번호
                            </label>
					<input class="form-control" name="userPass" placeholder="비밀번호을 입력하시오"
                                type="password" required minlength="8">
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userEmail">Email</label>
					<input class="form-control" name="userEmail" placeholder=
                                "예시) xxx@xxx.com" type="email" required>
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userContact">전화번호</label>

                            <div class="controls">
                                <input class="form-control" name="userContact" placeholder=
                                "예시) 010-1111-1111" type="text" required>
                            </div>
                </div>
                
                <div class="group">
					<label class="label" for=
                            "userAddress">주소</label>

                            <div class="controls">
                                <input  class="form-control" name="userAddress" placeholder=
                                "주소를 입력하시오" type="text" required>
                            </div>
                </div>
                <br>
				<div class="group">
					 <button class="btn btn-success" id="submit" 
                                name="submit" type="submit">회원 가입하기
                                </button> 
					
				</div>
				
				
			</div>
			
							
		</div>			
		
	</form>
	
</body>
</html>
