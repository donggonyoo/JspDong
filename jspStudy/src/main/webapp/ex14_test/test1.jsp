<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/test/test1.jsp --%>
<%@ taglib prefix="test" uri="/ELFunctions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  <!-- 태그라이브러리추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>두개의 파라미터값을 계산하기</title>
</head>
<body>
<form method="post" >
  x:<input type="text" name="x" value="${param.x}"><br>
  y:<input type="text" name="y" value="${param.y}">
   <input type="submit" value="더하기">  
</form>
<c:set var="test" value="${param.x + param.y}"/>
<c:out value="${test}"/>
<h4>if태그를 이용하기</h4>
<c:if test="${test<0}">
	<c:out value="${test}은 음수입니다"/>
</c:if>
<c:if test="${test>=0}">
	<c:out value="${test}은 양수입니다"/>
</c:if>
<h4>choose태그이용하기</h4>
<c:choose>
	<c:when test="${test<0}">
		${test}는 음수다
	</c:when>
	<c:otherwise>
		${test}는 양수다
	</c:otherwise>
</c:choose>


</body>
</html>