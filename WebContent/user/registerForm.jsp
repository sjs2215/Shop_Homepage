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


            <div class="span6">
                <div class="area">
                    
                    <form id="registerForm" class="form-horizontal" action="/user/registerPro.jsp" method="post" onsubmit="return validationCheck();">
                        <div class="heading">
                            <h4 class="form-heading">회원가입</h4>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userType">회원 종류</label>

                            <div class="controls">
                            <select name="userType">
                            	<option> </option>
                            	<option value = "admin" > 관리자 </option>
                            	<option value = "user"  > 일반 회원 </option>
                            	</select> 
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userName">아이디
                            </label>

                            <div class="controls">
                                <input name="userName" placeholder=
                                "아이디를 입력하시오" type="text" required minlength="4">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="userPass">비밀번호
                            </label>

                            <div class="controls">
                                <input name="userPass" placeholder="비밀번호을 입력하시오"
                                type="password" required minlength="8">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userEmail">Email</label>

                            <div class="controls">
                                <input name="userEmail" placeholder=
                                "예시) xxx@xxx.com" type="email" required>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userContact">전화번호</label>

                            <div class="controls">
                                <input name="userContact" placeholder=
                                "예시) 010-1111-1111" type="text" required>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for=
                            "userAddress">주소</label>

                            <div class="controls">
                                <input name="userAddress" placeholder=
                                "주소를 입력하시오" type="text" required>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                 
                                <button class="btn btn-success" id="submit" 
                                name="submit" type="submit">회원 가입하기
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