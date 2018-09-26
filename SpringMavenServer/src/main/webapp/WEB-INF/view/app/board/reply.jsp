<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
	ul, li, p, input, div, body, html,input, button {margin: 0;padding: 0;}
	ul li {text-decoration: none;list-style: none;}
	.replyWrapper {width:700px;}
	.replyContents {width:600px;height:50px}
	.replyFormBtn {width:50px;height:25px;font-size: .6em;border:none;}
	
 	.replyInputWrapper{height:75px;}
	.replyInnerWrapper td{height:100px;width:800px;}
 	.replyInfoWrapper{height:30%;} 
 	.replyContentsWrapper{height:70%;}
 	.replyRegitInfo{display: inline-block;float: left;font-size: .8em;}
 	.replyManagement li{display: inline-block;float: right;margin:0 5px;}
 	.replyManagement p{font-size: .8em;cursor:pointer;}
 	
 	.replyContentsWrapper span{ font-size:1em;}
 	
 	#replyContents {resize:none;}
</style>

<body>
<div class="replyWrapper" id="replyWrapper">
	<p style="font-size: 1em">댓글</p>
	<hr />
	<div class="replyInputWrapper">
		<textarea id="replyContents" cols="90" rows="3" placeholder="댓글을 입력하세요"></textarea>
		<button class="replyFormBtn" id="replyFormBtn">댓글달기</button>
	</div>
	<table class="replyListWrapper" id="replyTable">
		<c:choose>
			<c:when test="${replyList eq null}">
				<p style="text-align: center" id="no">등록된 댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>  
				<c:forEach var="replyList" items="${replyList }">
					<tr class="replyInnerWrapper" id="replyInnerWrapper_${replyList.getR_id()}">
						<td>
							<div class="replyInfoWrapper">
								<p class="replyRegitInfo">
									${replyList.getNickname() }&nbsp;&nbsp;
									${replyList.getRegDate() }
								</p>
								<ul class="replyManagement" id="replyManagement_${replyList.getR_id()}_1" >
									<li><p onclick="deleteReply(${replyList.getR_id()})">삭제</p></li>
									<li><p onclick="modifyReply(${replyList.getR_id()})">수정</p></li>
								</ul>
								
								<ul class="replyManagement" id="replyManagement_${replyList.getR_id()}_2" style="display:none">
									<li><p onclick="cancelModify(${replyList.getR_id()})">취소</p></li>
									<li><p onclick="completeModify(${replyList.getR_id()})">수정</p></li>
								</ul>
							</div>
							<div class="replyContentsWrapper" id="replyContentsWrapper_${replyList.getR_id()}">
								<span id="contents_${replyList.getR_id()}">${replyList.getContents() }</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
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