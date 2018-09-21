<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
    }
    
    
    #title,#contents,#submit,#cancel{
    	border-radius: 4px 4px 4px 4px;
    }
    
    #submit,#cancel{
    	background-color: #ffffff;
    	font-weight: bold;
    	color:#084B8A;
    }
    
    body{
    	background-color: #1d809f
    	
    }
    
    </style>	
<title>글작성</title>

</head>
<body>
<!-- 폼전송은 post로 보내주셈 get방식은 길이제한 및 인코딩 문제-->
<form action="/app/board/writeOK.do" id="writeForm" method="post">
	<input type="hidden" name="writer" id="writer" value="${DDROAD_USER.getName()}" />
	<input type="hidden" name="nickname" id="nickname" value="${DDROAD_USER.getNickname()}"/>
    <!-- Services -->
    <section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <h3 class="text-second">제목</h3>
          <input type="text" name="title" id="title" maxlength="30"/>
          <h3 class="text-second" style="margin-top: 2em">내용</h3>
          <textarea cols="40" name="contents" id="contents" maxlength="300" style="resize: none"></textarea>
          <p class="text-faded mb-0" style="margin-top: 1em">알림) 특정 이모티콘은 필터링 되어 저장됩니다.</p>
          <div id="currentTextLength" style="margin-bottom: 1em">###</div>
          <tr>
			<td><input type="submit" value="등록" name="submit" id="submit" /></td>
			<td><input type="button" value="취소" name="cancel" id="cancel" onclick="history.back()" /></td>
		  </tr>
        </div>
      </div>
    </section>
</form>
<script type="text/javascript">
	$(function(){
		 $('#contents').keyup(function (e){
	          var content = $(this).val();
			 console.log(content.length);
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#currentTextLength').html(content.length + '/300');
	      });
	      $('#contents').keyup();
	})
</script>
</body>
</html>