<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 예제</title>
</head>
<body>
<h2>pageContext 객체 : page 영역을 담당하는 객체 , 현재페이지의 자원을 관리함</h2>
<h3>
<%
// == : 객체가동일한경우 true
	if(request == pageContext.getRequest()){%>
	request객체와 pageContext.getRequest() 함수가 리턴하는 객체는 같은 객체<br>
<% }%>

<%
	if(response == pageContext.getResponse()){%>
	response객체와 pageContext.getResponse() 함수가 리턴하는 객체는 같은 객체<br>
<% }%>

<%
	if(session == pageContext.getSession()){%>
	session객체와 pageContext.getSession() 함수가 리턴하는 객체는 같은 객체<br>
<% }%>
</h3>
<h3>pageContext 객체는 영역담당 객체이므로 속성관리 메서드를 가진다</h3>
<% pageContext.setAttribute("today", new Date()); %>
today : <%= pageContext.getAttribute("today") %><br>

</body>
</html>