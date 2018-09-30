<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>글 수정</title>
</head>
<body>
<div class="formWrapper">
<form action="/app/board/modify.do" id="modifyForm" class="modifyForm" method="POST">
	<input type="hidden" id="imgBase64" name="imgBase64" value=""/>
	<input type="hidden" id="id" name="id" value="${boardVO.getId() }" />
	
	 <section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <h3 class="text-second">제목</h3>
          <input type="text" name="title" id="title" maxlength="30" value="${boardVO.getTitle()}"/>
        
          <div class="row align-items-center">
          <div class="col-lg-6">
            <div class="p-5" align="center">
            
					<img class="img-fluid" id="preview"  style="display:block; "src="${boardVO.getImgBase64() }"  onerror="this.style.display='none'" alt="삽입 이미지" />
				</div>
			</div>
			</div>
			
            <h3 class="text-second" style="margin-top: 2em">내용</h3>
          
          <textarea cols="40" name="contents" id="contents" maxlength="300" style="resize: none;height: 300px;">${boardVO.getContents()}</textarea>
          <p class="text-faded mb-0" style="margin-top: 1em">알림) 특정 이모티콘은 필터링 되어 저장됩니다.</p>
          <div id="currentTextLength" style="margin-bottom: 1em">###</div>
          
          <div>
          <a href="javascript:boardSave();" id=submit class="btn">수정</a>
           <a href="javascript:history.back()"  id="cancel" class="btn">취소</a>
			<div><input type="file" value="파일 업로드" id="img" name="img"/></div>
		  </div>
		 
        </div>
      </div>
    </section>
</form>
</div>
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
// 	$("#modify").click(function(){
// 		$("#contents").val($("#pastContents").text());
// 	})
	
	$("#img").change(function(){
		var files = $("#img")[0].files;
		if(files.length>0){
			imageToString(files[0]);
		}
	})
	
	function imageToString(file){
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(){
			$("#imgBase64").val(reader.result);
			$("#preview").attr("src",reader.result);
		};
		reader.onerror = function(error){
			console.log("Error : " + error);
		}
	}	
	
	function boardSave(){
		
		var title = $("#title").val();
		var contents = $("#contents").val();
		
		if(title == null || title =="" || contents == null || contents ==""){
			alert("제목 또는 내용을 입력하세요.");
		}else{
			$("#modifyForm").submit();
		}
		
		
	}
</script>
</body>
</html>