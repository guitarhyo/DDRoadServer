<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>수정</title>
</head>
<body>
<form action="/app/board/modify.do" id="writeForm" method="post">
	<input type="hidden" name="id" value="${boardVO.getId()}" />
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" maxlength="30" value="${boardVO.getTitle()}"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="80" name="contents" id="contents" maxlength="300">${boardVO.getContents()}</textarea></td>
		</tr>
		<tr><td></td>
		<td>
			<span style="font-size: 0.9em;color:#bbbbbb;float:left;">알림) 몇몇 이모티콘은 필터링 되어 저장됩니다.</span>
			<span id="currentTextLength">###</span>
		</td>
		</tr>
		<tr>
			<td><input type="submit" value="완료" name="submit" id="submit" /></td>
			<td><input type="button" value="취소" name="cancel" id="cancel" onclick="history.back()" /></td>
		</tr>
	</table>
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