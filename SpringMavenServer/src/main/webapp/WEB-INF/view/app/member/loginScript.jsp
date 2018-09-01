<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="format-detection" content="telephone=no"/>
  <title>네이버 로그인</title>
  	<script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
</head>
<body>

<div class="header clearfix">
			<nav>
				<ul class="nav nav-pills pull-right">
					<li role="presentation" class="active"><a href="javascript:goPageBoard();">댕댕ROAD 게시판 가기</a></li>
					<li role="presentation"><a id="gnbLogin" href="#">Login</a></li>
				</ul>
			</nav>
</div>

<!-- (1) 버튼 event 처리를 위하여 id를 지정 id=loginButton -->
<div id="naverIdLogin"><a id="naverIdLogin_loginButton" href="#" role="button"><img src="/resources/images/big_g.PNG" width=320></a></div>

  <script type="text/javascript">
	var loginCheck = false;
	
	/* (2) LoginWithNaverId Javscript 설정 정보 및 초기화 */
	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "xiHvXJarMFipg36pfAtS",
				callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/app/login/loginScriptCallback.do",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 60}
			}
		);
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* (3-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

		/* (4) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				loginCheck = status;
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					setLoginStatus();
					
					var id = naverLogin.user.getId();
					var email = naverLogin.user.getEmail();
					var nickname = naverLogin.user.getNickName();
					var gender = naverLogin.user.getGender();
					var age = naverLogin.user.getAge();
					
// 					var data = JSON.stringify({id:id,email:email,nickname:nickname,gender:gender,age:age});
					
					$.ajax({
						type : 'POST',
						url : '/app/login/join.do',
// 						dataType : 'json',
						data : {
							'id' : id,
							'email' : email,
							'nickname' : nickname,
							'gender' : gender,
							'age' : age
						},
						success : function(result){
							console.log("success");
						},
						error : function(){
							alert("failed");
						}
					})
					
				}
			});
		});

		/* (5) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			var profileImage = naverLogin.user.getProfileImage();
			var nickName = naverLogin.user.getNickName();
			$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
			$("#gnbLogin").html("Logout");
			$("#gnbLogin").attr("href", "#");
			/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
			$("#gnbLogin").click(function () {
				naverLogin.logout();
				location.reload();
			});
		}
  	 
    function goPageBoard() {
    	if(loginCheck){
    		  location.href = "/boardList.do"
    	}else{
    		alert("로그인 하시오");
    	}
    }
  </script>
</html>
