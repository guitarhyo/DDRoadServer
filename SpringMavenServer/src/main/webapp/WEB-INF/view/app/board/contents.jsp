<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
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
    .resume-item{
    	background-color: #ffffff;
    	border-radius: 4px 4px 4px 4px;
    	padding-left: 5px;
    }
    </style>	
<title>Insert title here</title>

<script>
	function modify(){
		location.href="/app/board/modifyView.do?id="+ ${boardVO.getId()};	
	}		
</script>
</head>
<body>
    <!-- Services -->
     <section  style="padding-bottom: 0;" class="content-section bg-primary text-white text-center" id="services">
      <div class="container">
        <div class="content-section-heading">
          <p style="font-size:x-large; font-weight: bold;" >${boardVO.getTitle()}</p>
          <h3 class="text-second">by-${boardVO.getNickname()}</h3>
          <c:if test=""></c:if>
          <div class="row align-items-center">
          <div class="col-lg-6">
            <div class="p-5" align="center">
					<img class="img-fluid"  style="display:block; "src="${boardVO.getImgBase64() }" alt="삽입 이미지" />
				</div>
			</div>
			</div>
			
          <textarea cols="40" name="contents" id="contents" maxlength="2048" style="height: 300px;resize: none;" readonly>${boardVO.getContents()}</textarea>
          <p class="text-faded mb-0" style="margin-top: 1em;margin-bottom: 2em;">${boardVO.getRegdt()}</p>

		  	<div>
			<c:if test="${boardVO.getWriter() eq DDROAD_USER.getName()}">
			<a href="javascript:modify();" name="modify" id="modify" class="btn">수정</a>
<!-- 				<input type="button" value="수정" name="modify" id="modify" onclick="modify()" /> -->
			</c:if> 
<!-- 			<input type="button" value="뒤로" name="cancel" id="cancel" onclick="location.href='/app/board/boardList.do'" /> -->
		  <a href="/app/board/boardList.do" name="cancel" id="cancel" class="btn">뒤로</a>
		  </div>
        </div>
      </div>
       <nav class="navbar navbar-light bg-light static-top" style="margin-top: 10px;">
		      <div class="container">
		      <a class="navbar-brand" href="#">댓글 ></a>
		      </div>
		</nav>
    </section>
    
      <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="education">
	       	 
		       <div class="input-group input-group-newsletter" style="margin-top: 5px; margin-left: 5px;">
		                <textarea id="replyContents"  class="form-control" placeholder="댓글을 남겨보세요." rows="3" cols="30"></textarea>
		                <div class="input-group-append" style="margin-right: 10px;">
		                  <button class="btn btn-secondary" id="replyFormBtn" type="button">등록</button>
		                </div>
		       </div>
		       <p>
	       <div class="my-auto" id="replyTable">
	       
	       <c:choose>
				<c:when test="${replyList eq null}">
			<div id="no" class="resume-item d-flex flex-column flex-md-row mb-5" >
	            <div class="resume-content mr-auto">
	              <div class="subheading mb-3">등록된 댓글이 없습니다.</div>
	            </div>
	         </div>
				</c:when>
				<c:otherwise>  
					<c:forEach var="replyList" items="${replyList }">
						<div id="replyInnerWrapper_${replyList.getR_id()}" class="resume-item d-flex flex-column flex-md-row mb-2">
				            <div class="resume-content mr-auto">
				            <div id="replyContentsWrapper_${replyList.getR_id()}">
				              <p id="contents_${replyList.getR_id()}" >${replyList.getContents() }</p>
				            </div>
				              <div class="subheading">by-${replyList.getNickname() }</div>
				            </div>
				            <div class="resume-date text-md-right">
				              <span class="text-primary">${replyList.getStrRegDate() }</span>
				            </div>
				           
				           <c:if test="${DDROAD_USER.getId() eq replyList.getRegid()}">
				           <div id="replyManagement_${replyList.getR_id()}_1" class="mb-2">
				           <a href="javascript:deleteReply(${replyList.getR_id()});" class="btn btn-secondary">삭제</a>
				           <a href="javascript:modifyReply(${replyList.getR_id()});" class="btn btn-secondary">수정</a>
				           </div>
							
							<div id="replyManagement_${replyList.getR_id()}_2" class="mb-2" style="display:none">
				           <a href="javascript:cancelModify(${replyList.getR_id()});" class="btn btn-secondary">취소</a>
				           <a href="javascript:completeModify(${replyList.getR_id()});" class="btn btn-secondary">수정</a>
				           </div>
				           </c:if>
				         </div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
	        
	         
	       </div>
	       </section>

	
	
	
	<!-- 댓글 창 -->
<!-- 	<JSP:INCLUDE PAGE="/WEB-INF/VIEW/APP/BOARD/REPLY.JSP"/> -->
	
