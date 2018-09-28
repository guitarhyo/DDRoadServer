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
    .text-second{
    	margin-top: 1em;
    	color: #EAEAEA;
    }
       
    #title,#contents,#modify,#cancel,#check{
    	border-radius: 4px 4px 4px 4px;
    }    
    #modify,#cancel,#check{
    	background-color: #ffffff;
    	font-weight: bold;
    	color:#084B8A;
    }   
    body{
    	background-color: #1d809f
    }
    </style>	
</head>
<body>

<!-- /checkNickName.do -->
 <section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <p style="font-size:x-large; font-weight: bold;" >닉네임 등록</p>
          <input type="hidden" id="userId" name="userId" value="${userId}"/>
          <input type="text" id="nickname" name="nickname" value="" maxlength="25"/>
          <p>
		<div><input type="button" value="확인" id="check" onclick="checkNickName();"/></div>
		 
		 
        </div>
      </div>
    </section>
 </body>

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
  	  

function goPageBoard() {
    	if(loginCheck){
    		  location.href = "/app/board/boardList.do"
    	}else{
    		alert("로그인 하시오");
    	}
}
  </script>
</html>
