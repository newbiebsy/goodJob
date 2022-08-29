<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewList</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
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
	.dropdownSort {
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
	
	/* 페이지네이션 */
	.pagination {
		text-align: center;
		justify-content: center;
		margin: 0px;
		padding: 50px 0 50px 0;
	}
/* .pageInfo{
    list-style : none;
    display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
    float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;} */
 /*  .active{
      background-color: #cdd5ec;
  }
  */
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 	/* $(document).ready(function(){
		let result = '<c:out value="${result}"/>'
	
		checkAlert(result);
		//console.log(result);
	
		function checkAlert(result){
			if(result === ''){
				return;
			}
		}
	})  */
	
	
	
 	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='rno' value='"+$(this).attr("href")+"'>");
		moveForm.attr("action", "/reviewList/get");
		moveFrom.submit();
		
	}); 
	
	
	$(".pageInfo a").on("click", function(e){
		let moveForm = $("#moveForm");
		e.preventDefault();
		//console.log("test");
	    moveForm.find('input[name="pageNum"]').val($(this).attr("href"));
	    moveForm.attr("action", "/reviewList");
	    moveForm.submit();  
	         
	});
	
	
	/* 정렬 */
	$(function(){
		$(".form-select").change(function(){
			var sort = $(".form-select").val();
			var $search = $("#search").val();
			var $amount = $("#amount").val();
			var $pageNum = 1;
			
			
			//console.log("test");	
			let moveForm = $("#moveForm"); 
			$("#result").text("sort : "+sort)
			location.href="/reviewList?pageNum="+$pageNum+"&amount="+$amount+"&search="+$search+"&sort="+sort;
			//console.log(sort);		
			//moveForm.find('input[name="pageNum"]').val(1);
			//moveForm.find('input[name="sort"]').val(sort);
			//moveForm.attr("action", "/reviewList?pageNum"+);
			//moveForm.submit(); 
			
		})
	})
	
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
	<!-- 검색창 include -->
	<jsp:include page="../main/searchBar2.jsp" />  
	
	<!-- <h6>총 게시물 수 : ${pageMaker.total}</h6>
		<h6>처음 페이지 : ${pageMaker.startPage}</h6>
		<h6>끝 페이지 : ${pageMaker.endPage}</h6>
		<h6>현재 페이지 : ${pageMaker.page.pageNum}</h6>
		<h6>페이지 당 게시물 수 : ${pageMaker.page.amount}</h6>  
		<h6>키워드 : ${pageMaker.page.search}</h6>
		<h6>정렬 : ${pageMaker.page.sort}</h6> --%>
		
		
	<!-- content -->
	<div class="bg-light contentList">
		<div class="container bg-white hireList">
			<!-- 정렬 -->
			<div class="Top">
				<p>검색결과</p><span id="result"></span>
				<span>${sort }</span>
				<div class="dropdownSort">
				  <select class="form-select" aria-label="Default select example" style="width:110px;">
				  	<option selected>정렬</option>
				  	<option class="dropdown-item" value="cnt">리뷰수순</option>
				  	<option class="dropdown-item" value="avg">평점순</option>
				  </select>
				</div>
			</div>
			
			<!-- list -->
			<div class="content">
				<c:forEach var="dto" items="${list }" varStatus="i">
				<%-- <h6>${list}</h6> --%>
					<div class="hireArea">
						<div class="hireInfo">
							<div class="hireTitle">
									<a href="reviewDetail?cno=${dto.cno }">${dto.cname }</a>						
							</div>
							<div class="hireDate">
								<!-- 기업평점 평균값 -->
								<c:set var="s" value="${dto.avg }"></c:set>
								<c:if test="${s eq 5 }">★★★★★</c:if>
								<c:if test="${s eq 4 }">★★★★☆</c:if>
								<c:if test="${s eq 3 }">★★★☆☆</c:if>
								<c:if test="${s eq 2 }">★★☆☆☆</c:if>
								<c:if test="${s eq 1 }">★☆☆☆☆</c:if>
								<c:if test="${s eq 0 }">☆☆☆☆☆</c:if>
								<%-- <span style="padding-left: 5px;">${dto.avg }</span> --%>
							</div>
							<br />
							<div class="hireCondition">
								<c:set var="addr" value="${dto.caddr}"></c:set>
								<span>${fn:split(addr,' ')[0] }</span> 
								<span>${fn:split(addr,' ')[1] }</span>
								<span>${dto.tname}</span>
							</div>
							<!-- <div class="floatDelete"></div> -->
						</div>
						<div class="comArea">
							<div class="comTitle"></div>
							<div class="bookmark">
								<span>${dto.cnt }</span>
								<a href="reviewDetail?cno=${dto.cno }"><img src="/images/writing.png" alt=""/></a>												
							</div>
							<div class="floatDelete"></div>
						</div>
					</div>
				</c:forEach>	
							
				<!-- 페이지네이션 -->
				    <div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				 			<ul id="pageInfo" class="pagination pageInfo">
				 			
				 			<!-- 이전페이지 버튼 -->
			                <c:if test="${pageMaker.prev}">
			                    <li class="pageInfo_btn previous page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
			                </c:if>
			                
				            <!-- 각 번호 페이지 버튼 -->
			                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			                    <li class="pageInfo_btn page-item ${pageMaker.page.pageNum == num ? "active":"" }"><a class="page-link" href="reviewList?pageNum=${num}&amount=${pageMaker.page.amount}&search=${pageMaker.page.search}&sort=${pageMaker.page.sort}">${num}</a></li>
			                </c:forEach>
    
				            <!-- 다음페이지 버튼 -->
			                <c:if test="${pageMaker.next}">
			                    <li class="pageInfo_btn next page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
			                </c:if>
       
				 			</ul>
				        </div>
				    </div>	
				    
					<form id="moveForm" method="get">					
						<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.page.pageNum }"/>
	        			<input type="hidden" id="amount" name="amount" value="${pageMaker.page.amount }"/> 
	        			<input type="hidden" id="search" name="search" value="${pageMaker.page.search}" />
	        			<input type="hidden" id="sort" name="sort" value="${pageMaker.page.sort }" />

					</form>
			
			</div>
		</div>
	</div> 
	
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>