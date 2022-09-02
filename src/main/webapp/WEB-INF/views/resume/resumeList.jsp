<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>resumeLIst</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	*{
		margin: 0;
		padding: 0;
		font-family: "Noto Sans KR";
	}
	.back{
		text-align: center;
	}
	.innerback{
		background-color: white;
		display: inline-block;
		margin: 50px 50px;
		width: 1000px;
	}
	.listHeader {
		padding : 20px 20px 20px 20px;
		border-bottom: 1px solid #E5E5E5;
		text-align: left;
		font-weight: 900;
		font-size: 40px;
	}
	.listHeader>span {
		color: #222;
    	font-size: 25px;
    	line-height: 27px;
    	font-weight: 600;
    	margin-left: 15px; 
	}
	.boardList{
		width : 900px;
		border-bottom: 1px solid #E5E5E5;
		text-align: left;
		padding: 0 20px 20px 20px;
	}
	
	.resumeName {
		padding : 10px 0 5px 0;
		font-weight: 400;
		color: #949494;
   	 	line-height: 17px;
    	font-size: 13px;
	}
	.atitleSpan{
		text-decoration: none;
    	color: #222222;
    	font-size: 17px;
    	font-weight: bold;
    	letter-spacing: -1px;
	}
	
	.heartImg{
		width: 30px;
		display: inline-block;
	}
	.heartBtn{
		border: 0;
		background: none;
		float: right;
	}

	.listContents{
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp:2;
		overflow:hidden;
		margin-top: 4px;
		text-align: left;
    	color: #555555;
    	font-size: 13px;
    	line-height: 17px;	
	}
	
	.boardList:hover {
		background-clip: border-box;
		background-color: rgba(239,245,255,0.3);
	}
	
	/* 페이징 */
	.pagination {
		text-align: center;
		justify-content: center;
		margin: 0px;
		padding: 0 0 50px 0;
	}

</style>

<script type="text/javascript">
	$(function(){
		
		// 하트 이미지 클릭시 이력서 좋아요 처리
		$(".heartBtn").on("click",function(){
			
			// 클릭한 heart 이미지 변수에 담기
			var imgSrc = $(this)[0].childNodes[1].attributes[1];
			
			var params = {
					ano : $(this)[0].children[1].value,
					cno : "${cno}"
			}
			
			$.ajax({
		    	type : "POST",            
		        url : "/goodjob/resume/resumeLike",      
		        contentType: 'application/json',
		        data : JSON.stringify(params),           
		        success : function(res){
		        	
		        	imgSrc.nodeValue = res.heart;
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ 
		           alert("통신 실패.")
		       	}
		       });		
		});
		
		
		
		
	});
	


</script>
</head>
<body>
	<!-- header -->
	<sec:authorize access="isAnonymous()">		
		<jsp:include page="../main/header.jsp" /> 	
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<jsp:include page="../main/headerMember.jsp" />
	</sec:authorize> 
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<jsp:include page="../main/headerCompany.jsp" />
	</sec:authorize> 
	<div class="bg-light">
	<div class="container back bg-light">
		<div class="container innerback">
			<div class="container listHeader">
				<span>회원 이력서</span>
			</div>
			<c:forEach var="dto" items="${resumeList }" varStatus="i" >
			<div class="container boardList">
				<div class="container resumeName">
					<span>${dto.mname}</span>
				</div>
				<div class="container resumeBody">
				<a href="/goodjob/resuemeListDetail?ano=${dto.ano}" style="text-decoration: none;">
					<span class="atitleSpan">${dto.atitle}</span>
				</a>
					<button class="heartBtn">
					<c:choose>
					<c:when test="${checkLikeList[i.index] == 0 }">
						<img class="heartImg" src="../images/heart0.png" alt="빈 하트 사진" />
					</c:when>
					<c:otherwise>
						<img class="heartImg" src="../images/heart1.png" alt="빨간 하트 사진" />
					</c:otherwise>
					</c:choose>
						<input type="hidden" name="ano" value="${dto.ano }" />
					</button>
				<div class="container listContents" style="padding-left: 0px; padding-right: 50px;">
					${dto.acontents}
				</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation example" style="display: inline;">
			<ul class="pagination">
				<c:if test="${map.prev}">
					<li class="page-item"><a class="page-link" href="/goodjob/resume/resumeList?currentPage=${map.currentPage-5}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${map.startPageNo}" end="${map.endPageNo}">
					<li class="page-item"><a class="page-link" href="/goodjob/resume/resumeList?currentPage=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${map.next}">
					<li class="page-item"><a class="page-link" href="/goodjob/resume/resumeList?currentPage=${map.currentPage+5}">다음</a></li>
				</c:if>
			</ul>
		</nav>	
	</div>
	</div>
	<!-- footer -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>