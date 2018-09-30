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
			<td><input type="file" value="파일 업로드" id="img" name="img"/></td>
		</tr>
	</table>
</form>
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
		};
		reader.onerror = function(error){
			console.log("Error : " + error);
		}
	}	
</script>
</body>
</html>