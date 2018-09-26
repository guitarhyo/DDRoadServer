<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<p>글 번호 : ${boardVO.getId() }</p>
	<table>
		<tr>
			<td>제목</td>
			<td><span>${boardVO.getTitle()}</span></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="80" name="contents" id="contents" maxlength="2048" readonly>${boardVO.getContents()}</textarea></td>
		</tr>
		<tr>
			<c:if test="${boardVO.getWriter() eq DDROAD_USER.getName()}">
				<td><input type="button" value="수정" name="modify" id="modify" onclick="modify()" /></td>
			</c:if> 
			<td><input type="button" value="뒤로" name="cancel" id="cancel" onclick="location.href='/app/board/boardList.do'" /></td>
		</tr>
	</table>
	
	<!-- 댓글 창 -->
	<jsp:include page="/WEB-INF/view/app/board/reply.jsp"/>
	
	<script>
		function modify(){
			location.href="/app/board/modifyView.do?id="+ ${boardVO.getId()};	
		}		
	</script>
</body>
</html>