<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.commentBoardList{
		width : 900px;
		border-bottom: 1px solid #E5E5E5;
		text-align: left;
		margin-top: 10px;
		position: relative;
	}
	
	.commentSubmit  {
		width: 70px;
		font-weight: 700;
		float:right;
		border : 1px solid silver;
		border-radius: 100px;
	}
	.listSubmit{
		font-weight: 700;
		border : 1px solid silver;
		border-radius: 100px;
	}
	.fs-3{
		float: right; 
		margin-top: -10px;
	}
	.modifyCommentBtn{
		display: none;
		
		color: #333;
	    font-size: 13px;
	    padding: 13px 5px;
	    border-radius: 5px;
	    box-shadow: 0 1px 5px 0 rgb(0 0 0 / 10%);
	    border: 1px solid #ccc;
	    width: 100px;
	    height:80px;
	    text-align: center;
	    
	    position: absolute;
	    top: 10%;
	    right: -10%;
	}
	
	.modifyCommentBtn button{
		padding: 0px 10px;
	    border: 0;
	    background: none;
	}
	.innerModifyCommentBtn, .innerDeleteCommentBtn{
		height: 30px;
	}
	
	.commentWrite > textarea {
		white-space: pre-wrap;
		word-break:break-all;
	    word-wrap: break-word;
	}
	.commentDiv{
		white-space: pre-wrap;
		word-break:break-all;
	    word-wrap: break-word;
	}
	.commentWrite2{
		margin-top: 10px;
		margin-bottom: 10px;
		border: 1px solid #E5E5E5;
		border-radius: 5px;
		width : 820px;
		text-align: left;
		
	}
	.commentWrite2 > textarea {
		width : 100%;
		height: 70px;
		border: 0;
		outline: none;
		resize: none;
		padding: 16px 10px;
		white-space: pre-wrap;
	}
	.btnBox2 {
		width : 850px;
		padding: 0;
		margin-top: 20px;
	}
	.btn2{
		width: 60px;
		font-weight: 300;
		border : 1px solid silver;
		border-radius: 100px;
	}
	.btn2:hover{
		font-weight: 700;
	}
</style>
<script type="text/javascript">


	$(function(){
		
		// 게시글 수정,삭제 div 안보이게
		$('html').click(function(e){
			if (!$(e.target).hasClass('fs-3')) { 
			   	$(".modifyCommentBtn").css("display","none"); 
			}
		});
		
		
	});
	
	// 댓글 수정,삭제 div 보이도록
	function clickComment(x){
		$(".modifyCommentBtn").css("display","none"); 
		$("#modifyCommentBtn"+x+"").css("display","block"); 
	}
	
	// 댓글 수정
	function modifyComment(bcno,index,contents,bno){
		$(".comment"+index)[0].outerHTML = 
				'<form action="/goodjob/comm/modifyComment" method="post">'
				+ '<div class="commentWrite2"><textarea name="bccontents" maxlength="300" id="" placeholder="내용을 입력해주세요(300자)" >'+contents+'</textarea></div>'
				+ '<div class="container btnBox2" style="text-align: left;">'
				+ '<input class="btn btn2" style="float:right; position: absolute; top:55%; right:0%" type="submit" value="수정" />'
				+ '</div>'
				+ '<input type="hidden" name="bcno" value='+bcno+' />'
				+ '<input type="hidden" name="bno" value='+bno+' />'
				+ '</form>';
	}

	// 댓글 삭제
	function deleteComment(bcno){
		var frm = $("#deleteCommentForm")[0];
		
		$("input[name='bcno']").attr("value",bcno);
		frm.method ="post";
		frm.action = "/goodjob/comm/deleteComment";
		frm.submit();
	}
</script>
</head>
<body>
	<c:choose>
	<c:when test="${empty list}"  >
	<!-- 리뷰가 없는 경우 -->
		<div style="margin: 60px 0;" class="container">
			<img width="70px;" src="https://static.wanted.co.kr/images/community/community-3d-comment.png" alt="첫 댓글을 남겨주세요 이미지" />
			<p style="color: #666;" >첫 댓글을 남겨주세요.</p>
		</div>
	</c:when>
	<c:otherwise>
	<!-- 리뷰가 있는 경우 -->
		<c:forEach var="dto" items="${list}" varStatus="i" >
		<div class="container commentBoardList" id="boardList${i.index}"> 
			<span style="font-weight: 700; font-size: 14px;">${idList[i.index] }</span>
			<fmt:parseDate  var="date" value="${dto.bcdate }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="date2" value="${date }" pattern="yyyy년 MM월 dd일" />
			<span style="font-size: 14px;">${date2}</span>
			<c:if test="${dto.mno == map.loginMno }">
				<i class="bi bi-three-dots fs-3 " onclick="clickComment(${i.index})"></i>
					<div class="modifyCommentBtn" id="modifyCommentBtn${i.index}" >
						<div class="innerModifyCommentBtn">
							<button type="button" onclick="modifyComment(${dto.bcno},${i.index},'${dto.bccontents}',${map.dto.bno})" >수정</button>
						</div>
						<div class="innerDeleteCommentBtn">
							<form id="deleteCommentForm">
								<input type="hidden" name="bcno" value="${dto.bcno}" />
								<input type="hidden" name="bno" value="${map.dto.bno}" />
								<button type="button" onclick="deleteComment(${dto.bcno})" >삭제</button>
							</form>
						</div>
					</div>
				</c:if>
			<!-- 사용자 이미지 넣어주기 -->
			<div class="comment${i.index} commentDiv" style="margin-top: 14px; margin-bottom: 20px;">${dto.bccontents }</div>
		</div>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	
	<!-- 로그인 처리 후 리뷰 기능 추가하기!! -->
		<c:choose>
		<c:when test="${map.loginMno == null }">
			<div class="container commentWrite">
				<textarea name="bccontents" placeholder="일반회원만 이용하실 수 있습니다." readonly="readonly" ></textarea>
			</div>
			<div class="container btnBox" style="text-align: left;">
				<a class="btn" href="/goodjob/comm/commList">목록으로</a>
			</div>
		</c:when>
		<c:otherwise>
			<form action="/goodjob/comm/commentWrite" method="post">
			<div class="container commentWrite">
				<textarea name="bccontents" maxlength="300" id="" placeholder="내용을 입력해주세요(300자)" ></textarea>
			</div>
			<div class="container btnBox" style="text-align: left;">
				<!-- 전에 url로 이동할때 어떻게 해야할지 궁금 -->
				<a class="btn listSubmit" style="background-color: white;" href="/goodjob/comm/commList">목록으로</a>
				<input class="btn commentSubmit" style="background-color: white;" type="submit" value="등록" />
				<input type="hidden" name="bno" value="${map.dto.bno}" />
				<input type="hidden" name="mno" value="${map.loginMno}" />
			</div>
			</form>
		</c:otherwise>
		</c:choose>
	
</body>
</html>