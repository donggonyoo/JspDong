<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  jspStudy\src\main\webapp\ex14_jstl\ex1_core.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  <!-- 태그라이브러리추가 --> 
<!--c 호출 시  http://java.sun.com/jsp/jstl/core의 내용을 참고해 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>속성관련 태그 : set , remove , out 태그</h3>

<!-- session.setAttribute("test","Hello JSTL");와 같은느낌 -->
<!--set태그:  session영역의  test이름의 속성등록 /  값:'Hello JSTL' 
			scope 속성 생략시   기본값 : page -->
<!-- out태그 : 속성값 화면에출력  EL보다 보안성이 높음 
	excape xml : &lt; script &gt; 와같이 바꿔줌
-->

<!-- remove : 등록된 속성 제거-->

<c:set var="test" value="${'Hello JSTL'}" scope="session" />
test 속성 : ${sessionScope.test}<br>
test 속성 : <c:out value="${test}" /><br>
test 속성 : ${test}<br>
<c:remove var="test" />
test 속성 : ${test}<br>

</body>
</html>