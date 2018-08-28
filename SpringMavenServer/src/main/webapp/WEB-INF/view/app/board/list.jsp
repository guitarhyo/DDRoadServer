<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8" /> 
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no"/>
<title>Insert title here</title>
</head>
<body>
<%=request.getAttribute("testdata") %>

<table border="1">
<tr>
<th>제목</th><th>내용</th><th>등록일</th><th>등록아이디</th></tr>
<c:forEach items="${list }" var="list">
	<tr><td>${list.title }</td><td>${list.contents }</td><td>${list.regdt }</td><td>${list.regid }</td></tr>
</c:forEach>
</table>
</body>
</html>