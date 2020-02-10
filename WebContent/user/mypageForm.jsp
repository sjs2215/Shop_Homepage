<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>헛개농장 - 마이페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <style type="text/css">
        
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>


            <div class="span6">
                <div class="area">
                    
                    <form class="form-horizontal" action="/user/registerPro.jsp" method="post">
                        <div class="heading">
                            <h4 class="form-heading">마이페이지</h4>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userType">회원 종류</label>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userName">아이디
                            </label>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userPass">비밀번호
                            </label>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userEmail">Email</label>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userContact">전화번호</label>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userAddress">주소</label>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                 
                                <button class="btn btn-success" id="edit" 
                                name="edit" type="submit">수정하기
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