<script>
	var tmpNoReplyNoti;
	var contents = ""; 
	var detachedContent;
	
	$("#replyFormBtn").click(function(){
		var inputContents = $("#replyContents").val().trim(); 
		if(inputContents==""){
			alert("내용을 입력하세요");
			return false;
		}
		
		if($("#replyTable tbody").children().length == 0){
			$("#no").detach();
		}
		
		$.ajax({
			url:"/app/board/regitReply.do",
			type:'POST',
			data:{
				'b_id':'${boardVO.getId() }',
				'regId':'${DDROAD_USER.getId()}',
				'nickname':'${DDROAD_USER.getNickname()}',
				'contents':$("#replyContents").val()
			},
			success:function(lastReplyNum){
				if(lastReplyNum=='failed'){
					alert('댓글 등록에 실패 하였습니다.');
				}else{
					console.log(lastReplyNum);
					addReplyToTable(inputContents, lastReplyNum);
					$("#replyContents").val("");
				}
			},
			error:function(){
				alert("서버 오류");
			}
		})
	})
	
	function addReplyToTable(inputContents,lastRepyNum){
		var html = "";
		html += '<tr class="replyInnerWrapper" id="replyInnerWrapper_' + lastRepyNum + '">';
		html += '<td>';
		html += '<div class="replyInfoWrapper">';
		html += '<p class="replyRegitInfo">';
		html += '${DDROAD_USER.getNickname() }&nbsp;&nbsp; ' + getFormatDate(new Date());
		html += '</p>';
		html += '<ul class="replyManagement" id="replyManagement_' + lastRepyNum + '_1">';
		html += '<li><p onclick="deleteReply(' + lastRepyNum + ')">삭제</p></li>';
		html += '<li><p onclick="modifyReply(' + lastRepyNum + ')">수정</p></li>';
		html += '</ul>';
		html += '<ul class="replyManagement" id="replyManagement_' + lastRepyNum + '_2" style="display:none">';
		html += '<li><p onclick="cancelModify(' + lastRepyNum + ')">취소</p></li>';
		html += '<li><p onclick="completeModify(' + lastRepyNum + ')">수정</p></li>';
		html += '</ul>';
		html += '</div>';
		html += '<div class="replyContentsWrapper" id="replyContentsWrapper_' + lastRepyNum + '">';
		html += '<span id="contents_' + lastRepyNum + '">' + inputContents + '</span>';
		html += '</div>';
		html += '</td>';
		html += '</tr>';
		$("#replyTable").append(html);
	}
	
	function getFormatDate(date){
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		var hh = date.getHours();
		hh = hh >= 10 ? hh :'0' + hh;
		var mm = date.getMinutes();
		mm = mm >= 10 ? mm :'0' + mm;
		var ss = date.getSeconds();
		ss = ss >= 10 ? ss :'0' + ss;
		
		return  year + '-' + month + '-' + day + " " + hh + ":" + mm + ":" + ss;
	}
	
	/*댓글 수정*/
	function modifyReply(r_id){
		contents = $("#contents_"+r_id).text();
		detachedContent = $("#contents_"+r_id).detach();
		
		/*상단 버튼 바꾸기*/
		$("#replyManagement_" + r_id + "_1").css("display","none");
		$("#replyManagement_" + r_id + "_2").css("display","inline-block");
		
		var html = "";
		html += "<textarea id='modify_" + r_id + "' cols='100' rows='3' style='display:inline-block;resize:none'>";
		html += "</textarea>";
		
		
		$("#replyContentsWrapper_"+r_id).append(html);
		$("#modify_"+r_id).val(contents);
	}
	
	/*수정 완료*/
	function completeModify(r_id){
		var modifiedReply = $("#modify_"+r_id).val();
		
		$.ajax({
			url:"/app/board/modifyReply.do",
			type:'POST',
			data:{
				"r_id":r_id,
				"contents":modifiedReply
			},
			success:function(){
				detachedContent.text(modifiedReply);
				
				$("#modify_"+r_id).detach();
				$("#replyContentsWrapper_"+r_id).append(detachedContent);
				
				/*상단 버튼 바꾸기*/
				$("#replyManagement_" + r_id + "_1").css("display","inline-block");
				$("#replyManagement_" + r_id + "_2").css("display","none");
			},
			error:function(err){
				console.log(err);
			}
			
		})
	}
	
	/*수정 취소*/
	function cancelModify(r_id){
		var tmp = $("#modify_"+r_id).detach();
		$("#replyContentsWrapper_"+r_id).append(detachedContent);
		
		/*상단 버튼 바꾸기*/
		$("#replyManagement_" + r_id + "_1").css("display","inline-block");
		$("#replyManagement_" + r_id + "_2").css("display","none");
	}
	
	/*댓글 삭제*/
	function deleteReply(r_id){
		if(confirm("삭제 하시겠습니까?")){
			$.ajax({
				url:"/app/board/deleteReply.do",
				type:"POST",
				data:{
					"r_id":r_id
				},
				success:function(result){
					if(result=="success"){
						$("#replyInnerWrapper_"+r_id).remove();
						if($("#replyTable tbody").children().length == 0){
							var html = "<p style='text-align:center' id='no'>등록된 댓글이 없습니다.</p>";
							$("#replyWrapper").append(html);
						}
					}else{
						console.log("삭제하는데 실패 했습니다.");
					}
				},
				error:function(){
					console.log("서버 오류");
				}
			})
		}else{
			return false;
		}
	}
</script>
</body>
</html>