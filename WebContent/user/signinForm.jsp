<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개농장 - 로그인 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <style type="text/css">
        
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="span12">
            <div class="span6">
                <div class="area">
                    <form class="form-horizontal" action="/user/signinPro.jsp" method="post">
                        <div class="heading">
                            <h4 class="form-heading">Sign In</h4>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userName">아이디
                            </label>

                            <div class="controls">
                                <input name="userName" placeholder=
                                "아이디를 입력하시오" type="text">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userPass">비밀번호
                            </label>

                            <div class="controls">
                                <input name="userPass" placeholder="비밀번호을 입력하시오"
                                type="password">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                
                                <button class="btn btn-success" type=
                                "submit">로그인</button> <button class="btn"
                                type="button">로그아웃</button>
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
