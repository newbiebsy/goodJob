<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
<!-- Bootstrap icon CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
<!-- Jquery Ui CSS -->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<!-- JQUERY -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
	
	
* {
	font-size: 16px;
}
a{
	color: black;
	text-decoration: none;
}
p{
	display:inline;	
	padding:5px;
}
.container{
	width:40%;
} 
.row{
	float: none;
	margin:auto;
	padding-top: 50px;
	
}
.fs-2 fw-bolder{

}
.form-control{
	margin:10px;
}
.form-select{
	margin:10px;
}
</style>
<script>
var idchk = false; // 아이디 검사
var pwdchk = false; // 패스워드
var pwdconfrimchk = false; // 패스워드 확인
var namechk = false; // 이름
var emchk = false; // 이메일
var emconfirmchk = false; // 이메일 인증
var birchk = false; // 생일
var phchk = false; // 핸드폰


$(function() {
	var $mid = $("#mid");
	var $id = $("#id");
	var $mpwd = $("#mpwd");
	var $mname = $("#mname");
	var $pwdconfrim = $("#pwdconfrim");
	var $memail = $("#memail");
	var $mbrith = $("#mbrith");
	var $mphone = $("#mphone");
	
	var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
	var $memailconfirm = $("#memailconfirm"); // 인증번호 확인input
	var $memailconfirmTxt = $("#memailconfirmTxt"); // 인증번호 확인 txt
	
	//console.dir("mid : "+$mid);
	

	// 비밀번호 정규식
	$mpwd.on("keyup", function() {
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		//console.log("email : "+$memail.val());
		if (!regExp.test($mpwd.val())) {
			//console.log("형식 미확인");

			$("#pwdnew").html("<span id='chkpwd'>패스워드 형식이 맞지 않습니다</span>")
			$("#chkpwd").css({
				"color" : "red",
				"font-weight" : "bold",
				"font-size" : "15px"
			})
			pwdchk = false;
		} else {
			//console.log("형식 확인");
			$("#pwdnew").html("<span id='chkpwd'>패스워드 형식을 확인했습니다</span>")
			$("#chkpwd").css({
				"color" : "blue",
				"font-weight" : "bold",
				"font-size" : "15px"
			})
			pwdchk = true;
			//console.log("idchk : "+idchk);
			//console.log("pwdconfrimchk : "+pwdconfrimchk);
			//console.log("emlchkchk : "+emlchkchk);

		}
	})

	// 패스워드 2중 검사
	$pwdconfrim.on("keyup", function() {
		if ($pwdconfrim.val() != $mpwd.val()) {
			pwdconfrimchk = false;
			//console.log("불일치");
			$("#pwdText").html("<span id='checkpwd'>비밀번호가 달라요!</span>")
			$("#checkpwd").css({
				"color" : "red",
				"font-weight" : "bold",
				"font-size" : "15px"
			})
		} else {
			pwdconfrimchk = true;
			//console.log("동일한 비밀번호");
			$("#pwdText").html("<span id='checkpwd'>비밀번호 일치 확인</span>")
			$("#checkpwd").css({
				"color" : "blue",
				"font-weight" : "bold",
				"font-size" : "15px"

			})
		}
	})



	// 생년월일 정규식 검사
	$mbrith.on("keyup",function() {
						var regExp = /([0-9]{4}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
						//console.log("email : "+$memail.val());
						if (!regExp.test($mbrith.val())) {
							//console.log("형식 미확인");
							birchk = false;

							$("#birTxt")
									.html(
											"<span id='chkbir'>생년월일 형식이 맞지않습니다</span>")
							$("#chkbir").css({
								"color" : "red",
								"font-weight" : "bold",
								"font-size" : "15px"
							})
						} else {
							birchk = true;

							//console.log("형식 확인");
							$("#briTxt")
									.html(
											"<span id='chkbir'>생년월일 형식을 확인했습니다</span>")
							$("#chkbir").css({
								"color" : "blue",
								"font-weight" : "bold",
								"font-size" : "15px"
							})
							//console.log("idchk : "+idchk);
							//console.log("pwdconfrimchk : "+pwdconfrimchk);
							//console.log("emlchkchk : "+emlchkchk);

						}
					})

	// 이메일 정규식 검사
	$memail.on("keyup",function() {
						var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						//console.log("email : "+$memail.val());
						if (!regExp.test($memail.val())) {
							//console.log("형식 미확인");
							emchk  = false;

							$("#mailTxt")
									.html(
											"<span id='chkmail'>이메일 형식이 맞지 않습니다</span>")
							$("#chkmail").css({
								"color" : "red",
								"font-weight" : "bold",
								"font-size" : "15px"
							})
						} else {
							emchk  = true;

							//console.log("형식 확인");
							$("#mailTxt")
									.html(
											"<span id='chkmail'>이메일을 형식을 확인했습니다</span>")
							$("#chkmail").css({
								"color" : "blue",
								"font-weight" : "bold",
								"font-size" : "15px"
							})
						}
					})
					


	// 핸드폰 번호
	$mphone.on("keyup", function() {
		var regExp = /^\d{3}\d{4}\d{4}$/;
		//console.log("email : "+$memail.val());
		if (!regExp.test($mphone.val())) {
			//console.log("형식 미확인");

			$("#phoneTxt").html(
					"<span id='chkphone'>핸드폰 번호 형식이 맞지 않습니다</span>")
			$("#chkphone").css({
				"color" : "red",
				"font-weight" : "bold",
				"font-size" : "15px"
			})
			phchk = false;
		} else {
			//console.log("형식 확인");
			$("#phoneTxt").html(
					"<span id='chkphone'>핸드폰 번호를 형식을 확인했습니다</span>")
			$("#chkphone").css({
				"text-align" : "center",
				"color" : "blue",
				"font-weight" : "bold",
				"font-size" : "15px"
			})
			phchk = true;
			//console.log("idchk : "+idchk);
			//console.log("pwdconfrimchk : "+pwdconfrimchk);
			//console.log("emlchkchk : "+emlchkchk);

		}
	})

	// selectBox 관련 JS
	var selectTarget = $('.selectbox select');

	// focus 가 되었을 때와 focus 를 잃었을 때
	selectTarget.on({
		'focus' : function() {
			$(this).parent().addClass('focus');
		},
		'blur' : function() {
			$(this).parent().removeClass('focus');
		}
	});

	selectTarget.change(function() {
		var select_name = $(this).children('option:selected').text();
		$(this).siblings('label').text(select_name);
		$(this).parent().removeClass('focus');
	});

});



// formSubmit 함수
function formSubmit(){
	
	//console.log("수정버튼눌림");
	console.log("pwdchk : "+pwdchk)
	console.log("pwdconfrimchk : "+pwdconfrimchk)		
	console.log("select : "+$("#select").val())
	//console.log("namechk : "+namechk)
	if(!pwdchk){
		frm.mpwd.focus();
		alert("비밀번호를 확인해주시기 바랍니다")
		return false;
	}else if(!pwdconfrimchk){
		frm.pwdconfrim.focus();
		alert("비밀번호를 확인해주시기 바랍니다")
		return false;
	}else if($("#select").val() == "none"){
		frm.tno.focus();
		alert("관심분야를 선택해주시기 바랍니다")
		return false;
	}else if(!birchk){
		frm.mbrith.focus();
		alert("생년월일을 확인해주시기 바랍니다")
		return false;
	}
		return true;
	
	//console.log("birchk : "+birchk)
	//console.log("emchk : "+emchk)
	//console.log("emconfirmchk : "+emconfirmchk)
	//console.log("phchk : "+phchk)
	/* if(!idchk){
		frm.mid.focus();
		return false;
	}else if(!pwdchk){
		frm.mpwd.focus();
		return false;
	}else if(!pwdconfrimchk){
		frm.pwdconfrim.focus();
		return false;
	}else if(!phchk){
		frm.mphone.focus();
		return false;
	}else if($("#select").val() == "none"){
		frm.tno.focus();
		return false;
	}else{
		return true;
	} */
	
	
}
	
	
</script>
</head>
<body>
	
	<div class="container">
	<form action="/goodjob/modifyMemberOk" name="frm" method="post" onsubmit="return formSubmit()">
		<p class="fs-1 fw-bolder">개인정보수정</p>
			<div class="row">
				<input class="form-control" type="hidden" value="${mdto.mno }" aria-label="Disabled input example" id="mno" >
				<span>
					<p class="fs-2 fw-bolder">아이디</p>
				</span>
				<input class="form-control" type="text" value="${mdto.mid }" aria-label="Disabled input example" disabled readonly>
				<span>
					<p class="fs-2 fw-bolder">이름</p>
				</span>
				<input class="form-control" type="text" value="${mdto.mname }" aria-label="Disabled input example" disabled readonly>
				<span>
					<p class="fs-2 fw-bolder">생년월일</p>
				</span>
				<label for="mbirth" id="birTxt"></label>
				<input class="form-control" type="text" value="${mdto.mbirth }" aria-label="Disabled input example" name="mbrith" id="mbrith">
				<span>
					<p class="fs-2 fw-bolder">비밀번호</p>
				</span>
				<label for="mpwd" id="pwdnew"></label>
				<input class="form-control" type="password" placeholder="비밀번호를 입력해주세요(8~20자)" aria-label="default input example" id="mpwd" name="mpwd">
				
				<label for="pwdconfrim" id="pwdText"></label>
				<input class="form-control" type="password" value="" placeholder="비밀번호 확인" aria-label="default input example" id="pwdconfrim">
				<span>
					<p class="fs-2 fw-bolder">이메일</p> <!-- <button type="submit" class="btn btn-primary mb-3" style="float:right; position:relative; top:10px;" id="checkEmail">이메일 인증</button> -->
				</span>
				<label for="memail" id="mailTxt"></label>
				<input class="form-control" type="text" value="${mdto.memail }" placeholder="이메일을 입력해주세요" aria-label="default input example" id="memail">
				 
				<span>
					<p class="fs-2 fw-bolder">핸드폰번호</p>
				</span>
				<label for="mphone" id="phoneTxt"></label>
				<input class="form-control" type="text" value="${mdto.mphone }" placeholder="핸드폰번호를 입력해주세요(하이픈 제외)" aria-label="default input example" name="mphone" id="mphone">
				<span>
					<p class="fs-2 fw-bolder">관심분야</p>
				</span>
					  <select class="form-select" id="select" aria-label="Floating label select example" name="tno">
					    <option selected value="none">관심분야를 선택해주세요(1개)</option>
					    			<option value=1>서비스업</option> 
									<option value=2>제조·화학</option>
									<option value=3>IT·웹·통신</option>
									<option value=4>은행·금융업</option>
									<option value=5>미디어·디자인</option>
									<option value=6>교육업</option>
									<option value=7>의료·제약·복지</option>
									<option value=8>판매·유통</option>
									<option value=9>건설업</option>
									<option value=10>기관·협회</option>
					  </select>
				<div class="row" style="text-align: center;">
					<button type="button" class="btn btn-secondary col-6 " onclick="location.href='../myPage/myPageMember'">취소</button>
					<button type="submit" class="btn btn-primary col-6">수정</button>
				</div>
				
			</div>
			</form> 
	
	</div>
	
</body>
</html>