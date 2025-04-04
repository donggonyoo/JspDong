<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<!--  onsubmit :  나의 form 내부에 submit버튼 클릭되면 
			form 태그에 이벤트 발생(target == form)
return input_check(this) : input_check()함수 호출 , 매개변수this : form객체를 의미					
				-->
<form action="join.jsp" name="f" method="post" onsubmit="return input_check(this)">
	<input type="hidden" name="picture" value="">
	<table>
		<tr>
		<td rowspan="4" valign="bottom">
		<img src="" width="100" height="120"  id="pic"><br>
		<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
		</td><th>아이디</th>
		<td><input tpye="text" name="id">
		<button type="button" onclick="idchk()">중복검색</button>
		</td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>성별</th>
		<td>
		<label for="gender1">남</label>
		<input type="radio" name="gender" id="gender1" value="1">
		<label for="gender2">여</label>
		<input type="radio" name="gender" id="gender2" value="2">
		</td></tr>
		<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
		<tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
		<!-- button태그의 기본type : submit임 -->
		<tr><td colspan="3"><button>회원가입</button></td></tr>
	</table>
</form>
<script src="joinFormJS.js"></script>
</body>
</html>