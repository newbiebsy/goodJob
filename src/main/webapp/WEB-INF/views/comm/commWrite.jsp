<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성</title>
<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- bootstrap icon cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	*{
		margin: 0;
		padding: 0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.back{
		background-color: #F4F4F4;
		text-align: center;
	}
	.innerback{
		background-color: white;
		display: inline-block;
		margin: 50px 50px;
		width: 1000px;
	}
	.boardList{
		width : 900px;
		text-align: left;
		margin-top: 10px;
	}
	.idHeader{
		line-height: 5em;
	}
	.tagHeader{
		margin-top: -20px;
		margin-left: -30px;
	}
	.titleArea{
		margin-top: 20px;
		border-bottom: 2px solid silver;
		text-align: left;
	}
	.titleArea > textarea {
		width : 100%;
		border: 0;
		outline: none;
		resize: none;
		font-size: 25px;
		font-weight: 700;
		white-space: pre-wrap;
	}
	.contentsArea{
		margin-top: 40px;
		text-align: left;
	}
	.contentsArea > textarea {
		width : 100%;
		height: 500px;
		border: 0;
		outline: none;
		resize: none;
		font-size: 18px;
		font-weight: 700;
		white-space: pre-wrap;
	}
	.titleLengthWrap{
		float:right; 
		position: relative;
		top: 30px;
	}
	.titleCount, .titleTotal{
		font-weight: 700;
		color: gray;
	}
	.contentsLengthWrap{
		float:right; 
	}
	.contentsCount, .contentsTotal{
		font-weight: 700;
		color: gray;
	}
	.tagHeader > .tagBtn {
		background-color: #f2f4f7;
		font-size: 15px;
		padding : 0 20px;
		height: 50px;
	}
	.tagHeader > .tagBtn:hover{
		background-color: #fff;
		font-weight: 700;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		// 태그 클릭시 클릭 유지, 다른 버튼태그는 원상태로
		$(".tagBtn").click(function(){
			$(this).addClass('active');
			$(".tagBtn").not(this).removeClass('active');
			// tag버튼의 value값을 hidden에 담아 전달
			$(".hiddenBtag")[0].value = $(this)[0].innerText;
		});
		
		
		// 제목 글자수 표시
		$(".titleArea").keydown(function(e){

			// 엔터키 막아주는 코드
			if (event.keyCode==13) return false;

			var content = $("textarea[name=btitle]").val();
			if(content.length<=30){
				$(".titleCount").text(content.length+"자");
			}
		});
		
		// 본문 글자수 표시
		$(".contentsArea").keydown(function(e){
			var content = $("textarea[name=bcontents]").val();
			if(content.length<=1000){
				$(".contentsCount").text(content.length+"자");
			}
		});
		
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
		<div class="h1" style="margin: 100px 0 150px 0">커뮤니티 글 작성</div>
	</div>
	
	<div class="bg-light back">
	<form action="/goodjob/comm/commWrite" method="post">
		<div class="container innerback" style="max-width: 1000px;">
			<div class="container boardList">
				<div class="container idHeader">
					<div style="font-weight: 700; margin-left: 30px; margin-top:10px; ">태그 선택(택1)</div>
					<div class="container tagHeader">
						<button type="button" class="btn mx-3 tagBtn" autofocus="autofocus" >취준</button>
						<button type="button" class="btn mx-3 tagBtn"  >이직</button>
						<button type="button" class="btn mx-3 tagBtn" >회사생활</button>
						<button type="button" class="btn mx-3 tagBtn" >라이프스타일</button>
						<button type="button" class="btn mx-3 tagBtn" >잡담</button>
						<button type="button" class="btn mx-3 tagBtn" >Q&A</button>
					</div>
					<input type="hidden" class="hiddenBtag" name="btag" />
				</div>
			</div>
			<div class="container titleArea" style="width:870px;">
				<div class="titleLengthWrap" >
			    	<span class="titleCount">0자</span><span class="titleTotal">/30자</span>
			    </div>
				<textarea name="btitle" rows="1" maxlength="30" placeholder="제목을 입력해주세요(30자 이하)"  ></textarea>
			</div>
			<div class="container contentsArea" style="width:870px;">
			<div class="contentsLengthWrap" >
			    <span class="contentsCount">0자</span><span class="contentsTotal">/1000자</span>
			</div>
				<textarea name="bcontents" maxlength="1000" placeholder="내용을 작성해주세요(1000자 이하)" ></textarea>
			</div>
		</div>
		<div style="padding-bottom: 30px; padding-top: 30px;">
			<input style="margin-top: -60px" class="btn btn-primary" type="submit" value="등록하기" />
		</div>
	</form>
	</div>
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" />
</body>
</html>