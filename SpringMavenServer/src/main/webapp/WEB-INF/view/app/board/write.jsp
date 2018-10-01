<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
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
<style>
	img{
		display:none;
	}
</style>
</head>
<body>
<!-- 폼전송은 post로 보내주셈 get방식은 길이제한 및 인코딩 문제-->
<form action="/app/board/writeOK.do" id="writeForm" method="post">
	<input type="hidden" name="writer" id="writer" value="${DDROAD_USER.getName()}" />
	<input type="hidden" name="nickname" id="nickname" value="${DDROAD_USER.getNickname()}"/>
	<input type="hidden" name="imgBase64" id="imgBase64" value=""/>
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
          
          <div>
          <a href="javascript:boardSave();" id=submit class="btn">등록</a>
           <a href="javascript:history.back()"  id="cancel" class="btn">취소</a>
			<div><input type="file" value="파일 업로드" id="getfile" name="img"/></div>
		  </div>
        </div>
      </div>
    </section>
</form>
<img src="" id="preview" alt="preview" />
<img src="" id="resize" alt="resize" />
<script type="text/javascript">
	var result;
	
	$(function(){
		 $('#contents').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#currentTextLength').html(content.length + '/300');
	      });
	      $('#contents').keyup();
	});
	
	function boardSave(){
		
		var title = $("#title").val();
		var contents = $("#contents").val();
		
		if(title == null || title =="" || contents == null || contents ==""){
			alert("제목 또는 내용을 입력하세요.");
		}else{
			$("#writeForm").submit();
		}	
	}

	//이미지 리사이징
	$("#getfile").change(function(){
		var fileList = this.files ;
		    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);

	    //로드 한 후
	    reader.onload = function  () {
	        //로컬 이미지를 보여주기
	        document.querySelector('#preview').src = reader.result;
	        
	        //썸네일 이미지 생성
	        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
	        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
	        tempImage.onload = function() {
	            //리사이즈를 위해 캔버스 객체 생성
	            var canvas = document.createElement('canvas');
	            var canvasContext = canvas.getContext("2d");
	            canvasContext.drawImage(tempImage,0,0);
	            
	            var MAX_WIDTH = 330;
	            var MAX_HEIGHT = 330;
	            var width = tempImage.width;
	            var height = tempImage.height;
	            
	          	if (width > height) {
	              if (width > MAX_WIDTH) {
	                height *= MAX_WIDTH / width;
	                width = MAX_WIDTH;
	              }
	            } else {
	              if (height > MAX_HEIGHT) {
	                width *= MAX_HEIGHT / height;
	                height = MAX_HEIGHT;
	              }
	            }
	            
	            //캔버스 크기 설정
	            canvas.width = width; 
	            canvas.height = height;
	            
	            //이미지를 캔버스에 그리기
	            canvasContext.drawImage(this, 0, 0, width, height);
	            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
	            var dataURI = canvas.toDataURL("image/jpeg");
	            
	            //미리보기
	            $("#resize").attr("src",dataURI);
	            $("#imgBase64").val(dataURI);
	        };
	    }; 
	})

	
</script>
</body>
</html>