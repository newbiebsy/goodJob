<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
<!-- Bootstrap icon CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
<!-- Jquery Ui CSS -->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<!-- My CSS -->
<!-- JQUERY -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.container {
	padding: 4px;
	font-family: 'Noto Sans KR', sans-serif;
	margin:0 auto; 
}

a{
	color: black;
	text-decoration: none;
}

row{
	float:left;
}
img{
	width:200px;
	height:200px;
}
/* 마이페이지 */

.myPageCompany .col-md-5>button {
	margin: auto;
	width:100px;
	display:block;
} 

.bi-person-circle {
	font-size: 100px;
}

#moreInfo{
	background-color: white;
	/* width: 25%; */
	margin-left: 180px;
	border: 1px solid #e1e2e3;
    border-radius: 5px;
}  
#moreInfo>button{
	border: 1px solid #e1e2e3;
}

button.submit{
	border:0px;
	position:relative;
	left:48px;
	
}
.col-md-6{
	background-color: white;
	border: 1px solid #e1e2e3;
	margin-left: 100px;
	height: 150px;
	padding: 20px;
	
}
 .offset-md-1{
	margin-top:150px;
}
#memTitle{
	padding: 100px 0 15px 167px;
	font-size: 24px;
    font-weight: 700;
    color: #333;
}
 #mset{
 	margin-top:25px;
	width:245px;
	text-align: center;
	margin-left:25px;
	margin-top: 40px;
}  
#drop{
	position:relative;
	top:-300px;
	left:180px;
	text-align: center;
	height:50px;
}
.subscribe{
	text-align: right;
}
#carousel1{
	height:200px;
	background-color: white;
	position:relative;
	top:-450px;
	left: -90px;
}
#carousel2{
	height:200px;
	background-color: white;
	position:relative;
	top: -330px;
	left: 160px;
}
#carousel3{
	height: 220px;
	background-color: white;
	position: relative;
	left: 280px;
}
 #change{
	background-color: white; 
	margin-left: 180px;
	height: 110px;
	border: 1px solid #e1e2e3;
    border-radius: 5px;
	width: 335px;
	position:relative;
	top: 520px;
	left:-513px;
}  
.detail{
	margin-left:150px;
	background-color:#FFFFFF;
	width:350px;
	position:relative;
}
.detail>h3{
	font-size: 20px;
    line-height: 19px;
    font-weight: 800;
    padding-top:15px;
    position:relative;
    top:30px;
}
.detail>button{
	position:relative;
    left:250px;
    top:-45px;
   	color: #555555;
    border: none;
    width: 100px;
    height: 40px;
    text-align: center;
    font-size: 15px;
    border-radius: 8px;
    background: #f2f4f7;
    margin-bottom: 10px;
    
}
.posting{
	background-color:#FFFFFF;
	width:480px;
	height:180px;
	margin-left:80px;
}
.col-10>p{
	font-size: 20px;
    line-height: 19px;
    font-weight: 600;
}

/* .col-10>p.fs-2{
	font-size: 25px;
	font-weight: 800;
    line-height: 19px;
}
.col-10>p.fs-4{
	font-size: 20px;
	font-weight: 600;
    line-height: 19px;
} */


#interestCompany{
	position:relative;
	left: 550px;
	top: -400px;
	width:300px;
	height:30px;
	margin-bottom: 10px;
}
#review{
	position:relative;
	left: -200px;
	top: 50px;
}
#mypageCommunity{
	position:relative;
	left : 550px;
	top:-520px;
}
.carousel-control-prev-icon { 
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E"); 
 }

.carousel-control-next-icon {
   background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E"); 
}
#dropButton{
	width:120px;
	border: none;
	font-size: 16px;
    line-height: 24px;
    font-weight: 400;
    color: #999;
    background-color: transparent;
    position: relative;
	top:50px;
}
#ad{
	margin-top: 50px;
}
#ctag{
	position: relative;
	left:105px;
	top:-30px;
	color: #0D6EFD;
    background-color: #fff;
    border: 1px solid #0D6EFD;
    width: 100px;
    text-align: center;
    height: 40px;
    font-size: 15px;
    border-radius: 20px;

}
#btnModify{
	position: relative;
	left:90px;
}
#btnDelete{
	position: relative;
	left:40px;
}
#likeImg{
	width:30px;
	height:30px;
}
.col-md-3>h2 {
	font-size: 20px;
    line-height: 19px;
    font-weight: 800;
    padding-left:35px;
    padding-top:15px;
}
.col-md-3>h5 {
	font-size: 14px;
    line-height: 16px;
    color: #767676;
    padding-left:10px;
}
.col-md-3>h5.offset-md-3{
	font-size: 14px;
    line-height: 16px;
    color: #767676;
    padding-left:40px;
    position: relative;
	top:-20px;
}
#formFile{
	margin:10px 0px;
	}
	
