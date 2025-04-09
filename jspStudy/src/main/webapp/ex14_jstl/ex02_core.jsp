<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core태그 : if, choose</title>
</head>
<body>
<h3>조건문관련태그 : if, choose 태그</h3>
<!-- else는 없음 test속성이 무조건있어야함 -->
<c:if test="${5<10}">
	<h4>5는10보다 작다(core태그이용)</h4>
</c:if>

<%if(5<10){ %>
	<h4>5는10보다작다(스크립트 릿 이용)</h4>
<%} %> 

<!-- choose 조건문 when(if)과 otherwise(else) -->
<c:choose>
	<c:when test="${5+10==25 }">
		<h4>5+10은 25다</h4>
	</c:when>
	<c:when test="${5+10==15 }">
		<h4>5+10은 15다</h4>
	</c:when>
	<c:when test="${5+10==510 }">
		<h4>5+10은 510이다</h4>
	</c:when>
	<c:otherwise> <!-- else와 같음 -->
		<h4>5+10은 모른다</h4>
	</c:otherwise>
</c:choose>




</body>
</html>