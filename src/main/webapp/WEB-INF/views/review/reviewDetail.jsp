<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
	<!-- bootstrap icon cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="/assets/css/star.css" rel="stylesheet" />
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

.container {
	padding: 30px 100px;
}

.td {
	padding-bottom: 30px;
}

.ta1 {
	float: left;
	position: relative;
	top: 40px;
}

.ta2 {
	float: left;
	margin-top: 10px;
	margin-left: 20px;
	position: relative;
	top: 40px;
	font-size: 20px;
}

.ta3 {
	float: right;
	clear: both;
}

button[type=button] {
	position: relative;
	bottom: 10px;
}

.review {
	margin: 15px 30px;
}

.re1>img {
	float: left;
	width: 50px;
	height: 50px;
}

.jtitle {
	float: left;
	padding-top: 10px;
	padding-left: 10px;
}

.star {
	float: right;
	font-size: 30px;
	color: rgba(255, 213, 0, 0.879);
	position: relative;
	left: 1000px;
	bottom: 30px;
	margin-right: 1000px;
}

.title {
	clear: both;
	padding: 20px 0px;
}

.good {
	color: #0D6EFD;
	margin: 15px 0px;
}

.bad {
	color: #FA3E3E;
	margin: 15px 0px;
}

.re1 {
	margin-top: 10px;
	margin-bottom: 30px;
}

.re2 {
	margin: 30px 0px;
}

.re3 {
	margin-top: 30px;
	margin-bottom: 50px;
}

/* modal  */
.modal-content>.modal-body {
	padding: 50px 30px;
}

/*  modal ??? */
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

input[type=submit] {
	position: relative;
	bottom: 10px;
}

/* modal text  */
#myform>.mb-3>h4>span.text-bold {
	width: 100px;
	height: 50px;
	padding: 30px;
}

/* ???????????? */
.blur {
	filter: blur(5px);
	-webkit-filter: blur(5px);
}

/* ???????????? */
.hideBtn {
	width: 300px;
	height: 200px;
}

/* ???????????? ??????,?????? */
.innerModifyBtn > #modifyReviewForm > button, .innerDeleteBtn>#deleteReviewForm>button{
	border:1px solid #c8cfe6;
	margin:1px;
	width: 100px;
	height: 40px;
	position: relative;
    left: 50px;
    bottom: 20px;
    background-color: #f7f9ff;
	
}

	/* ?????????????????? */
	.moreBtn>span>img {
		width: 30px;
		height: 30px;
	}

	#myform2 fieldset{
	    display: inline-block;
	    direction: rtl;
		border:0;
	}
	#myform2 fieldset legend{
	    text-align: right;
	}
	#myform2 label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform2 label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform2 label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform2 input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}

	/* 
	 <modal>  
	.modal-content>.modal-body{
		padding:50px 30px;
	} 
    
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
		
	input[type=submit] {
    position: relative;
    bottom: 10px;
	}

   .re4{
	margin-bottom:100px;
	position: relative;
	left: 1100px;
	} */
    
    
    
