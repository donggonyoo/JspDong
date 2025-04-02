<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>현재날짜를 session 객체에 등록을 하자</h3>
<%--
	session.setAttribute("date", new Date());
--%>
등록된 날짜 : <%= session.getAttribute("date") %><br>
<a href="ex03_exam2.jsp">등록날짜 조회</a>
</body>
</html>