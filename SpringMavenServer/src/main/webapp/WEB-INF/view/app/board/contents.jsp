<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
    
    .text-second{
    	margin-top: 1em;
    	color: #EAEAEA;
    }
    
    
    #title,#contents,#modify,#cancel{
    	border-radius: 4px 4px 4px 4px;
    }
    
    #modify,#cancel{
    	background-color: #ffffff;
    	font-weight: bold;
    	color:#084B8A;
    }
    
    body{
    	background-color: #1d809f
    	
    }
    
    </style>	
<title>Insert title here</title>
</head>
<body>
    <!-- Services -->
     <section class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <p style="font-size:x-large; font-weight: bold;" >${boardVO.getTitle()}</p>
          <h3 class="text-second">by-${boardVO.getNickname()}</h3>
          <textarea cols="40" name="contents" id="contents" maxlength="2048" style="height: 300px;resize: none;" readonly>${boardVO.getContents()}</textarea>
          <p class="text-faded mb-0" style="margin-top: 1em;margin-bottom: 2em;">${boardVO.getRegdt()}</p>

		  <tr>
			<c:if test="${boardVO.getWriter() eq DDROAD_USER.getName()}">
				<td><input type="button" value="수정" name="modify" id="modify" onclick="modify(${boardVO.getId()})" /></td>
			</c:if> 
			<td><input type="button" value="뒤로" name="cancel" id="cancel" onclick="location.href='/app/board/boardList.do'" /></td>
		  </tr>
        </div>
      </div>
    </section>
	<script>
		function modify(id){
			location.href="/app/board/modifyView.do?id="+id;	
		}		
	</script>
</body>
</html>