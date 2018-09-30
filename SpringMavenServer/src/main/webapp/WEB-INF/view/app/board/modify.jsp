<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
	body,html,input,td, textarea {padding: 0;margin: 0;}
	.formWrapper{position:absolute;width:95%;height:550px;margin: auto;top: 50%;left: 50%;transform:translate(-50%,-50%)}
	.modifyForm{width:100%;height:100%;}
	.modifyForm input[type="text"] {width:100%;height:40px;font-size: 1.2em;border:.5px solid black;box-sizing: border-box;padding:0 10px;}
	.modifyForm input[type="file"] {margin: 5px;}
	.modifyForm textarea{display:block;font-size: 1.5em;width:95%;border:0;padding:5px;box-sizing: border-box;margin: auto;}
	
	.contentWrapper{margin-top:10px;border:.5px solid black;}
	.contentWrapper img{margin:10px}
</style>
<title>글 수정</title>
</head>
<body>
<div class="formWrapper">
<form action="/app/board/modify.do" id="modifyForm" class="modifyForm" method="POST">
	<input type="hidden" id="imgBase64" name="imgBase64" value=""/>
	<input type="hidden" id="id" name="id" value="${boardVO.getId() }" />
	
	
	<input type="text" name="title" id="title" maxlength="30" value="${boardVO.getTitle() }"/>
	<input type="file" value="파일업로드" id="getfile" name="img" />
	<div class="contentWrapper">
		<img src="${boardVO.getImgBase64() }" id="preview" style="display:block" alt="업로드 된 사진" />
		<textarea name="contents" class="contentTextArea" id="contents" rows="15" style="resize:none">${boardVO.getContents() }</textarea>
	</div>
	<input type="submit" value="완료"/>
	<input type="button" value="취소" onclick="history.back()"/>
</form>
</div>
<script type="text/javascript">
	var result;

	$("#modify").click(function(){
		$("#contents").val($("#pastContents").text());
	})
	
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
	            $("#preview").attr("src",dataURI);
	            $("#imgBase64").val(dataURI);
	        };
	    }; 
	})
</script>
</body>
</html>