<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키삭제</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("name","");//삭제할 쿠키의 이름으로 쿠키를 생성
	cookie.setMaxAge(0); // 유효시간0
	response.addCookie(cookie); //클라이언트로 전송
	/*
		유효기간이 종료한 쿠키(A)를 받은 클라이언트는 쿠키저장소에서
		(A)이름에 해당하는 쿠키를 저장소에서지우기
	*/
%>
<h2>쿠키가삭제</h2>
<a href="ex02_cookie.jsp">쿠키조회</a>


</body>
</html>