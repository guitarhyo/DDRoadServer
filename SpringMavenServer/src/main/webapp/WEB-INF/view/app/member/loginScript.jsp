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
	
	<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/stylish-portfolio.min.css" rel="stylesheet">
    
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/resources/js/stylish-portfolio.min.js"></script>	
    
    <style>
    	body{
    		overflow-y: hidden; overflow-x: hidden;
    	}
    </style>
</head>
<body>

<!-- <div>이미지<input type="file" id="imgPath" name="imgPath" value=""  /></div> -->
<!-- <div id="boardImg"></div> -->


    <section class="callout">
      <div class="container text-center">
        <h2 class="mx-auto mb-5" style="color:#ffffff">자유게시판</h2>
        <h5 style="color:#002266">이용을 위해 로그인을 해주세요</h5>
        <div id="naver_id_login" style="margin-top: 1em">
			<a id="naverIdLogin_loginButton" href="#" role="button">
			<img src="/resources/images/big_g.PNG" width=320>
      </div>
    </section>

<script type="text/javascript">

$(document).ready(function() {
	$("#imgPath").change(function(e) {
		
		var reader = new FileReader();
	    reader.onload = function(){
		       var tempImage = new Image();
		       tempImage.src = reader.result;
               $("#boardImg").append(tempImage);
         
	    };
	    reader.readAsDataURL(e.target.files[0]);
		
	    //썸네일용
// 		var reader = new FileReader();
// 		   reader.readAsDataURL(e.target.files[0]);
		 
// 		   reader.onload = function  () {
// 		       var tempImage = new Image();
// 		       tempImage.src = reader.result;
// 		       tempImage.onload = function () {
// 		            var canvas = document.createElement('canvas');
// 		            var canvasContext = canvas.getContext("2d");
		 
// 		            canvas.width = 100; 
// 		            canvas.height = 100;
		 
// 		            canvasContext.drawImage(this, 0, 0, 100, 100);
		 
// 		            var dataURI = canvas.toDataURL("image/jpeg");
		 
// 		            var imgTag = "<img id='PREVIEW_IMG' style='width: 35%;' src='"+dataURI+"'/>";
// 		            $("#boardImg").append(imgTag);
// 		        };
// 		    };

	});
});



	  	// LoginWithNaverId Javscript 설정 정보 및 초기화
	  	var serviceUrl = "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port);
	  	var callbackUrl =  serviceUrl + "/app/login/loginScriptCallback.do";

		//var naver_id_login = new naver_id_login("iJniRieB_LTnqFzPCndV", callbackUrl);
		var naver_id_login = new naver_id_login("L7QDEVn9rcIZDT6A4dfM", callbackUrl);
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
