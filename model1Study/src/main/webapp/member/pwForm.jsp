<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/pwForm.jsp--%>    
<!DOCTYPE html>
<html>
<!-- 비밀번호찾기버튼 클릭시 유효성검사 실시 추가 -->
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head><body><h3>비밀번호찾기</h3>
<form action="pw.jsp" method="post" onsubmit="return input_check(this)">
  <table>
     <tr><th>아이디</th><td><input type="text" name="id"></td></tr>
     <tr><th>이메일</th><td><input type="text" name="email"></td></tr>
     <tr><th>전화번호</th><td><input type="text" name="tel"></td></tr>
     <tr><td colspan="2"><input type="submit" value="비밀번호찾기"></td></tr>
     <!-- submit을 누르면 pw.jsp로 넘어간다 -->
  </table>	
</form></body>
<script>
function input_check(f){
	if(f.id.value.trim() == ""){
		alert("ID입력바람")
		return false;
	}
	else if(f.email.value.trim() == ""){
		alert("Email입력바람")
		return false;
	}
	else if(f.tel.value.trim() == ""){
		alert("전화번호입력바람")
		return false;
	}
	else if(!isValidEmail(f.email.value.trim())){
		alert("올바르지않은 이메일형식")
		f.email.focus()
		return false;
	}
	else if(!isValidTel(f.tel.value.trim())){
		alert("올바르지않은 전화번호형식")
		f.tel.focus()
		return false;
	}
	else{
		return true;
	}
	
	function isValidEmail(email){
		const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,}$/;
		return regex.test(email);
		/*
		   /^  .... $/ => 정규표현식 시작과 끝
		   [a-zA-Z0-9._%+-]+ : 대소문자 숫자 . - % + - 중  1개이상
		   @[a-zA-Z0-9._]+ : @ 문자뒤에 대소문자 숫자.  _ 중 한개이상
		   \. : .문자
		[a-zA-Z]{2,} : 대소문자 2개이상
		*/
	}
	
	
	function isValidTel(tel){
		const regex = /^(02|01[0126789])-?\d{3,4}-?\d{4}$/;
		return regex.test(tel);
/*
	(02|01[0126789])  : 02 or 010 011 ...019
	-?  : - 가 0 또는 1개
	\d{3,4}  : 숫자 3개or4개	
	\d{4} : 숫자4개
*/
	}
	
}
</script>
</html>