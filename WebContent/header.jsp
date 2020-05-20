<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
/* Base CSS */

html {
	font-family: 'Ubuntu', sans-serif;
}

.filtering {
	margin-bottom: 54px;
}
a:focus {
	outline: 0 solid
}

a {
	display: inline-block
}

a:hover {
	display: inline-block;
	text-decoration: none;
	color: inherit;
}

.flex {
	display: flex;
}

.no-padding {
	padding: 0;
}

img {
	width: 100%;
	height: auto;
}

.bg-img {
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.section-padding {
	padding: 60px 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
	margin: 0 0 15px;
	font-weight: 700;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none
}

p {
	font-size: 15px;
	color: #a3a3a3;
	line-height: 1.6;
	word-spacing: 1px;
	margin: 0;
}

body {
	font-family: 'Noto Sans', sans-serif;
	font-size: 14px;
	line-height: 1.4;
}

a {
	text-decoration: none;
	color: #111;
}

.border_btn {}


/*  Start Nav CSs */

.navbar.navbar-expand-lg.nav_area.sticky {
	transition: all .6s;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header {
	background-color: #fff;
	z-index: 999999;
	box-shadow: 1px -5px 24px #776b6bcc;
	padding: 17px 0px;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li a {
	color: #000;
	transition: .6s;
	opacity: .7;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li:hover a {
	color: #F24259;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-light {
	display: inline-block;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-dark {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-light {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-dark {
	display: inline-block;
}

.nav_area {
	position: fixed;
	left: 0;
	right: 0;
	z-index: 9999;
	padding: 22px 0px;
	transition: .6s;
}

.logo {
	height: 41px;
	padding: 7px 0px;
}

.logo a {}

.logo-light {
	font-size: 22px;
	font-weight: 700;
}

.logo-light:hover {
	text-decoration: none;
	color: #111;
}

.logo-dark {
	font-size: 22px;
	font-weight: 700;
	color: #111;
}

.logo-dark:hover {
	text-decoration: none;
	color: #111;
}

.logo a img {}

.main_menu li a:hover {
	color: #F24259;
}

.main_menu li a {
	color: #111;
	font-size: 14px;
}

.main_menu .blk_btn {
	background-color: #F24259;
	color: #fff;
	margin-left: 13px;
	border-radius: 50px;
	padding: 10px 17px;
	transition: all .6s;
}

.main_menu a {
	text-decoration: none;
}

.navbar-nav.ml-auto.navbar-center.main_menu.onepage_nav li.active a {
	color: #F24259;
}
</style>
<title>Insert title here</title>

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    
    <jsp:useBean id="user" class="advisor.UserVO">
		<jsp:setProperty name="user" property="*"/>
    </jsp:useBean>
	<%
		String uid2 = (String)session.getAttribute("uid");
		UserBean USER = UserBean.getInstance(); 
   	  
		//변수 uid(user 테이블의 user_name 컬럼)로 (user 테이블의 user_id 컬럼)알아냄.
    	int name = USER.get_user_name(uid2);
    	 
    	//admin 유저인지 체크
    	int check = USER.adminCheck(name);
    	
    	//admin 유저인데 승인처리 되어있는지 체크
    	int admin_flgcheck = USER.admin_flgCheck(name);
	%>
  
    <script type="text/javascript"> 
    
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      //google log out
      auth2.signOut().then(function () {
        console.log('(google)User signed out.');
      });
      //db log out
      location.replace("/user/logOut.jsp");
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
    
     function mypage_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
     	 if(uid=="null"){ 
     		swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
     	 }
     	 else{
     		location.replace("/user/mypageForm.jsp");
     	 }
    }

     function cart_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
     	 if(uid=="null"){ 
     		swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
     	 }
     	 else{
     		location.replace("/product/shoppingcart2.jsp");
     	 }
    }   

     function admin_check(){ 
    	 var uid = '<%=(String)session.getAttribute("uid")%>';
    	 
    	 if(uid=="null"){ //로그인 정보 없을 시
     		swal("관리자 계정으로 로그인을 해주세요","접속된 세션 정보가 없습니다.", "error"); 
     	 }
    	 
    	 if(uid!="null"&&<%=check%>==0){ //일반 계정으로 로그인 시
    		 swal("관리자만 접근 가능합니다.","관리자로 회원가입 후 승인을 기다려주세요.", "error"); 
    	 }
    	 else if(uid!="null"&&<%=check%>==1){ //admin 계정으로 로그인 시
    		 location.replace("/admin/admin.jsp");
    	 }
    	 
    	 if(uid!="null"&&<%=admin_flgcheck%>==0&&<%=check%>==0){ //admin 계정으로 로그인 하였으나 아직 승인 처리 안 되었을 때
    		 swal("승인 심사가 완료되지 않았습니다.","관리자 계정으로 회원가입을 한 경우,\n 승인 심사는 약 7일 정도 소요됩니다.\n 자세한 사항은 담당자에게 문의해주세요.\n이메일 문의: soojinsarah@naver.com", "error");
    	 }
    }
 	</script>

</head>
<body>
<nav class="navbar navbar-expand-xl nav_area sticky">
	<div class="container">
		<div class="logo">
			<a href="" class="logo-light">헛개농장</a>
			<a href="" class="logo-dark">헛개농장</a>
		</div>
		<div class="collapse navbar-collapse " id="navbarNav">
			<ul class="navbar-nav ml-auto navbar-center main_menu onepage_nav">
				<li class="nav-item active">
					<a class="nav-link" href="/home.jsp">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" onClick="cart_check();">장바구니</a>
				</li>
				<li class="nav-item" id="mypage">
					<a class="nav-link" href="#" onClick="mypage_check();">마이 페이지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/user/registerForm.jsp">회원가입</a>
				</li>
				<li class="nav-item">
					<a class="nav-link"  href="/user/signinForm.jsp">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" onClick="signOut();">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" onClick="admin_check();">관리자 페이지</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>