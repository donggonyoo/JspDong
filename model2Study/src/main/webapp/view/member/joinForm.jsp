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
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
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
		<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" class="form-control"></td></tr>
		<tr><th>이메일</th><td colspan="2"><input type="text" name="email" class="form-control"></td></tr>
		<!-- button태그의 기본type : submit임 -->
		<tr><td colspan="3"><button class="btn btn-outline-dark">회원가입</button ></td></tr>
	</table>
</form>
<script>
function idchk() {
    var idValue = document.getElementById("id").value;  
    if (idValue) {
    	let op = "width=500,height=500 ,top=50 ,left=150";
    	open("idcheck","",op);
    } else {
        alert("아이디를 입력해 주세요.");
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
	return true;//아이디비번이름이 입력됐다면 true
}

function win_upload(){
	let op = "width=500,height=500 ,top=50 ,left=150";
	open("pictureForm","",op);
	//pictureForm.jsp를 연다
}

function idchk(){
if(document.f.id.value==''){
	alert("아이디를 입력하세요");
	document.f.id.focus();
	}
else{
	let op="width=500,height=200,left=50,right=150";
	open("idchk?id="+document.f.id.value,"",op);
}
	
}

</script>
</body>
</html>