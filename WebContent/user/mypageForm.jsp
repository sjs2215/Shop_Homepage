<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.UserBean" %>
    
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
    
    <script > 
	$(window.document).ready(function() {
		
		//수정하기 버튼 클릭 시 특정 컬럼만 수정 가능
		$("#edit").click(function() {
			$("#userPass").attr("readonly", false).attr("disabled", false);
			$("#userEmail").attr("readonly", false).attr("disabled", false);
			$("#userContact").attr("readonly", false).attr("disabled", false);
			$("#userAddress").attr("readonly", false).attr("disabled", false);
			
		});
		
	});
	</script>
    
</head>
<jsp:useBean id="user" class="advisor.UserVO">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
	UserBean USER = UserBean.getInstance(); 
	
	String name = request.getParameter("userName");
	USER.userEdit(name); 
%>

            <div class="span6">
                <div class="area">
                    
                    <form class="form-horizontal" action="/user/registerPro.jsp" method="post">
                        <div class="heading">
                            <h4 class="form-heading">마이페이지</h4>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userType" name="userType">회원 종류: </label>
                            <input name="userName" placeholder=
                                "<%=user.getUserType()%>" type="text" required minlength="4" readonly>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userName" name="userName">아이디: 
                            </label>
                            <input name="userName" placeholder=
                                "<%=user.getUserName()%>" type="text" id="userName" required minlength="4" readonly>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userPass" name="userPass">비밀번호: 
                            </label>
                            <input name="userPass" placeholder="<%=user.getUserPass()  %>"
                                type="password" id="userPass" required minlength="8" readonly>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userEmail" name="userEmail">Email: </label>
                            <input name="userEmail" placeholder=
                                "<%=user.getUserEmail() %>" type="email" id="userEmail" required readonly>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userContact" name="userContact">전화번호: </label>
                            <input name="userContact" placeholder=
                                "<%=user.getUserContact() %>" type="text" id="userContact" required readonly>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userAddress" name="userAddress">주소: </label>
                            <input name="userAddress" placeholder=
                                "<%=user.getUserAddress() %>" type="text" id="userAddress" required readonly>
                        </div>

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