/* 헤더 */
	#header {
		font-family: 'Noto Sans KR', sans-serif;
		padding-left: 80px;
		padding-right: 80px;
		padding-top: 0;
		padding-bottom: 0;
		border-bottom: 1px solid #E5E5E5;
	}
	#loginBtn {
		width: 90px;
		font-weight: 600;
		position: relative;
		right: 30px;
	}
	#registerBtn {
		width: 90px;
		font-weight: 600;
		position: relative;
		right: 10px;
	}
	#menuName>li>a {
		padding: 10px 30px 0 30px;
		font-weight: 600;
		color: #333333;
		font-size: 18px;
		line-height: 27px;
	}
	#menuName>li>a:hover {
		color: #0D6EFD;
	}
	.profile, .dropdown-menu, .dropdown-toggle {
		margin: 0 0 0 250px;
	}
	.navbar-brand>img, #logoImg{
		width: 120px;
		height:50px;
	}
	#profileImg{
		width: 50px;
		height:50px;
	}
	#submitImg{
		width: 190px;
		height:190px;
	}
	
	/* footer */
	#footer {
	font-family: 'Noto Sans KR', sans-serif;
	}
	.logo {
		float: left;
	}
	.footerTop {
		height: 60px; 
		border-bottom: 1px solid #E5E5E5;
		padding-top: 8px;
	}
	.footerLinks {
		position: relative;
		left: 20px;
	} 
	.footerLinks>a{
		text-decoration: none;
		font-weight: 400;
		font-size: 16px;
		line-height: 24px;
		color: #333333;
		padding-left: 40px;
		padding-right: 40px;
	}
	.footerText {
		padding-top: 30px;
		padding-bottom: 60px;
		font-weight: 500;
		font-size: 12px;
		line-height: 18px;
		color: #767676;
	}
	.app {
		padding-left: 300px;
	}
	.app>img {
		margin-right: 10px;
	}
	hr {
		margin-top: 0;
	}
	#appImg{
		width: 20px;
		height:20px;
		
	}
</style>
<script>

function deleteCompany(){
	
	var $checked= $("#flexCheckDefault").is(':checked');
	var $inputPassword = $("#inputPassword").val();
	
	// console.log(inputPassword);
	// console.log("${mdto.mpwd}");
	
	if($checked==false){
		//console.log("여기")
		alert("동의여부를 확인해주시기 바랍니다")
		/* if(inputPassword != "${mdto.mpwd}"){
			alert("비밀번호를 다시한번 확인해주시기 바랍니다")
		} */
	}else{
		// console.log("여기")
		$.ajax({
			url : "/goodjob/company/delete",
			type : "POST",
			data : {
				"pwd" : $inputPassword
			},
			success : function(data){
				alert("회원 탈퇴가 완료되었습니다. 감사합니다.")

				if(data == 1){
					location.href="/goodjob/logout";
				}else{
					alert("비밀번호를 다시 한 번 확인해주시기 바랍니다.")
				}
			}
		})
	}
	
}

</script>

</head>
<body>

	<div class="container">
		<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white" id="header">
			<div class="container-fluid">
				<nav class="navbar navbar-light bg-white">
					<a class="navbar-brand" href="/goodjob"> 
						<img src="/goodjob/images/logo.png" alt="" width="130" height="35">
					</a>
				</nav>
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="menuName">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/goodjob/hireList">채용공고</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/goodjob/reviewList">기업리뷰</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/goodjob/comm/commList">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/goodjob/resume/resumeList">이력서 열람</a></li>
							<!-- 회원/기업 주소 다르게 -->
							<!-- 드롭다운 -->
						<li class="nav-item dropdown profile">
				          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				           <img src="/goodjob/images/profile.png" alt="" id="profileImg" class="rounded-circle" />
				          </a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="/goodjob/myPage/myPageCompany">기업페이지</a></li>
				            <li><a class="dropdown-item" href="/goodjob/hire/hireWriter">공고등록</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="/goodjob/logout">로그아웃</a></li>
				          </ul>
				       </li>
					</ul>					
				</div>
			</div>
		</nav>
	</div>
		

