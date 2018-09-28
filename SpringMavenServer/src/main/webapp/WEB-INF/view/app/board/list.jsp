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
    #write{
    	text-align: right;
    	color:#002266;
    	margin-bottom: 0.2em
    }
    </style>
<script type="text/javascript">
	function deleteConfirm(id){
		console.log(id);
		if(confirm("삭제하시겠습니까?")){
			location.href="/app/board/delete.do?id="+id;
		}else{
			return false;
		}
	}
</script>
</head>
<body id="page-top">
 <div class="container">
        <div class="content-section-heading text-center" style="margin-top: 3em">
          <h3 class="text-secondary mb-0">bulletin board</h3>
          <h2 class="mb-5" style="margin-top: 0.3em">자유게시판</h2>
          
        </div>
       
        <div class="clearfix">
         <a href="/app/board/write.do" id="write" class="btn btn-primary float-right"><strong>글쓰기</strong></a>
        </div>
        
        <div class="row no-gutters">
        <c:set value="0" var="imgNum"></c:set>
           <c:forEach items="${list }" var="list">
           <c:set value="${imgNum+1 }" var="imgNum"></c:set>
           <c:if test="${imgNum eq 5}"><c:set value="1" var="imgNum"></c:set></c:if>
          <div class="col-lg-6">
          <c:if test="${list.writer eq DDROAD_USER.getName()}" >
					<a href="javascript:deleteConfirm(${list.id});" class="btn btn-primary" style="margin-bottom: 2px;"><strong>삭제</strong></a>
			</c:if>
            <a class="portfolio-item" href="/app/board/lookupContents.do?id=${list.id}">
              <span class="caption">
                <span class="caption-content">
                  <h2>by:${list.nickname }</h2>
                  <p class="mb-0">${list.title }</p>
                 	
                </span>
              </span>
              <img class="img-fluid" src="/resources/img/portfolio-${imgNum}.jpg" alt="">
            </a>
            
          </div>
          </c:forEach>
        </div>
    </div>


<table border="1" style="display: none;">
<c:forEach items="${userList}" var="list2">
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