<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="/resources/js/kakao.min.js"></script>

<script type="text/javascript">
// 사용할 앱의 JavaScript 키를 설정해 주세요.
//  Kakao.init('6b88578ce2c3d0a98804ff9066fe65a7');
 
// function boardLogout() {
	
// 	Kakao.Auth.logout(function(data) {
// 		alert(data);
// 		Kakao.cleanup();
// 	});
// }
	
</script>
</head>
<body>
<table border="1">
<tr>
	<th>제목</th>
	<th>내용</th>
	<th>등록일</th>
	<th>등록아이디</th>
</tr>
<c:forEach items="${list }" var="list">
	<tr>
		<td>${list.title }</td>
		<td>${list.contents }</td>
		<td>${list.nickname }</td>
		<td>${list.writer }</td>
	</tr>
</c:forEach>
</table>
<button onclick="location.href='/app/board/write.do'">글 쓰기</button>
<!-- <button onclick="boardLogout();">카카오 로그아웃</button> -->
<p>유저 리스트</p>
<table border="1">
<c:forEach items="${userList }" var="list2">
	<tr>
		<td>${list2.id }</td>
		<td>${list2.name }</td>
		<td>${list2.email }</td>
		<td>${list2.nickname }</td>
		<td>${list2.accesstoken }</td>
	</tr>
</c:forEach>
</table>

</body>
</html>