<body class="myPageMember ">
	<!-- header -->
<%-- 	<sec:authorize access="isAnonymous()">		
		<jsp:include page="../main/header.jsp" /> 	
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<jsp:include page="../main/headerMember.jsp" />
	</sec:authorize> 
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<jsp:include page="../main/headerCompany.jsp" />
	</sec:authorize>  --%>
		
	<div class="bg-light">
	<div class="container" >
		<div>
			<h2 id="memTitle">MY PAGE</h2>
		</div>
			<div class="row" >
				<div class="col-md-3" id="moreInfo">
					<form action="/goodjob/myPage/insertImgCom" method="post" enctype="multipart/form-data">
					<div class="mb-3">
					  <input class="form-control" type="file" id="formFile" name="files">
					</div>
					<button class="submit">추가</button>
					</form>
					<c:choose>
							<c:when test="${cdto.cimg==null }">
							<button class="submit"><img src="../images/profile.png " alt="" id="submitImg"/></button>
							</c:when>
								<c:otherwise>
									<button class="submit"><img src="../uploadfile/${cdto.cimg }" alt="" id="submitImg" /></button>
								</c:otherwise>
					</c:choose>
					<h2 class="offset-md-3">${cdto.cmanager}</h2><br />
					<%-- <p class="fs-5">${cdto.cemail }</p>
					<p class="fs-5">${cdto.cphone }</p><br /> --%>
					<h5 class="offset-md-2">${cdto.cemail }</h5><br />
					<h5 class="offset-md-3">${cdto.cphone }</h5><br /> 
					<button type="button" class="btn btn-outline-primary" id="ctag">${ctag }</button>
				</div>
				<div class="col-3" id="change">
				<div class="col-3" id="mset"> 
					<a href="../modify/modifyCompany" class="text-decoration-none fs-5 fw-bold">기업정보수정</a><br /><br />
					
				</div>
				</div>
				
				<div class="col-md-5" id="mypageCommunity">	
						<p class="fw-bold fs-2" >관심있는 인재 </p>
				</div>
				<!-- 캐러셀 -->
					<div class="col-md-6" id="carousel1" style="float: left;">
						<div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="carousel">
						   <div class="carousel-inner">
							  <c:forEach var="dto" items="${aList }" varStatus="i" >
						    	<div class="carousel-item active">
						      <!-- <img src="../resources/img/heart0.png" class="d-block w-100" alt="..."> -->
						         <a href="/goodjob/resuemeListDetail?ano=${dto.ano}">
						     	  <div class="detail">
								      <h3>${dto.atitle}</h3>
								      <h3>${nList[i.index] }</h3>
								      <button type="button" class="btn btn-outline-primary">${TIList[i.index] }</button>
						    	  </div>
						    	 </a> 
						   	    </div>
						   	  </c:forEach>
						    </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div>
				<div class="col-md-5" id="interestCompany">	
				<p class="fw-bold fs-2" >등록한 공고 </p>
				</div>
				<div class="col-md-6" id="carousel2" style="float: left;">
					<!-- 캐러셀 -->
						<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-inner">
						  <c:forEach var="dto" items="${hList }" varStatus="j">
						    <div class="carousel-item active">
						      <!-- <img src="../resources/img/heart0.png" class="d-block w-100" alt="..."> -->
						      
						      <div class="posting">
						      <div class="row">
							      <div class="col-6"></div>
							      <div class="col-3"><a class="btn btn-secondary" href="/hire/hireWriterModify2?hno=${dto.hno }" role="button" id="btnModify">수정</a></div>
							      <div class="col-3"><a class="btn btn-secondary" href="/deleteHireWriter?hno=${dto.hno }" role="button" id="btnDelete">삭제</a></div>
						      <a href="/goodjob/hire/hiredetail?hno=${dto.hno}">
							      <div class="col-10"><p class="fs-2">${dto.htitle }</p></div>
						      </a>
							      <div class="col-10"><p class="fs-4">${locaList[j.index] }/${dto.hworkinfo }/${dto.hform }</p></div><div class="col-2"><img class="like" id="likeImg" src="../images/bookmark1.png" alt="좋아요" />${bookMarkNo }</div>
							      <div class="col-10"><p class="fs-5">${dto.hdate }</p></div>
						      </div>
						      </div>
						    </div>
						    </c:forEach>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div> <!-- carousel end -->
					
					
					<!-- Button trigger modal 회원탈퇴-->
						<div class="col-md-3" id="drop">
						<button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="dropButton">
						  기업회원탈퇴
						</button>
						</div>
						
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="staticBackdropLabel">기업회원 탈퇴</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      	
						      	 <table class="table">
							      	<tr>
							      		<th><p class="fs-5 fw-bold fst-italic">기업회원 탈퇴 전, 안내사항을 꼭 확인해 주세요</p></th>
							      	</tr>
							      	<tr>
							      		<td><p class="fw-bold fs-6">탈퇴 아이디 복구 불가</p><br />탈퇴 후에는 아이디와 데이터 복구가 불가능 합니다<br />신중하게 선택하시기 바랍니다</td>
							      	</tr>
							      	<tr>
							      		<td><p class="fw-bold fs-6">서비스 이용기록 삭제 안내</p><br />채용공고, 이력서 열람정보 등 인재채용에 필요한 서비스 이용기록이 모두 삭제되며. 삭제된 데이터는 복구되지 않습니다</td>
							      	</tr>
							      	<tr>
							      		<td><p class="fw-bold fs-6">등록한 공고 삭제 불가 안내</p><br />삭제를 원하는 게시글은 반드시 회원탈퇴 전 삭제하시기 바랍니다.</td>
							      	</tr>
						        </table> 
						           <div class="mb-3 row">
								    <label for="inputPassword" class="col-sm-2 col-form-label" style="width:200px;">비밀번호 재확인</label>
								    <div class="col-sm-10" style="width:300px">
								      <input type="password" class="form-control" id="inputPassword">
								    </div>
								  </div>
								   <div class="form-check">
									  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
									  <label class="form-check-label" for="flexCheckDefault">
									   안내 사항을 모드 확인헀으며, 이에 동의합니다.
									  </label>
								  </div>  
						        
						      </div>
						      <div class="modal-footer" >
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
						        <button type="button" class="btn btn-primary" onclick="deleteCompany();">탈퇴하기</button>
						      </div>
						    </div>
						  </div>
						</div>
					<!-- <div class="col-md-3" style="background-color: white;" id="drop">
					<a href="#" class="drop"><p class="fs-5 ">회원탈퇴</p></a>
					</div>  --> 
