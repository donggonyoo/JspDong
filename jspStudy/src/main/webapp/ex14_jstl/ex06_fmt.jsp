<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 형식화태그 fmt</title>
</head>
<body>
<h3>날짜관련태그</h3>
<c:set var="today" value="<%= new java.util.Date() %>"/>
년월일 : <fmt:formatDate value="${today}" type="date"/><br>
시분초 : <fmt:formatDate value="${today}" type="time"/><br>
년월일시분초 : <fmt:formatDate value="${today}" type="both"/><br>

년월일시분초-short : <fmt:formatDate value="${today}" type="both"
				timeStyle="short" dateStyle="short"/><br>
				
년월일시분초-long : <fmt:formatDate value="${today}" type="both"
				timeStyle="long" dateStyle="long"/><br>
				
년월일시분초-full : <fmt:formatDate value="${today}" type="both"
				timeStyle="full" dateStyle="full"/><br> 
				
년월일시분초-GMT : <fmt:formatDate value="${today}" type="both"
				timeStyle="full" dateStyle="full" timeZone="GMT"/><br>
				
형식지정 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 a HH:mm:ss  E요일"/><br>
<p>pattern속성은 SimpleDateFormat에서 사용하는 형식화문자와 같다고보면 됨</p>
<!--  
	~~Format클래스
	format() : 객체 => 형식화된 문자열
	parse() : 형식화된문자열 => 객체
 -->
</body>
</html>