<%@page import="model.member.MemberDto"%>
<%@page import="model.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- /webapp/member/info.jsp -->
<!-- 
   1. 로그인상태검증
    로그아웃상태 : 로그인하세요
    로그인상태 : 회원정보보여줌(자신)
    	다른id를 조회불가능 단 관리자는 다른id를 조회할수있음
    2.id파라미터조회
    3.id에 해당하는 레코드조회
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info(회원정보)</title>
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
<!-- 로그인여부 검증이필요함 (속성으로 로그인여부를 판단가능) -->
<%
String login = (String)session.getAttribute("login");
String id = request.getParameter("id");
if(login == null){ // login속성이없다면(로그아웃상태라면)
%>
<script type="text/javascript">
alert("로그인부터하세요");
location.href = "loginForm.jsp";
</script>

<!-- login회원과 파라미터의id가 일치하지않으며 ,login정보가 admin이 아닌경우 -->
<%}else if(!id.equals(login) && !login.equals("admin")){ %>
<script>
alert("자신의정보만 확인 가능합니다");
location.href = "main.jsp";
</script>


<!-- login정보가 admin이거나 , login정보와 id가 일치하는경우 -->
<% }else{
	Member mem = new MemberDto().selectOne(id);
%>
<table><caption>회원정보</caption>
<tr><td rowspan="6" width="30%">
	<img src="picture/<%=mem.getPicture() %>" width="200" height="210"></td>
	<th width="20%">아이디</th><td><%= mem.getId() %></td>
	<tr><th>이름</th><td><%=mem.getName() %></td></tr>
	<tr><th>성별</th><td><%=mem.getGender()==1?"남":"여" %></td></tr>
	<tr><th>전화</th><td><%=mem.getTel()%></td></tr>
	<tr><th>이메일</th><td><%=mem.getEmail() %></td></tr>
	<tr><td colspan="2">
	<a href="updateForm.jsp?id=<%=mem.getId()%>">수정</a>
	
	<%if(!login.equals("admin")) { //admin이 아닌경우에만 나타나게%>
	<a href="deleteForm.jsp?id=<%=mem.getId()%>">탈퇴</a>
	<%} %>
	</tr>
</table>
<%} %>
</body>
</html>