</style>
<script type="text/javascript">

	/* ?????? ??? */
	$(function(){
		 $(".star1").mouseenter(function(){
			$(".text-bold").text("?????? ??????");
		})
		$(".star1").mouseleave(function(){
			$(".text-bold").text("");
		}) 
		$(".star2").mouseenter(function(){
			$(".text-bold").text("??????");
		})
		$(".star2").mouseleave(function(){
			$(".text-bold").text("");
		})
		$(".star3").mouseenter(function(){
			$(".text-bold").text("??????");
		})
		$(".star3").mouseleave(function(){
			$(".text-bold").text("");
		})
		$(".star4").mouseenter(function(){
			$(".text-bold").text("?????????");
		})
		$(".star4").mouseleave(function(){
			$(".text-bold").text("");
		})
		$(".star5").mouseenter(function(){
			$(".text-bold").text("?????? ?????????");
		})
		$(".star5").mouseleave(function(){
			$(".text-bold").text("");
		})
		
	})


	/* ????????? ??????,?????? ???????????? */
	$(function(){
		$(".modifyBtn").hide();
		
		$(".bi-three-dots").click(function(){
			//console.log("test");
			if($(".modifyBtn").hasClass("on")){
				$(".modifyBtn").slideUp();
				$(".modifyBtn").removeClass("on");
				
			}else{
				$(".modifyBtn").addClass("on");
				$(".modifyBtn").slideDown();
			}
					
		})
		
		//?????? ????????????
		$("#deleteReviewSubmit").click(function(){
			var reviewDelete = $("#modifyReviewForm")[0];
			reviewDelete.method="post";
			reviewDelete.action="/goodjob/reviewDelete";
			reviewDelete.submit();
		})
		
	
	})
	
	
	/* ????????? ?????????????????? */
	function modify(rno, title, good, bad, cname, mno, cno){
		console.log("title : "+title)
		console.log("title : "+good)
		console.log("title : "+bad)
		console.log("cname : "+cname)
		console.log("mno : "+mno)
		console.log("cno : "+cno)
		console.log("rno : "+rno)
		
		$("#cname_modify").html(cname) 	
	 	$("#rtitle_modify").html(title) 	
	    $("#rgood_modify").html(good)
	 	$("#rbad_modify").html(bad) 	 	
	 	$("#cno_modify").val(cno)
	 	$("#mno_modify").val(mno)
	 	$("#rnoModify").val(rno);
	 		
 	}
	
	
	
	
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
<c:set var="login" value="${user}" />
<div class="container reviewDetail">
	<table class="table">
		<tr>
			<td class="td">
				<div class="ta1">
					<h2><strong>${cname }</strong></h2>
				</div>
				<div class="ta2">
					<span>??? ${cnt }?????? ????????????</span>
				</div>
				<div class="ta3">
									
					<!-- ???????????? ?????? -->
					<c:choose>
						<c:when test="${user.mdto != null}">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">?????? ??????</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="notLogin" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">?????? ??????</button>								
							
							<%--???????????? ??????????????? or ??????????????? ????????? ??? ???????????? modal--%>
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"></h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<c:choose>
										<c:when test="${user.cdto == null }">
											<div class="modal-body" style="text-align: center;">
													<h5>???????????? ???????????????</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
												<a href="/goodjob/login/loginform"><button type="button" class="btn btn-primary">&nbsp?????????????????? ??????&nbsp</button></a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="modal-body" style="text-align: center;">
												<h5>??????????????? ????????? ??? ????????????</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary" data-bs-dismiss="modal">??????</button>
											</div>
										</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div> 
	 		 </td>
				 </tr>
					<c:forEach var="dto" items="${list }">
					<tr>
						<td>
						<c:choose>
							<%--?????? ???????????? ?????? --%>
							<c:when test="${user.cdto != null }">
								<div class="review">
							</c:when>
							<%--?????? ????????? ????????????--%>
							<c:when test="${user.mdto != null }">
								<c:set var="mpay" value="${user.mdto.mpay}" />
								<c:choose>
									<%--???????????? ???????????????--%>
									<c:when test="${mpay eq 1 }">
										<div class="review">
									</c:when>
									<%--???????????? ???????????? ????????????--%>
									<c:when test="${mpay eq 0 }">
										<div class="review blur">
									</c:when>
								</c:choose>
							</c:when>
							<%--????????? ??????????????? --%>
							<c:otherwise>
								<div class="review blur">
							</c:otherwise>
						</c:choose>

						<div class="re1">
							<img src="/goodjob/images/profile.png" alt="profile" />
							<div class="jtitle">${dto.jtitle } |		
								<fmt:parseDate value="${dto.regdate}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
								<fmt:formatDate value="${date }" pattern="yyyy.MM.dd" />
							</div>
							<div class="star">
								<c:set var="s" value="${dto.rstar}"></c:set>
								<c:if test="${s eq 5 }">???????????????</c:if>
								<c:if test="${s eq 4 }">???????????????</c:if>
								<c:if test="${s eq 3 }">???????????????</c:if>
								<c:if test="${s eq 2 }">???????????????</c:if>
								<c:if test="${s eq 1 }">???????????????</c:if>
								<c:if test="${s eq 0 }">???????????????</c:if>
							</div>
						</div>

						<h4 class="title"><strong>${dto.rtitle }</strong></h4>
						<div class="re2">
							<h5 class="good"><strong>??????</strong></h5>
							<h5>${dto.rgood }</h5>
						</div>
						<div class="re3">
							<h5 class="bad"><strong>??????</strong></h5>
							<h5>${dto.rbad }</h5>
						</div> 
						<!-- ???????????? ???????????? ??????????????? ????????? -->
						<c:if test="${user.mdto != null }">
						<!-- ???????????? ???????????? ????????? ????????? ????????? ?????? --> 
							<c:set var="myWrite" value="${dto.mno }"></c:set> 
							<c:set var="myId" value="${user.mdto.mno }"></c:set> 
							<c:if test="${myWrite eq myId}">
								<i class="bi bi-three-dots fs-2"></i>
								<div class="modifyBtn" >
									<div class="innerModifyBtn">
										<form id="modifyReviewForm">
											<input type="hidden" name="rno" value="${dto.rno}" />										
											<button type="button" onclick="modify('${dto.rno }','${dto.rtitle }','${dto.rgood}', '${dto.rbad }','${cname }','${dto.rstar }','${cno }')"  data-bs-toggle="modal" data-bs-target="#modifyModal">??????</button>
										</form>
									</div>
									<div class="innerDeleteBtn">
										<form id="deleteReviewForm">
										<input type="hidden" name="rno" id="rno" value="${dto.rno}" />
										<button type="button" data-bs-toggle="modal" data-bs-target="#deleteModal" >??????</button>
										</form>
									</div>
								</div>
							</c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			<!-- ?????????????????? -->
		</table>
	</div>
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" />
	
	
<c:if test="${user.mdto != null }">
	<%-- ???????????? Modal --%>
			<form action="/goodjob/writeOOK" method="get">
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
						
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">???????????? ??????</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							
							<div class="modal-body">
								<h2 style="padding-bottom: 20px;"><strong>${cname }</strong></h2>
								<input type="hidden" name="cno" value="${cno }" /> 
								<input type="hidden" name="mno" value="${user.mdto.mno }" /> 
								<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
									<div class="mb-3" id="myform">
										<fieldset>
											<input type="radio" name="rstar" value="5" id="rate1">
											<label for="rate1" class="star1">???</label> 
											<input type="radio" name="rstar" value="4" id="rate2">
											<label for="rate2" class="star2">???</label>
											<input type="radio" name="rstar" value="3" id="rate3">
											<label for="rate3" class="star3">???</label> 
											<input type="radio" name="rstar" value="2" id="rate4">
											<label for="rate4" class="star4">???</label>
											<input type="radio" name="rstar" value="1" id="rate5">
											<label for="rate5" class="star5">???</label>
										</fieldset>
										<strong><span class="text-bold" style="padding-left: 50px;"></span></strong>
									</div>
								<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label> 
								<select class="form-select form-select-lg mb-3" aria-label="Default select example" name="jno">
										<option selected>????????? ??????????????????</option>
										<c:forEach var="dto" items="${job }">
											<option value="${dto.jno }">${dto.jtitle }</option>
										</c:forEach>
								</select></br>

								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ?????????</strong></label>
										<textarea class="form-control" name="rtitle" id="exampleFormControlTextarea1" rows="3"
											placeholder="?????? 20??? ??????????????????"></textarea>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
										<textarea class="form-control" name="rgood" id="exampleFormControlTextarea1" rows="3"
												placeholder="?????? 20??? ??????????????????"></textarea>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
										<textarea class="form-control" name="rbad" id="exampleFormControlTextarea1" rows="3"
												placeholder="?????? 20??? ??????????????????"></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-primary" value=" ?????? " />
							</div>
						</div>
					</div>
				</div>
			</form><!-- ????????????modal end -->
	
	
	<!-- ?????? Modal -->
	<form action="/goodjob/reviewModify" method="get">
		<input type="hidden" name="rno" id="rnoModify" value="" />
			<div class="modal fade" id="modifyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">???????????? ??????</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>

