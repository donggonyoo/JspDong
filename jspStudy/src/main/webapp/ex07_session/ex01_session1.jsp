<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seesion 객체 예제</title>
</head>
<body>
<%
//session 유지시간 설정 : 10초
//Tomcat의 기본 session 유지시간 : 30분(1800초)
//session유지시간 : 최종접속시간 이후 10초
//(10초간 아무행동도하지않았을 때)
session.setMaxInactiveInterval(10);
%>
<h3>session 정보 : 브라우저별로 session이할당 <br>
	주요기능 : 클라이언트 정보 저장</h3>
isNew() : <%= session.isNew() %><br><%--session이 새로 만들어졌는가? --%>
생성시간 : <%= session.getCreationTime()%><br><%--session 생성 시간 --%>
최종접속시간 : <%= session.getLastAccessedTime() %><br>
<%--session객체가 최종으로 사용된 시각 --%>
session id : <%=session.getId() %><br><%--session의 고유ID값(유일성) --%>
</body>
</html>