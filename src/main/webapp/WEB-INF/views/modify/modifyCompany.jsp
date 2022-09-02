<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>

</head><!-- Bootstrap CSS -->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- 다음주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
#addressBtn{
	position:relative;
	top:10px;
}
</style>
<script>
	window.onload = function(){
		var btn1 = document.getElementById("addressBtn");
		btn1.onclick = openKakao;
		
	}
	
	function openKakao(){
		new daum.Postcode({
			oncomplete : function(data){
				document.getElementById("caddr").value = data.roadAddress;
					$("#caddr").val(addr);
	                $("#caddr2").val(extraAddr)
	                
	               
				document.getElementById("caddr2").focus();
			}
		}).open();
	}
	
	var cbinchk = false;
	var cnamechk = false;
	var ceochk = false;
	var caddrchk = false;
	var csetupchk = false;
	var csaleschk = false;
	var cpeoplechk = false;
	var chomepagechk = false;

	var idchk = false; // 아이디 검사
	var pwdchk = false; // 패스워드
	var pwdconfrimchk = false; // 패스워드 확인
	var cmanagerchk = false; // 담당자 확인
	var phchk = false; // 대표번호
	var emchk = false; // 이메일
	var emconfirmchk = false; // 이메일 인증
	

	$(function() {
		
		var $cbin = $("#cbin"); // 사업자 등록 번호
		var $cname = $("#cname"); // 회사명
		var $ceo = $("#ceo"); // 대표자명
		var $caddr = $("#caddr"); // 주소
		var $csetup = $("#csetup"); // 설립일
		var $csales = $("#csales"); // 매출액
		var $cpeople = $("#cpeople"); // 사원수
		
		var $cid = $("#cid"); // 아이디
		var $id = $("#id"); 
		var $cpwd = $("#cpwd"); // 패스워드
		var $cpwdconfrim = $("#cpwdconfrim"); // 패스워드 확인
		var $cmanager = $("#cmanager"); // 담당자명
		var $cemail = $("#cemail"); // 이메일
		var $cphone = $("#cphone"); // 대표번호
		
		var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
		var $cemailconfirm = $("#cemailconfirm"); // 인증번호 확인input
		var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
		
		//console.dir("mid : "+$mid);
		
	
		// 비밀번호 정규식
		$cpwd.on("keyup", function() {
			var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
			console.log("email : ");
			if (!regExp.test($cpwd.val())) {
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
		$cpwdconfrim.on("keyup", function() {
			if ($cpwdconfrim.val() != $cpwd.val()) {
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

		// 담당자명 확인
		$cmanager.on("keyup", function() {
			if ($cmanager.val() == "") { // id 가 공백인 경우 체크
				cmanagerchk  = false;
				$("#cmanagerTxt").html("<span id='nmchk'>이름을 필수입니다</span>");
				$("#nmchk").css({
					"color" : "red",
					"font-weight" : "bold"
				})
			} else {
				cmanagerchk  = true;
				$("#nmchk").hide();
			}
		})
		
		// 핸드폰 번호
		$cphone.on("keyup", function() {
			var regExp = /^\d{2,3}\d{4}\d{4}$/;
			//console.log("email : "+$memail.val());
			if (!regExp.test($cphone.val())) {
				//console.log("형식 미확인");
				$("#phoneTxt").show();

				$("#phoneTxt").html(
						"<span id='chkphone'>번호 형식이 맞지 않습니다</span>")
				$("#chkphone").css({
					"color" : "red",
					"font-weight" : "bold",
					"font-size" : "15px"
				})
				phchk = false;
			} else {
				//console.log("형식 확인");
				$("#phoneTxt").hide();
				phchk = true;
			}
		})



		// 이메일 정규식 검사
		$cemail.on("keyup",function() {
							var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							//console.log("email : "+$memail.val());
							if (!regExp.test($cemail.val())) {
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
		
		/* console.log("cbin : "+cbinchk)
		console.log("cnamechk : "+cnamechk)
		console.log("ceochk : "+ceochk)
		console.log("caddrchk : "+caddrchk)
		console.log("csetupchk : "+csetupchk)
		console.log("csaleschk : "+csaleschk)
		console.log("cpeoplechk : "+cpeoplechk)
		console.log("chomepagechk : "+chomepagechk)
		
		console.log("idchk : "+idchk)
		console.log("pwdchk : "+pwdchk)
		console.log("pwdconfrimchk : "+pwdconfrimchk)
		console.log("cmanagerchk : "+cmanagerchk)
		console.log("phchk : "+phchk)
		console.log("emchk : "+emchk)
		console.log("emconfirmchk : "+emconfirmchk) */
		
		
	
			
 	     if($("#caddr").val()==""){
			frm.caddr.focus();
			alert("주소를 입력해주시기 바랍니다")
			return false;
		}else if(!pwdchk){
			frm.cpwd.focus();
			alert("비밀번호를 입력해주시기 바랍니다")
			return false;
		}else if(!pwdconfrimchk){
			frm.cpwdconfrim.focus();
			return false;
		}
			return true;
		} 
	
</script>
</head>
<body>
	
	<div class="container">
	<form action="/goodjob/modifyCompanyOk" name="frm" method="post" onsubmit="return formSubmit()" >
		<p class="fs-1 fw-bolder">기업정보수정</p>
			<div class="row">
				<span>
					<p class="fs-2 fw-bolder">사업자등록번호</p>
				</span>
				<div class="col-12">
				<input class="form-control" type="text" name="cbin" id="cbin" value="${cdto.cbin }" aria-label="Disabled input example" disabled readonly>
				</div>
				<!-- <span>
					<p class="fs-2 fw-bolder">이름</p>
				</span>
				<input class="form-control" type="text" value="이름" aria-label="Disabled input example" disabled readonly>
				<span>
					<p class="fs-2 fw-bolder">생년월일</p>
				</span>
				<input class="form-control" type="text" value="생년월일" aria-label="Disabled input example" disabled readonly> -->
				<div class="col-12">
					<p class="fs-2 fw-bolder">기업정보</p>
				</div>
				<input class="form-control" type="hidden" id="cno" name="cno" value="${cdto.cno }" aria-label="Disabled input example"  >
				<div class="col-12">
					<div class="mb-3">
					 	<label for="exampleFormControlInput1" class="form-label" style="position:relative; top:10px; left:10px; ">기업명</label>
						<input class="form-control" type="text" id="cname" name="cname" value="${cdto.cname }" aria-label="Disabled input example" disabled readonly id="exampleFormControlInput1">
					</div>
				</div>
				<div class="col-12">
					<div class="mb-3">
					 	<label for="exampleFormControlInput2" class="form-label" style="position:relative; top:10px; left:10px; ">대표자명</label>
						<input class="form-control" type="text" name="ceo" id="ceo" value="${cdto.ceo }" aria-label="Disabled input example" disabled readonly id="exampleFormControlInput2">
					</div>
				</div>
				<div class="col-12">
					<div class="mb-3">
					 	<label for="exampleFormControlInput3" class="form-label" style="position:relative; top:10px; left:10px; ">설립일</label>
						<input class="form-control" type="text" value="${cdto.csetup }" aria-label="Disabled input example" disabled readonly id="exampleFormControlInput3" >
					</div>
				</div>
				<div class="col-10">
			   		 <input type="form-control" class="form-control" name="caddr" id="caddr" placeholder="주소입력" value="${cdto.caddr }">
			  	</div> 
				<div class="col-2">
				    <button type="button" class="btn btn-primary mb-3" id="addressBtn">주소</button>
				</div>
				<div class="col-12">
					<input class="form-control" type="text" placeholder="상세주소" aria-label="default input example" name="caddr2" id="caddr2">
				</div>
				
				<div class="col-12">
					<div class="mb-3"> 
					 	<label for="exampleFormControlInput4" class="form-label" style="position:relative; top:10px; left:10px; ">사원수</label>
						<input class="form-control" type="text" id="cpeople" name="cpeople" value="${cdto.cpeople }" placeholder="사원수" aria-label="default input example"  >
					</div>
				</div>
				<div class="col-12">
					<div class="mb-3">
					 	<label for="chomepage" class="form-label" style="position:relative; top:10px; left:10px; ">홈페이지 주소</label>
						<input class="form-control" type="text" id="chomepage" name="chomepage" value="${cdto.chomepage }" placeholder="홈페이지 주소" aria-label="default input example" >
					</div>
				</div>
				<div class="col-12">
					<p class="fs-2 fw-bolder">채용담당자 정보</p>
				</div> 
				<div class="col-12">
					<div class="mb-3">
						<label for="cid" class="form-label" style="position:relative; top:10px; left:10px; ">아이디</label>
						<input class="form-control" type="text" id="cid" name="cid" value="${cdto.cid }" aria-label="Disabled input example" disabled readonly>
					</div>
				</div>  
				<div class="col-12">
					<label for="cpwd" id="pwdnew" class="form-label" style="position:relative; top:10px; left:10px; ">비밀번호</label>
					<input class="form-control" type="password" id="cpwd" name="cpwd" placeholder="비밀번호를 입력해주세요(8~20자)" aria-label="default input example" id="exampleFormControlInput6">
				</div>  
				<div class="col-12">
					<label for="ecpwdconfrim" id="pwdText" class="form-label" style="position:relative; top:10px; left:10px; ">비밀번호 확인</label>
					<input class="form-control" type="password" id="cpwdconfrim" name="cpwdconfrim" placeholder="비밀번호 확인" aria-label="default input example">
				</div>  
				<div class="col-12">
					<div class="mb-3">
					 	<label for="cmanager" class="form-label" style="position:relative; top:10px; left:10px; ">담당자명</label>
						<input class="form-control" type="text" id="cmanager" name="cmanager" value="${cdto.cmanager }" placeholder="담당자명" aria-label="default input example"  >
					</div>
				</div>
				<div class="col-12">
					<div class="mb-3">
					 	<label for="cphone" id="phoneTxt" class="form-label" style="position:relative; top:10px; left:10px; ">대표전화번호</label>
						<input class="form-control" type="text" value="${cdto.cphone }" id="cphone" name="cphone" placeholder="대표전화번호" aria-label="default input example"  >
					</div>
				</div>
				<div class="col-12">
					<div class="mb-3">
					 	<label for="cemail" id="mailTxt" class="form-label" style="position:relative; top:10px; left:10px; ">대표이메일</label>
						<input class="form-control" type="text" value="${cdto.cemail }" id="cemail" name="cemail" placeholder="대표이메일" aria-label="default input example"  >
					</div>
				</div>
				<div class="row" style="text-align: center;">
					<button type="button" class="btn btn-secondary col-6 " onclick="location.href='../myPage/myPageCompany'">취소</button>
					<button type="submit" class="btn btn-primary col-6">수정</button>
				</div>
				
			</div>
			</form>
	
	</div>
</body>
</html>