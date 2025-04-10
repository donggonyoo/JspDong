<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 형식화태그 parse관련</title>
</head>
<body>
<h3>Format된 숫자를 숫자로 변경</h3>
<%-- var="num1"속성값으로 등록됨(화면출력X)--%>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<!-- pattern과 맞는 값이 들어오면 number로변경시켜줌 -->
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
${num1}+${num2}=${num1+num2}<br>

<%--var속성이없으면 화면출력됨--%> 
<fmt:parseNumber value="20,000" pattern="##,###"/><br>
<fmt:parseNumber value="10,000" pattern="##,###"/><br>

<h2>문제 : 20,000 + 10,000 = 30,000 출력해보기
num1변수와num2 이용</h2>
<fmt:formatNumber var="fNum1" value="${num1}" pattern="##,###"/>
<fmt:formatNumber var= "fNum2" value="${num2}" pattern="##,###"/>
<fmt:formatNumber var= "result" value="${num1+num2}" pattern="##,###"/>
답 : ${fNum1}+${fNum2} = ${result}<br>

<h3>Format된 날짜(문자형)를 날짜형으로 변경하기</h3>
<fmt:parseDate value="2025-12-25 16:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
${day}<br>

<h3>문제 : 2025-12-25일의 요일출력하기</h3>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd E요일"/>


</body>
</html>