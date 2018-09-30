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
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" maxlength="30"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="80" name="contents" id="contents" maxlength="300"></textarea></td>
		</tr>
		<tr><td></td>
		<td>
			<span style="font-size: 0.9em;color:#bbbbbb;float:left;">알림) 몇몇 이모티콘은 필터링 되어 저장됩니다.</span>
			<span id="currentTextLength">###</span>
		</td>
		</tr>
		<tr>
			<td><input type="submit" value="등록" name="submit" id="submit" /></td>
			<td><input type="button" value="취소" name="cancel" id="cancel" onclick="history.back()" /></td>
			<td><input type="file" value="파일 업로드" id="getfile" name="img"/></td>
		</tr>
	</table>
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
	            $("#resize").attr("src",dataURI);
	            $("#imgBase64").val(dataURI);
	        };
	    }; 
	})
</script>
</body>
</html>