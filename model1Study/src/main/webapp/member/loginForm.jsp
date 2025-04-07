<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN FORM</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>

<form action="login.jsp" method="post" name="f" onsubmit="return input_check(this)">
<table><caption>로그인</caption>
<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
<tr><th>PW</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2"><button>로그인</button>
<button type="button" onclick="location.href='joinForm.jsp'">회원가입</button>
<button type="button" onclick="win_open('idForm')">아이디찾기</button>
<button type="button" onclick="win_open('pwForm')">PW찾기</button>
</td></tr>
</table>
</form>

<%--
 1.input check(this)
 2.win_open('pwForm')
 --%>
 
 <script>
 function input_check(f){
	if(f.id.value.trim() == ""){
		alert("아이디 입력하세요");
		f.id.focus();
		return false;
	}
	else if(f.pass.value.trim() == ""){
		alert("비번입력");
		return false;
	}
	return true;
 }
 
 function win_open(page){
	 open(page+".jsp","","width=500,height=500,top=100 left=100" );
 }
 
 </script>



</body>
</html>