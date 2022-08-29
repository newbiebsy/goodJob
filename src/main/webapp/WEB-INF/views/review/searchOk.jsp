<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hireList</title>
<style>
@import 
url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.contentList {
		padding-top: 50px;
		padding-bottom: 50px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.Top {
		padding-top: 40px;
		padding-bottom: 30px;
		padding-left: 60px;
		padding-right: 60px;
	}
	.Top>p {
		float: left;
		color: #222;
    	font-size: 22px;
    	line-height: 27px;
    	font-weight: 600;
	}
	.dropdown {
		padding-left: 1090px;
	}
	.hireArea {
		border-top: 1px solid #E5E5E5;
		padding-left: 60px;
		padding-right: 60px;
		padding-top: 30px;
		padding-bottom: 30px;
	}
	.hireArea:hover {
		background-clip: border-box;
		background-color: RGBA(239,245,255,0.3);
	}
	.hireTitle {
		float: left;
	}
	.hireDate {
		float: left;
		color: #949494;
		line-height: 17px;
		font-size: 13px;
		padding-top: 4px;
		padding-left: 20px;
		color: rgba(255, 213, 0, 0.879);
	}
	.comTitle {
		float: left;
		font-size: 15px;
    	font-weight: bold;
    	letter-spacing: -1px;
    	color: #222222;
    	padding-top: 15px;
	}
	.hireCondition {
		text-align: left;
		float: left;
		color: #555555;
    	font-size: 13px;
    	line-height: 17px;
    	padding-top: 7px;
	} 
	.hireCondition>span {
		padding-right: 8px;
	}
	.bookmark>button {
		background-color: white;
		border: 0;	
	}
	.bookmark>a>img{
		width: 45px;
	    height: 45px;
	    padding-top: 1px;
	    position: relative;
	    left:140px;
	}
	.bookmark>span{
		position: relative;
	    left:120px;
	    color:gray;
	}
	
	.hireTitle>a {
		text-decoration: none;
		color: #222222;
		font-size: 17px;
    	font-weight: bold;
   		letter-spacing: -1px;
	}
	.hireTitle a:hover {
		color: #222222;
		text-decoration: underline;
	}
	.hireInfo {
		float: left;
	}
	.comArea {
		padding-left: 960px; 
	}
	.floatDelete {
		clear: both;
	} 
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".form-select").on("change",function(){
			//console.log("test");
			//console.log($(this).val()); //cnt, avg
			var order = $(this).val();
			window.location = "searchOk?order="+order;
			
		})
	})
</script>
</head>
<body>
	<!-- header include -->
	<jsp:include page="../main/header.jsp" />
	<!-- 검색창 include -->
	<jsp:include page="../main/searchBar2.jsp" />  
	
	<!-- content -->
	<div class="bg-light contentList">
		<div class="container bg-white hireList">
			<!-- 정렬 -->
			<div class="Top">
				<p>검색결과</p>
				<div class="dropdown">
				  <select class="form-select" aria-label="Default select example">
				  	<option selected>정렬</option>
				  	<option class="dropdown-item" value="CNT">리뷰수순</option>
				  	<option class="dropdown-item" value="AVG">평점순</option>
				  </select>
				</div>
			</div>
			
			<!-- list -->
			<div class="content">
			<c:forEach var="list" items="${getList}">
				<div class="hireArea">
					<div class="hireInfo">
						<div class="hireTitle">
							<a href="reviewDetail?cno=${list.cno }">${list.cname }</a>
						</div>
						<div class="hireDate">
							<!-- 기업평점 평균값 -->
								<c:set var="s" value="${list.avg }"></c:set>
								<c:if test="${s eq 5 }">★★★★★</c:if>
								<c:if test="${s eq 4 }">★★★★☆</c:if>
								<c:if test="${s eq 3 }">★★★☆☆</c:if>
								<c:if test="${s eq 2 }">★★☆☆☆</c:if>
								<c:if test="${s eq 1 }">★☆☆☆☆</c:if>
								<c:if test="${s eq 0 }">☆☆☆☆☆</c:if>
						</div><br />
						<div class="hireCondition">					
							<c:set var="addr" value="${list.caddr}"></c:set>
							<span>${fn:split(addr,' ')[0] }</span>
							<span>${fn:split(addr,' ')[1] }</span>
							<span>${list.tname}</span>
						</div>
						<!-- <div class="floatDelete"></div> -->
					</div>
					<div class="comArea">
						<div class="comTitle">
							
						</div>
						<div class="bookmark">
							<span>${list.cnt }</span>
							<a href="reviewDetail?cno=${list.cno }"><img src="/images/writing.png" alt=""/></a>	
						</div>
						<div class="floatDelete"></div>
					</div>
				</div>
			</c:forEach>
				<div>
					<!-- 페이지네이션 -->
				</div>
			</div>
		</div>
	</div> 
	
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>