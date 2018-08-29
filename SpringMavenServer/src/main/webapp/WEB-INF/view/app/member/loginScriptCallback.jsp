<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
</head>
<body>
<script type="text/javascript">
	//(1) LoginWithNaverId Javscript 설정 정보 및 초기화 
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "iJniRieB_LTnqFzPCndV",
				callbackUrl: "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/app/login/loginScriptCallback.do",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (2) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (3) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (4) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (4-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/app/login/loginScript.do");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
</script>

<div id="divTxt">

</div>
</body>
</html>