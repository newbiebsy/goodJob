<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resumeWrite</title>
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
	.selectDate>p {
		float: left;
		padding: 5px 7px 0 0; 
	}
	.selectDate>input {
		float: left;
		margin: 0px 0 0 10px;
		border: none;
		font-size: 15px;
		width: 300px;
	}
	.selectDate {
		float: left;
	}
	.selectDate>div {
		float: left;
		padding: 8px 5px 0 12px;
	}
	.inputSchool {
		float: left;
	}
	.inputSchool>input {
		width: 600px;
		font-size: 15px;
		margin: 0px 0 0 10px;
		border: none;
	}
	
	/* 경력사항 */
	.work {
		margin-bottom: 40px;
	}
	.insertBtn {
		border: none;
		background-color: white;
		color: #0D6EFD;
		font-size: 16px;
		padding: 0 0 0 15px;
	}
	#inputWork {
		margin: 20px 0 30px 0;
	}
	.inputCompany {
		float: left;
	}
	.inputCompany>input {
		margin: 0px 0 0 10px;
		border: none;
		font-size: 15px;
		width: 600px;
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
		margin: 30px 0 80px 0;
	}
	.writeBtn {
		margin: 20px 0 80px 0;
		display: flex;
  		justify-content: center;
  		align-items: center;
	}
	.writeBtn>input {
		font-size: 17px;
	}
	.myPhoto img{
		width: 103px;
		height : 132px;
	}
	
	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 연도, 월 선택
	/* $(document).ready(function(){
		setDateBox();
	});
	function setDateBox(){
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();
		
		$("#astart, #aend, #wstart, #wend").append("<option value=''>연도</option>");
		
		// 올해 기준으로 -20 ~ 올해까지
		for(var y = (com_year-22); y <= (com_year); y++){
			$("#astart, #aend, #wstart, #wend").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
		}
		
		var month;
		$("#astart2, #aend2, #wstart2, #wend2").append("<option value=''>월</option>");
			for(var i = 1; i <= 12; i++){
				$("#astart2, #aend2, #wstart2, #wend2").append("<option value='"+ i +"'>"+ i +"월"+"</option>");
			}
	} */
	
	var val = 1;
	
	/* 경력사항 div 추가 */
	function add_div(){
		/* //console.log("test");
		var div = document.createElement('div');
		
		div.innerHTML = document.getElementById('work_div').innerHTML;
		document.getElementById('inputWork_plus').appendChild(div); */
		console.log("var "+val)
		$("#work_div_"+val).show();
		$("#workCnt").val(val);
		
		if(val<3){
			val+=1;
		}
		
		
	}
	
	function remove_div(num){
		/* document.getElementById('inputWork_plus').removeChild(obj.parentNode); */
		if(num==1){
			return;
		}
		if(val>1){
			val-=1;
		}
		
		$("#work_div_"+num).hide();
		$("#workCnt").val(val);

	}
	
	// 유효성 검사
	$(function(){
		
		// 경력사항 갯수에 따른 div 보이기 여부
		var workCnt = "${workCnt}";
		console.log("cnt : "+workCnt)
		
		$("#work_div_2").css({
				"display" : "none"
			});
			$("#work_div_3").css({
				"display" : "none"
			});
		/* if(workCnt==1){
			$("#work_div_4").css({
				"display" : "none"
			});
			
			$("#work_div_5").css({
				"display" : "none"
			});
			
		}else if(workCnt==2){
			$("#work_div_4").css({
				"display" : "none"
			});
			$("#work_div_5").css({
				"display" : "none"
			});
		} */
		
		
		$("#complete_btn").on("click", function(){
			if($("#atitle").val() == ""){
				alert("이력서 제목을 입력해주세요.");
				$("#atitle").focus();
				return false;
			}else if($("#aedu").val() == ""){
				alert("학력 사항을 입력해주세요.");
				$("#aedu").focus();
				return false;
			}else if($("#winfo").val() == ""){
				alert("경력 사항을 입력해주세요.");
				$("#winfo").focus();
				return false;
			}else if($("#acontents").val() == ""){
				alert("자개소개서 내용을 입력해주세요.");
				$("#acontents").focus();
				return false;
			}
			else if($("#astart").val() == ""){
				alert("입학 날짜를 입력해주세요.");
				$("#astart").focus();
				return false;
			}
			else if($("#aend").val() == ""){
				alert("졸업 날짜를 입력해주세요.");
				$("#aend").focus();
				return false;
			}
			else if($("#wstart").val() == ""){
				alert("입사 날짜를 입력해주세요.");
				$("#wstart").focus();
				return false;
			}
			else if($("#wend").val() == ""){
				alert("퇴사 날짜를 입력해주세요.");
				$("#wend").focus();
				return false;
			}
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
					<img src="/goodjob/uploadfile/${Mlist.mimg }" alt="" />
				</c:when>
				<c:otherwise>
					<img src="/goodjob/images/myPhoto.png" alt="" />
				</c:otherwise>
			</c:choose>
			</div>
			
			<div class="info">
				<dl class="basicInfo" style="padding-bottom: 10px;">
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
		
		<form action="/goodjob/resumeWriteOk" method="post">
		<input type="hidden" id="workCnt" name="workCnt" value="${workCnt }"/>
		<!-- 제목 -->
		<div class="resumeTitle">
			<div class="title">
				이력서 제목
			</div>
			<div class="inputTitle">
				<input class="form-control form-control-lg" type="text" placeholder="이력서 제목을 입력해주세요." aria-label=".form-control-lg example" value="${Mlist.atitle}" name="atitle" id="atitle">
			</div>
		</div>
		
		<!-- 학력사항 -->
		<div class="aducation">
			<div class="title">학력 사항</div>
			<div class="inputAducation">
				<div class="selectDate">
					<!-- <select name="astart" id="astart" title="연도" class="form-select"></select>
	            	<select name="astart2" id="astart2" title="월" class="form-select"></select>
	            	<p> ~ </p>
	            	<select name="aend" id="aend" title="연도" class="form-select"></select>
	            	<select name="aend2" id="aend2" title="월" class="form-select"></select> -->
	            	<input type="text" class="form-control form-control-lg" name="astart" id="astart" value="${Mlist.astart}" placeholder="입학날짜를 입력해주세요.(YYYY년 MM월)"/>
	            	<div>~</div>
	            	<input type="text" class="form-control form-control-lg" name="aend" id="aend" value="${Mlist.aend}" placeholder="졸업날짜를 입력해주세요.(YYYY년 MM월)"/>	            	
				</div>
				<div class="inputSchool">
	            	<input class="form-control form-control-lg" type="text" placeholder="학교명 및 전공을 입력해주세요." aria-label=".form-control-lg example" value="${Mlist.aedu}" name="aedu" id="aedu">
				</div>
			</div>
		</div>
		
		<!-- 경력사항 -->
		<div class="work">
			<div class="title">경력 사항
			<input class="insertBtn" type="button" value="+ 추가" onclick="add_div()"/>
			</div>
			<c:choose>
				<c:when test="${workList != null }">
					<c:forEach var="work" items="${workList }" varStatus="status">
						<div id="work_div_${status.count }">
							<div id="inputWork">
								<div class="selectDate">
									<!-- <select name="wstart" id="wstart" title="연도" class="form-select"></select>
					            	<select name="wstart2" id="wstart2" title="월" class="form-select"></select>
					            	<p> ~ </p>
					            	<select name="wend" id="wend" title="연도" class="form-select"></select>
					            	<select name="wend2" id="wend2" title="월" class="form-select"></select> -->
					            	<input type="text" class="form-control form-control-lg" name="wstart_${status.count}" id="wstart" value="${work.wstart}" placeholder="입사날짜를 입력해주세요.(YYYY년 MM월)"/>
				            		<div>~</div>
				            		<input type="text" class="form-control form-control-lg" name="wend_${status.count}" id="wend" value="${work.wend}" placeholder="퇴사날짜를 입력해주세요.(YYYY년 MM월)"/>
								</div>
								<div class="inputCompany">
					            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="${work.winfo}" name="winfo_${status.count}" id="winfo">
								</div>
							</div>
							<input type="button" value="X" id="divDelete" onclick="remove_div('${status.count}')"/>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
<%--				<c:otherwise>
 				<h1>여기2</h1>
				<div id="work_div_1">
				<div id="inputWork">
					<div class="selectDate">
						<!-- <select name="wstart" id="wstart" title="연도" class="form-select"></select>
		            	<select name="wstart2" id="wstart2" title="월" class="form-select"></select>
		            	<p> ~ </p>
		            	<select name="wend" id="wend" title="연도" class="form-select"></select>
		            	<select name="wend2" id="wend2" title="월" class="form-select"></select> -->
		            	<input type="text" class="form-control form-control-lg" name="wstart_1" id="wstart" value="" placeholder="입사날짜를 입력해주세요.(YYYY년 MM월)"/>
	            		<div>~</div>
	            		<input type="text" class="form-control form-control-lg" name="wend_1" id="wend" value="" placeholder="퇴사날짜를 입력해주세요.(YYYY년 MM월)"/>
					</div>
					<div class="inputCompany">
		            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="" name="winfo_1" id="winfo">
					</div>
				</div>
					<input type="button" value="X" id="divDelete" onclick="remove_div(1)"/>
			</div>
			--%>
			<div id="work_div_2" >
				<div id="inputWork">
					<div class="selectDate">
						<!-- <select name="wstart" id="wstart" title="연도" class="form-select"></select>
		            	<select name="wstart2" id="wstart2" title="월" class="form-select"></select>
		            	<p> ~ </p>
		            	<select name="wend" id="wend" title="연도" class="form-select"></select>
		            	<select name="wend2" id="wend2" title="월" class="form-select"></select> -->
		            	<input type="text" class="form-control form-control-lg" name="wstart_2" id="wstart" value="" placeholder="입사날짜를 입력해주세요.(YYYY년 MM월)"/>
	            		<div>~</div>
	            		<input type="text" class="form-control form-control-lg" name="wend_2" id="wend" value="" placeholder="퇴사날짜를 입력해주세요.(YYYY년 MM월)"/>
					</div>
					<div class="inputCompany">
		            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="" name="winfo_2" id="winfo">
					</div>
				</div>
					<input type="button" value="X" id="divDelete" onclick="remove_div(2)"/>
			</div>
			<div id="work_div_3">
				<div id="inputWork">
					<div class="selectDate">
						<!-- <select name="wstart" id="wstart" title="연도" class="form-select"></select>
		            	<select name="wstart2" id="wstart2" title="월" class="form-select"></select>
		            	<p> ~ </p>
		            	<select name="wend" id="wend" title="연도" class="form-select"></select>
		            	<select name="wend2" id="wend2" title="월" class="form-select"></select> -->
		            	<input type="text" class="form-control form-control-lg" name="wstart_3" id="wstart" value="" placeholder="입사날짜를 입력해주세요.(YYYY년 MM월)"/>
	            		<div>~</div>
	            		<input type="text" class="form-control form-control-lg" name="wend_3" id="wend" value="" placeholder="퇴사날짜를 입력해주세요.(YYYY년 MM월)"/>
					</div>
					<div class="inputCompany">
		            	<input class="form-control form-control-lg" type="text" placeholder="회사명 및 직책을 입력해주세요." aria-label=".form-control-lg example" value="" name="winfo_3" id="winfo">
					</div>
				</div>
					<input type="button" value="X" id="divDelete" onclick="remove_div(3)"/>
			</div> 
			 
			
			
			<div id="inputWork_plus"></div>
		</div>
		
		<!-- 자소서 내용 -->
		<div class="self">
			<div class="title">내용</div>
			<div class="inputSelf">
				<textarea name="acontents" id="acontents" cols="30" rows="15" class="form-control" placeholder="자기소개서를 자유롭게 입력하세요." nonce="acontents">${Mlist.acontents}</textarea>
			</div>			
		</div>
		
		<div class="writeBtn">
			<input type="submit" value="작성완료" class="btn btn-outline-primary btn-lg" id="complete_btn" />  
		</div>
		</form>
		<div class="floatDelete"></div>
	</div>
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" /> 
</body>
</html>