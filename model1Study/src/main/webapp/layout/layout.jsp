<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%String path = request.getContextPath(); 
 //getContextPath() : 프로젝트명
//절대경로로 처리하기위한변수
%>
 			
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<link rel="stylesheet" href="<%=path %>/css/main.css">
<sitemesh:write property="head" />
<!-- 
<sitemesh:write property="title" /> : 
작성한 페이지의 title태그값

<sitemesh:write property="head" /> : 
작성한페이지의 head태그의값 (title태그 제외)

<sitemesh:write property='body'/>
작성한페이지의 body태그 값
 -->
 
</head>
<body>
<table><tr><td colspan="3" style="text-align: right">
<%
String login = (String)session.getAttribute("login");
if(login==null){ %>
<a href = "<%=path %>/member/loginForm.jsp">로그인</a>
<a href = "<%=path %>/member/joinForm.jsp">회원가입</a> 
<!--  로그인되어있지않다면 우측상단에 로그인, 회원가입 링크 띄우기 -->
<%} else { //로그인된 상태%>
 <%= login %>님.<a href="<%=path %>/member/logout.jsp">로그아웃</a>
<%} %>
</td></tr>
<tr><td width="15%" valign="top">
	<a href="<%=path %>/member/main.jsp">회원관리</a><td>
<td colspan="2" style="text-align : left; vertical-align:top">
<sitemesh:write property='body'/></td></tr>
<tr><td colspan="3">구디아카데미</td></tr>
</table>
</body>
</html>