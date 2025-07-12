<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>
<body>
<!--  onsubmit :  나의 form 내부에 submit버튼 클릭되면 
			form 태그에 이벤트 발생(target == form)
return input_check(this) : input_check()함수 호출 , 매개변수this : form객체를 의미					
				-->
<form action="join" name="f" method="post" onsubmit="return input_check(this)">
	<input type="hidden" name="picture" value=""><!-- 업로드된 이미지의 이름이 들어갈태그 -->
	<table class="table">
		<tr>
		<td rowspan="4" valign="bottom">
		<img src="" width="100" height="120"  id="pic"><br>
		<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
		
		</td><th>아이디</th>
		<td><input type="text" name="id"  class="form-control">
		<button type="button" onclick="idchk()" class="btn btn-dark" id="chk" name="chk">중복검색</button>
		</td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass" onkeyup="pChk(this)"></td></tr>
		<tr><td id="passValid"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>성별</th>
		<td>
		<label for="gender1" class="form-check-label">
		남<input type="radio" name="gender" id="gender1" value="1">
		</label>
		
		<label for="gender2" class="form-check-label">
		여<input type="radio" name="gender" id="gender2" value="2" >
		</label>
		
		</td></tr>
		<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" class="form-control" onkeyup="tChk(this)"></td></tr>
		<tr><td id="telValid"></td></tr>
		<tr><th>이메일</th><td colspan="2"><input type="text" name="email" class="form-control" onkeyup="eChk(this)"></td></tr>
		<tr><td id="emailValid"></td></tr>
		<!-- button태그의 기본type : submit임 -->
		<tr><td colspan="3"><button class="btn btn-outline-dark">회원가입</button ></td></tr>
	</table>
</form>
<script>
function pChk(p){
	const passVal = document.querySelector("#passValid");
	if(!valid(p.value,'pass')){
		passVal.innerHTML= '특수문자포함 8~16자리';
		passVal.style.color='red';
	}
	else{
		passVal.innerHTML= '유효한비밀번호';
		passVal.style.color='green';
	}
}
function tChk(t){
	const telVal = document.querySelector("#telValid");
	if(!valid(t.value,'tel')){
		telVal.innerHTML= '올바른 휴대폰번호입력바람';
		telVal.style.color='red';
	}
	else{
		telVal.innerHTML= '유효한 번호';
		telVal.style.color='green';
	}
}
function eChk(e){
	const emailVal = document.querySelector("#emailValid");
	if(!valid(e.value,'email')){
		emailVal.innerHTML= '올바른 Email형식작성하세요';
		emailVal.style.color='red';
	}
	else{
		emailVal.innerHTML= '유효한E-mail';
		emailVal.style.color='green';
	}
}

function valid(text,type){
	if(type==='email'){//넘어온값과 name=email의 값이 동일할때
		const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,}$/;
		return regex.test(text);
	}
	else if(type==='tel'){ //넘어온값과 name=tel의 값이 동일할때
		const regex = /^(01[0126789])-?\d{3,4}-?\d{4}$/;
		return regex.test(text);
	}
	else if(type==='pass'){ //비밀번호유효성검사
		const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,16}$/;
		//(?=.*[A-Za-z]) → 문자열 어딘가에 영문자가 있어야 해 (확인만)
		//\W : 특수문자 , [A-Za-z\d\W_]{8,16} : 해당문자들이 8개~16개존재해야함
		return regex.test(text);
	}
}

	
    
function input_check(f){
	//f : <form...>
	//f.id : <input name="id">name이 id인태그
	if(f.id.value.trim() == ""){ 
		alert("아이디입력")
		f.id.focus(); //name이id인 곳에 포커스를 둠
		return false; //기본이벤트 취소
	}
	if(f.pass.value.trim() == ""){ 
		alert("비밀번호입력")
		f.pass.focus();
		return false; 
	}
	if(f.name.value.trim() == ""){ 
		alert("이름입력")
		f.name.focus();
		return false; 
	}
	if(f.gender.value.trim() == ""){ 
		alert("성별체크")
		return false; 
	}
	if(f.tel.value.trim() == ""){ 
		alert("전화번호입력바람")
		f.tel.focus();
		return false; 
	}
	if(f.email.value.trim() == ""){ 
		alert("email입력바람")
		f.email.focus();
		return false; 
	}
	if(!(valid(f.pass.value.trim(),"pass")
		&& valid(f.email.value.trim(),"email")
		&& valid(f.tel.value.trim(),"tel"))){ //3개중 한개라도 유효성검사를 실패했다면 실행
	alert("형식을준수해주세요")
	return false;
	}
	
	return true;//아이디비번이름이 입력됐다면 true
}

function win_upload(){
	let op = "width=500,height=500 ,top=50 ,left=150";
	open("pictureForm","",op);
	//pictureForm.jsp를 연다 (해당페이지가 opener가 될것임)
}

</script>
</body>
</html>