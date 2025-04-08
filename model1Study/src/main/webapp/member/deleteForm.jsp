<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- 
   	1. id파라미터저장
   	2.. 로그인정보검증
   	-- 로그아웃상태 : 로그인바람 => loginForm.jsp로이동
   	--본인탈퇴여부 검증 : 관리자를 제외하고 본인만탈퇴가능
   	--관리자라면 : 관리자비밀번호를 입력해서 회원 탈퇴시키기 가능
   	--본인이 아닌경우(본인만탈퇴가능) => main.jsp페이지로이동
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"); 
String login = (String)session.getAttribute("login");
if(login==null){
%>
<script>
alert("로그인 해 ");
location.href = "loginForm.jsp";
</script>
<%} else if(!id.equals(login) && !login.equals("admin")){ %>
<script>
alert("본인만 탈퇴가능 ");
location.href = "main.jsp";
</script>
<%}else if(id.equals("admin")){
%>
<script>
alert("관리자는 탈퇴가 불가능")
location.href = "main.jsp"
</script>
<%}else{ %>
<form action="delete.jsp" method="post" onsubmit="return input_check(this)">
<input type="hidden" name="id" value="<%=id %>">
<table><caption>회원비밀번호입력</caption>
	<tr><th>비밀번호</th>
	<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2"> <button>탈퇴하기</button> </td></tr>
</table>
</form>
<%} %>

</body>
</html>