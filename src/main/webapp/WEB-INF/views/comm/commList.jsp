<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- bootstrap icon cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>goodjob 커뮤니티</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	*{
		margin: 0;
		padding: 0;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.back{
		text-align: center;
		padding-bottom: 50px;
	}
	.innerback{
		background-color: white;
		display: inline-block;
		margin: 50px 50px;
	}

	.tagHeader{
		padding : 20px 20px;
		border-bottom: 1px solid #E5E5E5;
	}
	.tagHeader > a> .tagBtn{
		background-color: #f2f4f7;
		font-size: 15px;
		padding : 0 20px;
		height: 50px;
	}
	.tagHeader > a> .tagBtn:hover{
		background-color: #fff;
		font-weight: 700;
	}
	.writeWrap{
		border-bottom: 1px solid #E5E5E5;
		height: 100px;
	}
	.writeDiv{
		padding: 29px 29px 31px;
		position: relative;
	}
	.writeBtn{
		position: absolute;
		top: 25%;
		left: 4%;
	    height: 56px;
	    border-radius: 4px;
	    border: 1px solid #e1e2e3;
	    background-color: #fff;
	    color: #333;
	    font-size: 16px;
	    line-height: 1.6;
    	display: flex;
    	flex: 1 1;
    	align-items: center;
    	justify-content: space-between;
	}
	
	.boardList > a{
		text-decoration: none;
    	color: #222222;
    	font-size: 17px;
    	font-weight: bold;
    	letter-spacing: -1px;
	}
	.boardList{
		width : 900px;
		border-bottom: 1px solid #E5E5E5;
		text-align: left;
	}
	.idHeader{
		line-height: 5em;
		margin-bottom: -15px;
		font-size: 14px;
		font-weight: 300;
	}
	
	.contentWrap >.tagSpan {
		font-size: 13px;
	    font-weight: 500;
	    padding: 4px 13px;
	    border: 1px solid #e1e2e3;
	    border-radius: 100px;
	    color: #888;
	    display: inline-block;
	    margin-left: -4px;
	}
	
	.boardFooter{
		margin: 20px 0px;
	}
	.communityHeader>.h1 {
		font-size: 28px;
    	font-weight: 700;
    	line-height: 19px;
    	color: #333;
	}
	/* 글 목록 줄개수 확인후 2개 이상이면 잘라주기 */
	.content {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp:2;
		overflow:hidden;
		margin-top: 4px;
		width: 700px;
		font-size: 14px;
    	line-height: 17px;
    	margin-bottom: 10px;
    	word-break:break-all;
	    white-space: pre-wrap;
	    word-wrap: break-word;
	}
	/* 페이징 */
	.pagination {
		text-align: center;
		justify-content: center;
		margin: 0px;
		padding: 50px 0 50px 0;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		// 글 목록 마우스 접근시 포인터 표시
		$("#writeInput").mouseenter(function(){
			$(this).css("cursor","pointer");
		});
		
		// 로그인전에 commWrite 접근시 alert 띄워주는 코드
	  	let message = "${loginCheck}";
	    	if (message != "") {
	        	alert(message);
	        }else {
	        }
		
	    // writeBtn 클릭시 url 보내줌
	    $(".writeBtn").on("click",function(){
	    	location.href = "/comm/commWrite";
	    });
	    
	 	// 선택했던 tag 클릭된 상태로 보여주기
 		$("button[value='${tag}']").addClass("active").css("background-color","#fff").css("font-weight","700");
	});
	
