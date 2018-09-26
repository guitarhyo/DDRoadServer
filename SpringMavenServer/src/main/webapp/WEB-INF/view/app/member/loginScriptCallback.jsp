<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="/resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
</head>
<body>
<script type="text/javascript"> 	
	var serviceUrl = "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port);
	var callbackUrl =  serviceUrl + "/app/login/loginScriptCallback.do";	
	
// 	var naver_id_login = new naver_id_login("iJniRieB_LTnqFzPCndV", callbackUrl);
	var naver_id_login = new naver_id_login("L7QDEVn9rcIZDT6A4dfM", callbackUrl);
	
  // 접근 토큰 값
  var userAccessToken = naver_id_login.oauthParams.access_token;
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	 // console.log(naver_id_login);	  
	 // console.log(userAccessToken);
	 // console.log(naver_id_login.getProfileData('id'));
	 // console.log(naver_id_login.getProfileData('email'));
	 // console.log(naver_id_login.getProfileData('nickname'));
	 // console.log(naver_id_login.getProfileData('gender'));
	 // console.log(naver_id_login.getProfileData('age'));
	 // console.log(naver_id_login.getProfileData('birthday'));
	 // console.log(naver_id_login.getProfileData('name'));
	 // console.log(naver_id_login.getProfileData('profile_image'));
	 
		var id = naver_id_login.getProfileData('id');
		var email = naver_id_login.getProfileData('email');
		var nickname = naver_id_login.getProfileData('nickname');
		var name = naver_id_login.getProfileData('name');
		var accesstoken = userAccessToken;
		$.ajax({
		type : 'POST',
		url : '/app/login/join.do',
			data : {
				'id' : id,
				'email' : email,
				'nickname' : nickname,
				'name' : name,
				'accesstoken' : accesstoken
			},
			success : function(result){
				location.replace("/app/board/boardList.do");
			},
			error : function(){
				alert("로그인 실패 서버확인");
			}
		});

  }	
</script>

<div id="divTxt">

</div>
</body>
</html>