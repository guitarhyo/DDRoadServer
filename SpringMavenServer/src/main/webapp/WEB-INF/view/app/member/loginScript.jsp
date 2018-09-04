<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="format-detection" content="telephone=no"/>
  <title>네이버 로그인</title>
  	<script type="text/javascript" src="/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="/resources/js/kakao.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
</head>
<body>

<!-- 버튼 event 처리를 위하여 id를 지정 id=loginButton -->
<div id="naver_id_login">
<a id="naverIdLogin_loginButton" href="#" role="button">
<img src="/resources/images/big_g.PNG" width=320>
</a>
</div>
<div><a id="kakao-login-btn"></a>
<!-- <a href="http://developers.kakao.com/logout"></a> -->
</div>

<script type="text/javascript">

	  	// LoginWithNaverId Javscript 설정 정보 및 초기화
	  	var serviceUrl = "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port);
	  	var callbackUrl =  serviceUrl + "/app/login/loginScriptCallback.do";

		var naver_id_login = new naver_id_login("iJniRieB_LTnqFzPCndV", callbackUrl);
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,48);
	  	naver_id_login.setDomain(serviceUrl);
	  	naver_id_login.setState(state);
//	   	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
		  

 			 // 사용할 앱의 JavaScript 키를 설정해 주세요.
 		    Kakao.init('6b88578ce2c3d0a98804ff9066fe65a7');
 		    // 카카오 로그인 버튼을 생성합니다.
 		    Kakao.Auth.createLoginButton({
 		      container: '#kakao-login-btn',
 		      success: function(authObj) {
 		    	  console.log(JSON.stringify(authObj));
 		        //var kakaoObj = JSON.stringify(authObj);
 		        var	id = authObj.expires_in;
 		        var accesstoken = authObj.access_token;
 				$.ajax({
 				type : 'POST',
 				url : '/app/login/join.do',
 					data : {
 						'id' : "KA"+id,
 						'accesstoken' : accesstoken
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
	  
	
	
function goPageBoard() {
    	if(loginCheck){
    		  location.href = "/app/board/boardList.do"
    	}else{
    		alert("로그인 하시오");
    	}
}





  </script>
</html>