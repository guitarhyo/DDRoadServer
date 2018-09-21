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
// 사용할 앱의 JavaScript 키를 설정해 주세요.
//  Kakao.init('6b88578ce2c3d0a98804ff9066fe65a7');
 
// function boardLogout() {
	
// 	Kakao.Auth.logout(function(data) {
// 		alert(data);
// 		Kakao.cleanup();
// 	});
// }
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


    <!-- Portfolio -->
        <div class="container">
        <div class="content-section-heading text-center" style="margin-top: 3em">
          <h3 class="text-secondary mb-0">bulletin board</h3>
          <h2 class="mb-5" style="margin-top: 0.3em">자유게시판</h2>
        </div>
        <a href="/app/board/write.do" id="write"><strong>글쓰기</strong></a>
        <div class="row no-gutters">
           <c:forEach items="${list }" var="list">
          <div class="col-lg-6">
            <a class="portfolio-item" href="/app/board/lookupContents.do?id=${list.id}">
              <span class="caption">
                <span class="caption-content">
                  <h2>by:${list.nickname }</h2>
                  <p class="mb-0">${list.title }</p>
                </span>
              </span>
              <img class="img-fluid" src="/resources/img/portfolio-1.jpg" alt="">
            </a>
          </div>
          </c:forEach>
        </div>
    </div>



</body>
</html>