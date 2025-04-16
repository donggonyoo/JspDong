<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 전 화면조회(updateForm.jsp)</title>
</head>
<body>
<form action="update" name="f" method="post" onsubmit="return input_check(this)">
<table><caption>회원정보수정</caption>
<tr><td rowspan="4" valign="bottom">
	<input type="hidden" name="picture" value="${mem.picture}">
	<img src="${pageContext.request.contextPath}/picture/${mem.picture}" width="100" height="120" id="pic"><br>
	<font sizeie="1"><a href="javascript:win_upload()">사진수정</a></font>
	</td><th>아이디</th><td><input type="text" name ="id" value="${mem.id}" readonly></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pass" placeholder="${sessionScope.login}의 비밀번호"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name" value="${mem.name}"></td></tr>
	<tr><th>성별</th><td><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":""}>남
	<input type="radio" name="gender" value="2" ${mem.gender==2?"checked":""}>여</td></tr>
	
	<tr><th>전화번호</th><td colspan="2">
	<input type="text" name="tel" value="${mem.tel}"></td></tr>
	
	<tr><th>이메일</th><td colspan="2">
	<input type="text" name="email" value="${mem.email}"></td></tr>
	<tr><td colspan="3"><button>회원수정</button>
	<c:if test="${param.id == sessionScope.login}">
	<button type="button" onclick="win_passchg()">비밀번호수정</button>
	</c:if>	
</table>
</form>
<script type="text/javascript">
function win_upload(){
	let op = "width=500,height=500 ,top=50 ,left=150";
	open("pictureForm","",op);
}

function win_passchg(){
	let op = "width=500,height=500 ,top=50 ,left=150";
	open("passwordForm","",op);
}
</script>
</body>
</html>