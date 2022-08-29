<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bdto.btitle}</title>
<!-- bootstrap cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<!-- bootstrap icon cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
	*{
		margin: 0;
		padding: 0;
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
		width : 900px;
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
		width : 900px;
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
		background-color: white;
		font-weight: 700;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		// 선택했던 tag 클릭된 상태로 보여주기
 		$("button[value='${bdto.btag}']").addClass("active");

		// 선택한 태그 input:hidden에 담아주기
		$(".hiddenBtag")[0].value = "${bdto.btag}";
		
		// 태그 클릭시 클릭 유지, 다른 버튼태그는 원상태로
		$(".tagBtn").click(function(){
			$(this).addClass("active");
			$(".tagBtn").not(this).removeClass('active');
			// tag버튼의 value값을 hidden에 담아 전달
			$(".hiddenBtag")[0].value = $(this)[0].innerText;
		});
		
		// 이미 입력했던 글자수 표시
		$(".titleCount").text($("textarea[name=btitle]").val().length+"자");
		$(".contentsCount").text($("textarea[name=bcontents]").val().length+"자");
		
		// 제목 글자수 표시
		$(".titleArea").keydown(function(e){
			var txtLength = $("textarea[name=btitle]").val().length;
			// 엔터키 막아주는 코드
			if (event.keyCode==13) return false;
			if(txtLength<=30){
				$(".titleCount").text(txtLength+"자");
			}
		});
		// 본문 글자수 표시
		$(".contentsArea").keydown(function(e){
			var txtLength = $("textarea[name=bcontents]").val().length;
			if(txtLength<=1000){
				$(".contentsCount").text(txtLength+"자");
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
		<div class="h1" style="margin: 100px 0 150px 0">커뮤니티 글 수정</div>
	</div>

	<div class="bg-lightr back">
	<form action="/comm/commModify" method="post">
		<input type="hidden" name="bno" value="${bdto.bno}" />
		<div class="container innerback" style="max-width: 1000px;">
			<div class="container boardList">
				<div class="container idHeader">
					<div style="font-weight: 700; margin-left: 30px; margin-top:10px; ">태그 선택(택1)</div>
					<div class="container tagHeader">
						<button type="button" class="btn mx-3 tagBtn" value="취준" >취준</button>
						<button type="button" class="btn mx-3 tagBtn" value="이직" >이직</button>
						<button type="button" class="btn mx-3 tagBtn" value="회사생활" >회사생활</button>
						<button type="button" class="btn mx-3 tagBtn" value="라이프스타일" >라이프스타일</button>
						<button type="button" class="btn mx-3 tagBtn" value="잡담" >잡담</button>
						<button type="button" class="btn mx-3 tagBtn" value="Q&A" >Q&A</button>
					</div>
					<input type="hidden" class="hiddenBtag" name="btag" />
				</div>
			</div>
			<div class="container titleArea" style="width: 870px;">
				<div class="titleLengthWrap" >
			    	<span class="titleCount" >0자</span><span class="titleTotal">/30자</span>
			    </div>
				<textarea name="btitle" rows="1" maxlength="30" placeholder="제목을 입력해주세요(30자 이하)" >${bdto.btitle}</textarea>
			</div>
			<div class="container contentsArea" style="width: 870px;">
			<div class="contentsLengthWrap" >
			    <span class="contentsCount">0자</span><span class="contentsTotal">/1000자</span>
			</div>
				<textarea name="bcontents" maxlength="1000" placeholder="내용을 작성해주세요(1000자 이하)" >${bdto.bcontents}</textarea>
			</div>
		</div>
		<div style="padding-bottom: 30px; padding-top: 30px;">
			<input style="margin-top: -60px" class="btn btn-primary" type="submit" value="수정하기" />
		</div>
	</form>
	</div>
	
	<!-- footer include -->
	<jsp:include page="../main/footer.jsp" />
	
</body>
</html>