<!-- 			<div class="row">
				<div class="col-md-5" id="mset">
					<div class="mlink">
						<a href="#"><h4 class="offset-md-3">이력서관리</h4></a>
						<a href="../modify/modifyMember"><h4 class="offset-md-3">개인정보수정</h4></a>
					</div>
				</div>
					<a href="#" class="drop">회원탈퇴</a>
			</div> -->
				
		</div>
	</div>
	</div>
	<div class="container" id="footer">
		<div class="footerTop">
			<div class="logo">
				<img src="../images/logo.png" alt="" id="logoImg">
			</div>
			<div class="footerLinks">
				<a href="#">기업소개</a>
				<a href="#">이용약관</a>
				<a href="#">개인정보 처리방침</a>
				<a href="#">고객센터</a>
				<span class="app">
					<img src="../images/insta.jpg" alt="" id="appImg" />
					<img src="../images/facebook.jpg" alt="" id="appImg" />
					<img src="../images/kakao.jpg" alt="" id="appImg" />
					<img src="../images/apple.jpg" alt="" id="appImg" />
					<img src="../images/android.jpg" alt="" id="appImg" />
				</span>
			</div>
		</div>
		<div class="footerText">
			<p>
				(주)굿잡 (대표이사:정희록) | 서울특별시 송파구 올림픽로 300 롯데월드타워 40층 | 통신판매번호 : 2022-서울송파-7019
				<br />
				유료직업소개사업등록번호 : (국내) 제2022-1907229-14-5-00018호 | (국외) 서울동부-유-2022-7 | 사업자등록번호 : 200-19-00022 | 02-719-5118
				<br />
				© goodjob,Inc. All rights reserved.
			</p>
		</div>		
	</div>

</body>
</html>