</script>
</head>
<body>
	<!-- header include -->
	<sec:authorize access="isAnonymous()">		
		<jsp:include page="../main/header.jsp" /> 	
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<jsp:include page="../main/headerMember.jsp" />
	</sec:authorize> 
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<jsp:include page="../main/headerCompany.jsp" />
	</sec:authorize> 
	
	<div class="container communityHeader" >
		<div class="h1" style="margin: 60px 0 60px 0">커뮤니티</div>
	</div>
	<div class="bg-light back">
		<div class="container innerback" style="max-width: 1000px;">
			<div class="container tagHeader" >
				<a href="/comm/commList/BEST" ><button type="button" class="btn mx-3 tagBtn" value="BEST" >BEST</button></a>
				<a href="/comm/commList/전체" ><button type="button" class="btn mx-3 tagBtn" value="전체" >전체</button></a>
				<a href="/comm/commList/취준" ><button type="button" class="btn mx-3 tagBtn" value="취준">취준</button></a>
				<a href="/comm/commList/이직" ><button type="button" class="btn mx-3 tagBtn" value="이직">이직</button></a>
				<a href="/comm/commList/회사생활" ><button type="button" class="btn mx-3 tagBtn" value="회사생활">회사생활</button></a>
				<a href="/comm/commList/라이프스타일" ><button type="button" class="btn mx-3 tagBtn" value="라이프스타일">라이프스타일</button></a>
				<a href="/comm/commList/잡담" ><button type="button" class="btn mx-3 tagBtn" value="잡담" >잡담</button></a>
				<a href="/comm/commList/Q%26A" ><button type="button" class="btn mx-3 tagBtn" value="Q&A" >Q&A</button></a>
			</div>
			<div class="container writeWrap">
				<div class="container row my-3 writeDiv">
					<button type="button"  class="writeBtn" style="width: 900px; padding-left: 20px; padding-right: 20px;">
						회사생활이나 고민에 대해서 자유롭게 이야기 해주세요!
						<img style="width: 35px;" alt="글쓰기사진" src="/images/writing.png">
					</button>
				</div>
			</div>
			
			<c:forEach var="dto" items="${list }" varStatus="i" >
			<div class="container boardList">
			<a href="/comm/commDetail?bno=${dto.bno}" >
			<div class="container" style="width: 940px;">
				<div class="container idHeader"> 
					<span>${idList[i.index] }</span>
					<fmt:parseDate var="date" value="${dto.bdate }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="date2" value="${date }" pattern="yyyy년 MM월 dd일" />
					<span>${date2}</span>
				</div>
				<div class="container contentWrap">
					<span>${dto.btitle}</span>
					<div class="content" style="font-weight: 300;">${dto.bcontents }</div>
					<span class="tagSpan">${dto.btag }</span>
				</div>
				<div class="container boardFooter">
				
				<c:choose>
				<c:when test="${loginMno == null }">
					<i class="bi bi-heart fs-6"></i><span style="font-size: 15px; margin-left: 6px; color: #666;">${bLikeCntList[i.index] }</span>
				</c:when>
				<c:otherwise>
				<c:choose>
				<c:when test="${checkLikeCntList[i.index] == 0 }">
					<i class="bi bi-heart fs-6"></i><span style="font-size: 15px; margin-left: 4px; color: #666;">${bLikeCntList[i.index] }</span>
				</c:when>
				<c:otherwise>
					<i class="bi bi-heart-fill fs-6"></i><span style="font-size: 15px; margin-left: 4px;">${bLikeCntList[i.index] }</span>
				</c:otherwise>
				</c:choose>
				</c:otherwise>
				</c:choose>
					<i class="bi bi-chat fs-6" style="margin-left: 10px;"></i><span style="font-size: 15px; margin-left: 4px; color: #666;"> ${bnoCntList[i.index] }</span>
				</div>
				</div>
			</a>
			</div>
			</c:forEach>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pagination pageInfo">
				<c:if test="${map.prev}">
					<li class="pageInfo_btn page-item"><a class="page-link" href="/comm/commList?currentPage=${map.currentPage-5}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${map.startPageNo}" end="${map.endPageNo}">
					<li class="pageInfo_btn page-item"><a class="page-link" href="/comm/commList?currentPage=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${map.next}">
					<li class="pageInfo_btn page-item"><a class="page-link" href="/comm/commList?currentPage=${map.currentPage+5}">다음</a></li>
				</c:if>
			</ul>
			</div>
		</div>
		</div>
	</div>
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>