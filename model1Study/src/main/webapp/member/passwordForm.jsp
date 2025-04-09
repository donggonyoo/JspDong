<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번수정폼</title>
<%
String login =  (String)session.getAttribute("login");
String id = request.getParameter("id");
String msg = "";
String url = "";
if(login==null){
	msg = "로그인하세요";
	url = "loginForm.jsp";

%>
<script type="text/javascript">
alert("<%=msg%>");
opener.location.href = "<%=url%>";
self.close();
</script>
<% }else{%>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form action="password.jsp" method="post" name="f" onsubmit="return input_check(this)">
<table><caption>비밀번호변경</caption>
<tr><th>현재 비밀번호</th>
	<td><input type="password" name="pass"></td></tr>
<tr><th>변경 비밀번호</th>
	<td><input type="password" name="chgpass"></td></tr>
<tr><th>재입력</th>
	<td><input type="password" name="chgpass2"></td></tr>
<tr><td colspan="2">
	<input type="submit" value="비밀번호변경">
	<input type= "reset" value="초기화"></td></tr>
</table>
</form>
<script type="text/javascript">
function input_check(f){
	if(f.chgpass.value != f.chgpass2.value){
		alert("변경할비밀번호 제대로 재입력하세요");
		f.chgpass2.value="";
		f.chgpass2.focus();
		return false;
	}
	return true;
}
</script>
<%} %>


</body>
</html>