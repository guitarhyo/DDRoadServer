<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("iJniRieB_LTnqFzPCndV", "http://localhost:8080/app/login/loginScriptCallback.do");
  // 접근 토큰 값 출력
  console.log(naver_id_login.oauthParams.access_token);
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
		<td>${list.regdt }</td>
		<td>${list.writer }</td>
	</tr>
</c:forEach>
</table>
<button onclick="location.href='/app/board/write.do'">글 쓰기</button>

<p>유저 리스트</p>
<table border="1">
<c:forEach items="${userList }" var="list2">
	<tr>
		<td>${list2.id }</td>
		<td>${list2.name }</td>
		<td>${list2.email }</td>
		<td>${list2.nickname }</td>
		<td>${list2.gender }</td>
		<td>${list2.age }</td>
	</tr>
</c:forEach>
</table>

</body>
</html>