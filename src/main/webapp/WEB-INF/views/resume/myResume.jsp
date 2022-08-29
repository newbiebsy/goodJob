<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myResume</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
	.container {
		padding: 4px;
		font-family: 'Noto Sans KR', sans-serif;
		margin:0 auto; 
	}
	.floatDelete {
		clear: both;
	}
	/* 기본 정보 */
	.infoTitle {
		padding-top: 100px;
		padding-bottom: 30px;
		font-weight: 600;
		font-size: 32px;
		line-height: 39px;
		color: #3b3d40;
	}
	.info {
		position: relative;
		bottom: 5px;
	}
	.myInfo {
		background-color: #F8F9FA;
		padding: 34px 50px 15px;
	}
	.myPhoto {
		float: left;
		margin-right: 28px;
	}
	.blind {
		overflow: hidden;
    	clip: rect(1px,1px,1px,1px);
    	position: absolute !important;
		visibility: hidden;
	}
	.detailInfo {
		padding-left: 130px;
	}
	.name {
		float: left;
		font-size: 22px;
		line-height: 33px;
    	font-weight: bold;
    	color: #444;
    	letter-spacing: -2px;
	}
	.gender {
		float: left;
		padding-top: 10px;
		padding-left: 7px;
		font-size: 14px;
    	line-height: 16px;
    	color: #666;
	}
	.birth {
		padding-top: 10px;
		padding-left: 10px;
		font-size: 14px;
    	line-height: 16px;
    	color: #666;
	}
	.detailInfo>dt {
		float: left;
		width: 100px;
		font-weight: bold;
    	font-size: 14px;
    	line-height: 16px;
    	color: #444;
    	letter-spacing: -1px;
	}
	.detailInfo>dd {
		font-size: 14px;
    	line-height: 18px;
    	color: #444;
    	word-break: break-all;
	}
	input[type="text"]:disabled {
		background: #FFFFFF;
		border: none;
	}
	
	/* 이력서 제목 */
	.title {
		padding-top: 50px;
		padding-bottom: 6px;
		font-weight:500;
		font-size: 20px;
		line-height: 39px;
		color: #3b3d40;
		border-bottom: 1px solid #bababa;
	}
	.inputTitle>input {
		margin: 20px 0 20px 0;
		border: none;
		font-size: 15px;
	}
	
	/* 학력사항 */
	.inputAducation {
		margin: 20px 0 80px 0;
	}
	#YEAR1, #YEAR2 {
		width: 130px;
		float: left;
	}
	#MONTH1, #MONTH2 {
		width: 130px;
		float: left;
	}
	.selectDate>p {
		float: left;
		padding: 5px 7px 0 0; 
	}
	.inputSchool>input {
		margin: 0px 0 0 10px;
		border: none;
		font-size: 15px;
		width: 700px;
	}
	.selectDate {
		float: left;
	}
	.selectDate>select {
		margin-right: 10px;
	}
	.inputSchool {
		float: left;
	}
	
	/* 경력사항 */
	.work {
		margin-bottom: 90px;
	}
	.insertBtn {
		border: none;
		background-color: white;
		color: #0D6EFD;
		font-size: 16px;
		padding: 0 0 0 15px;
	}
	#inputWork {
		margin: 10px 0 30px 0;
	}
	.inputCompany {
		/* float: left; */
	}
	.inputCompany>input {
		margin: 0px 0 0 10px;
		border: none;
		font-size: 15px;
		width: 650px;
	}
	#divDelete {
		margin: 0 0 0 10px;
		background: none;
		border: none;
	}
	#divDelete:hover {
		color: #0D6EFD;
	}
	
	/* 내용 */
	.inputSelf {
		margin: 20px 0 80px 10px;
	}
	.writeBtn {
		margin: 20px 0 80px 0;
		display: flex;
  		justify-content: center;
  		align-items: center;
	}
	.writeBtn>a {
		font-size: 17px;
	}
	#date {
		width: 90px;
		margin: 7px 0 0 8px;
	}
	.myPhoto img{
		width: 103px;
		height : 132px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		
		$("#modifyWrite").click(function(){
			// console.log("click")
			var $end = $("#listEnd").val();
			location.href="resumeWrite?listNum=${resumeSize}";
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
	
	<!-- Content -->
	<div class="container">
		<div class="infoTitle">기본 정보</div>
		<!-- 기본 정보 -->
		<div class="myInfo">
			<div class="myPhoto">
			<c:choose>
				<c:when test="${Mlist.mimg != null }">
					<img src="../uploadfile/${Mlist.mimg }" alt="" />
				</c:when>
				<c:otherwise>
					<img src="images/myPhoto.png" alt="" />
				</c:otherwise>
			</c:choose>
			
			</div>
			<div class="info">
				<dl class="basicInfo" style="padding-bottom: 10px;" >
					<dt class="blind">이름</dt>
					<dd class="name">${Mlist.mname}</dd>
					<dt class="blind">성별</dt>
					<dd class="gender">${Mlist.mgender}&nbsp;</dd> 
					<dt class="blind">생년월일</dt>
					<dd class="birth">${Mlist.mbirth}</dd>
				</dl>
				<dl class="detailInfo">
					<dt>• 이메일</dt>
					<dd class="email">${Mlist.memail}</dd>
					<dt>• 휴대폰</dt>
					<dd class="cell">${Mlist.mphone}</dd>
					<dt>• 주소</dt>
					<dd class="address">${Mlist.maddr}</dd>
					<dt>• 관심분야</dt>
					<dd class="interest">${Mlist.tname}</dd>
				</dl>
			</div>
		</div>
		
		<!-- 제목 -->
		<div class="resumeTitle">
			<div class="title">
				이력서 제목
			</div>
			<div class="inputTitle">
				<input class="form-control form-control-lg" type="text" placeholder="이력서 제목을 입력해주세요." aria-label=".form-control-lg example" value="${Mlist.atitle}" disabled="disabled">
			</div>
		</div>
		
		<!-- 학력사항 -->
		<div class="aducation">
			<div class="title">학력 사항</div>
			<div class="inputAducation">
				<div class="selectDate">
	            	<input type="text" name="" id="date" value="${Mlist.astart}" placeholder="YYYY.MM" disabled="disabled"/>
	            	<span> ~ </span>
	            	<input type="text" name="" id="date" value="${Mlist.aend}" placeholder="YYYY.MM" disabled="disabled"/>
				</div>
				<div class="inputSchool">
	            	<input class="form-control form-control-lg" type="text" placeholder="학교명 및 전공을 입력해주세요." aria-label=".form-control-lg example" value="${Mlist.aedu}" disabled="disabled">
				</div>
			</div>
		</div>
		
		<!-- 경력사항 -->
		
		<div class="work">
			<div class="title">경력 사항</div>
			<c:choose>
				<c:when test="${workList != null }">
			
				<div id="work_div">
				<c:forEach var="work" items="${workList }" varStatus="status">
				
					<div id="inputWork">
						<div class="selectDate">
			            	<input type="text" name="" id="date" value="${work.wstart}" placeholder="YYYY.MM" disabled="disabled"/>
			            	<span> ~ </span>
			            	<input type="text" name="" id="date" value="${work.wend}" placeholder="YYYY.MM" disabled="disabled"/>
						</div>
						<div class="inputCompany">
			            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="${work.winfo}" disabled="disabled">
						</div>
					</div>
					<input type="hidden" id="listEnd" value="${status.end }" />
				</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div id="work_div">				
					<div id="inputWork">
						<div class="selectDate">
			            	<input type="text" name="" id="date" value="" placeholder="YYYY.MM" disabled="disabled"/>
			            	<span> ~ </span>
			            	<input type="text" name="" id="date" value="" placeholder="YYYY.MM" disabled="disabled"/>
						</div>
						<div class="inputCompany">
			            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="" disabled="disabled">
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
			
			
			<div id="inputWork_plus"></div>
		</div>
		
		<!-- 자소서 내용 -->
		<div class="self">
			<div class="title">내용</div>
			<div class="inputSelf">
				${Mlist.acontents}
			</div>			
		</div>
		
		<div class="writeBtn">
			<button type="button" id="modifyWrite" class="btn btn-outline-primary btn-lg">수정</button> 
		</div>
			
		<div class="floatDelete"></div>
	</div>
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>