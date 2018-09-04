<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="format-detection" content="telephone=no"/>
  <title>네이버 로그인</title>
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
</head>
<body>

<!-- /checkNickName.do -->
<ul>
<li>닉네임이 없어요!! 게시판에 사용 할 닉네임을 입력 해주세요. <input type="hidden" id="userId" name="userId" value="${userId}"/></li>
<li>닉네임 : <input type="text" id="nickname" name="nickname" value="" maxlength="25"/></li>
<li><input type="button"  value="확인" onclick="checkNickName();"/></li>
</ul>


<script type="text/javascript">
	var loginCheck = false;

	$(document).ready(function() {

	});	
  	
    

function checkNickName() {
	var nickname =  $("#nickname").val();
	var userId =  $("#userId").val();
	
	if(nickname == null || nickname.trim() == ""){
		alert("닉네임을 입력 해주세요.");
	}else{
		$.ajax({
			type : 'POST',
			url : '/app/login/checkNickName.do',
				data : {
					'nickname' : nickname, 'id' :userId
				},
				success : function(result){
					if("F" == result){
						alert("중복된 닉네임이 있습니다.");
					}else if("S"){
						location.replace("/app/board/boardList.do");
					}else{
						location.replace("/app/login/loginScript.do");
					}
				},
				error : function(){
					alert("로그인 실패 서버확인");
				}
			});
	}	  
}
  	  
function kakaoInit() {
 			 // 사용할 앱의 JavaScript 키를 설정해 주세요.
 		    Kakao.init('6b88578ce2c3d0a98804ff9066fe65a7');
 		    // 카카오 로그인 버튼을 생성합니다.
 		    Kakao.Auth.createLoginButton({
 		      container: '#kakao-login-btn',
 		      success: function(authObj) {
 		    	  console.log(JSON.stringify(authObj));
 		        //var kakaoObj = JSON.stringify(authObj);
 		        var	id = authObj.expires_in;
 		        var accessToken = authObj.access_token;
 				$.ajax({
 				type : 'POST',
 				url : '/app/login/join.do',
 					data : {
 						'id' : "KA"+id,
 						'accessToken' : accessToken
 					},
 					success : function(result){
 						location.replace("/app/board/boardList.do");
 					},
 					error : function(){
 						alert("로그인 실패 서버확인");
 					}
 				});
 		      },
 		      fail: function(err) {
 		         alert(JSON.stringify(err));
 		      }
 		    });
	  
  }
	
	
function goPageBoard() {
    	if(loginCheck){
    		  location.href = "/app/board/boardList.do"
    	}else{
    		alert("로그인 하시오");
    	}
}
  </script>
</html>
