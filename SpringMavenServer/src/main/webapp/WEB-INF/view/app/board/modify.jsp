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
	<input type="file" value="파일업로드" id="img" name="img" />
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
</script>
</body>
</html>