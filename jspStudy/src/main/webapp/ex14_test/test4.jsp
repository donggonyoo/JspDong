<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); 
LocalDate ld = LocalDate.now();
int now = ld.getYear();
pageContext.setAttribute("dt", now);  //page(같은페이지)영역에 속성을 지정해준다
%>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : 
<c:choose>
	<c:when test="${param.gender eq 1}">
		남 <!-- value가 1이면 남 출력 -->
	</c:when>
	<c:otherwise>
		여<!-- value가 1이아니면 여 출력 -->
	</c:otherwise>
</c:choose>
<br>
출생년도 : ${param.year}<br>
만나이 : ${dt - param.year}
<!-- 만나이 : ${pageScope.dt - param.year} 와 같은뜻--> 


</body>
</html>