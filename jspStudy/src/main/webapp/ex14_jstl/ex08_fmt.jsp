<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt태그 : 인코딩</title>
</head>
<body>
<%-- request.setCharacterEncoding("UTF-8"); --%>
<fmt:requestEncoding value="UTF-8"/>
<form name="f" method="post">
이름 : <input type="text" name="name" value="${param.name}"><br>
입사일 : <input type="text" name="hiredate" value="${param.hiredate}">
yyyy-MM-dd형태로 입력<br>
<%--
	paramValues.job : job 파라미터의 값들을 배열로리턴
	${fn:join(배열,',')} : 배열의요소를 ,로 연결해 문자열로리턴
 --%>
 <c:set var="jobs" value="${fn:join(paramValues.job, ',')}"/>
급여 : <input type="text" name="salary" value="${param.salary}"><br>
담당업무 : <input type="checkbox" name="job" value="서무"
<c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무&nbsp;
	
		<input type="checkbox" name="job" value="개발"
		<c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발 &nbsp;
		
		<input type="checkbox" name="job" value="비서"
		<c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서&nbsp;
	
		<input type="checkbox" name="job" value="인사"
		<c:if test="${fn:contains(jobs,'인사')}">checked</c:if>>인사&nbsp;<br>
<button>전송</button>
</form>
<h3>입사일을 yyyy년MM월 dd일 E요일의 형태로출력 , 급여,연봉을 세자리마다,로출력해주기</h3>

이름:${param.name}<br>

<%--먼저 입력받은문자를 날짜로 만들어 준 후 다시 포맷팅을 해줘야함 
예외처리를 통해 잘못입력되면 다른 출력을 해주자
--%>
<c:catch var="formatexception">
<fmt:parseDate  var="pDate" value="${param.hiredate}" pattern="yyyy-MM-dd"/>
</c:catch>

입사일:
<c:if test="${formatexception != null}"> <!-- 예외발생 시 exception은 null이 아니다 -->
입사일은 yyyy-MM-dd 형태입력바랍니다<br>
</c:if>
<c:if test="${formatexception == null}">
<fmt:formatDate value="${pDate}" pattern="yyyy년MM월dd일 E요일"/><br>
</c:if>

급여 : <fmt:formatNumber value="${param.salary}" pattern="#,###"/><br>
<!-- pattern ="#,### (3자리마다 ,를 찍어준다) #:숫자가없으면출력안함 -->
연봉: <fmt:formatNumber value="${param.salary*12}" pattern="#,###"/><br>
<%--paramValues.job ㅣ 배열객체 --%>
담당업무 : 
<c:forEach var="i" items="${paramValues.job}">
${i}&nbsp;&nbsp;
</c:forEach>

</body>
</html>