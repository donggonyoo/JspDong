<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /jspstudy2/src/main/webapp/test/test2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력된 수까지의 합 구하기</title>
</head>
<body>
<form method="post">
  숫자:<input type="text" name="num" value="${param.num}">
   <input type="submit" value="숫자까지의 합 구하기">  
</form>
<c:forEach var="i" begin="1" end="${param.num}">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
<c:out value="${sum}"/>

<h4>if태그이용해 짝수홀수출력</h4>
<c:if test="${sum%2==0}">
	<c:out value="${sum}은 짝수"/>
</c:if>
<c:if test="${sum%2==1}">
	<c:out value="${sum}은 홀수"/>
</c:if>

<h4>choose태그 이용해 짝수홀수출력</h4>
<c:choose>
	<c:when test="${sum%2==0}">
		<c:out value="${sum}은 짝수"/>
	</c:when>
	<c:otherwise>
		<c:out value="${sum}은 홀수"/>
	</c:otherwise>

</c:choose>

</body>
</html>