<!-- </html> -->
	
						<div class="modal-body">
						    <h2 style="padding-bottom: 20px;" id="cname_modify"><strong>?????????</strong></h2>
						 	<input type="hidden" name="cno" value="" id="cno_modify"/> 
							<input type="hidden" name="mno" value="" id="mno_modify"/>  
							<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
								<div class="mb-3" id="myform2">
										<fieldset>
											<input type="radio" name="rstar" value="5" id="rate1">
											<label for="rate1" class="star1">???</label> 
											<input type="radio" name="rstar" value="4" id="rate2">
											<label for="rate2" class="star2">???</label>
											<input type="radio" name="rstar" value="3" id="rate3">
											<label for="rate3" class="star3">???</label> 
											<input type="radio" name="rstar" value="2" id="rate4">
											<label for="rate4" class="star4">???</label>
											<input type="radio" name="rstar" value="1" id="rate5">
											<label for="rate5" class="star5">???</label>
										</fieldset>
										<strong><span class="text-bold" style="padding-left: 50px;"></span></strong>
									</div>

								<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label> 
								<select class="form-select form-select-lg mb-3" aria-label="Default select example" name="jno">
										<option selected>????????? ??????????????????</option>
										<c:forEach var="dto" items="${job }">
											<option value="${dto.jno }">${dto.jtitle }</option>
										</c:forEach>
								</select></br>

								<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ?????????</strong></label>
										<textarea class="form-control" name="rtitle" id="rtitle_modify" rows="3" placeholder="?????? 20??? ??????????????????">?????????????????? ???????????????</textarea>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
									<textarea class="form-control" name="rgood" id="rgood_modify" rows="3" placeholder="?????? 20??? ??????????????????">??????????????? ???????????????</textarea>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label"><strong>?????? ??????</strong></label>
									<textarea class="form-control" name="rbad" id="rbad_modify" rows="3" placeholder="?????? 20??? ??????????????????">??????????????? ???????????????</textarea>
								</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="??????" />
						</div>
					</div>
				</div>
			</div>
		</form>
		
	
	
	<!-- delete Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" >??????</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	????????? ?????? ?????????????????????????
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
	        <button type="button" id="deleteReviewSubmit" class="btn btn-primary">??????</button>
	      </div>
	    </div>
	  </div>
	</div>
</c:if>

</body>
</html>

