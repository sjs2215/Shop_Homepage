<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개농장 - 회원가입 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <style type="text/css">
        
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>


            <div class="span6">
                <div class="area">
                    
                    <form class="form-horizontal" action="registerPro.jsp" method="post">
                        <div class="heading">
                            <h4 class="form-heading">회원가입</h4>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userType">회원 종류</label>

                            <div class="controls">
                            <!-- <select name="회원 종류 선택">
                            	<option value = "selected(user)">선택</option>
                            	<option value = "admin" id = "userType"> 관리자 </option>
                            	<option value = "user" id = "userType"> 일반 회원 </option>
                            	</select> -->
                            <input id="userType" placeholder=
                                "관리자 또는 일반 회원을 입력하세요" type="text">	
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userName">아이디
                            </label>

                            <div class="controls">
                                <input id="userName" placeholder=
                                "아이디를 입력하시오" type="text">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userPass">비밀번호
                            </label>

                            <div class="controls">
                                <input id="userPass" placeholder="비밀번호을 입력하시오"
                                type="password">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "Email">Email</label>

                            <div class="controls">
                                <input id="Email" placeholder=
                                "예시) xxx@xxx.com" type="text">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "Contact">전화번호</label>

                            <div class="controls">
                                <input id="Contact" placeholder=
                                "예시) 010-1111-1111" type="text">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "Address">주소</label>

                            <div class="controls">
                                <input id="Address" placeholder=
                                "주소를 입력하시오" type="text">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                 
                                <button class="btn btn-success" id="signup_btn" 
                                name="signup_btn" type="submit">회원 가입하기
                                </button> 
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
</body>

</html>