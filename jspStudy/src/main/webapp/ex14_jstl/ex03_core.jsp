<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- JSTL태그 사용을위해서 항상 taglib를 적어야함 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl core태그 : forEach</title>
</head>
<body>
<h3>반복관련태그 : forEach</h3>
<h4>1에서10까지 숫자출력해보기</h4>
<!-- for(int i =1 ; i<=10 ; i++)과 같음 -->
<c:forEach var="i" begin="1" end="10">
${i}&nbsp;,&nbsp;	
</c:forEach>

<h4>1부터10까지 홀수만 출력하자</h4>
<!-- for(int i=1 ; i<=10 ; i+=2) -->
<c:forEach var="i" begin="1" end="10" step="2">
${i}&nbsp;,&nbsp;	
</c:forEach>

<h4>1부터10까지 홀수만 출력하자2</h4>
<!-- for(int i=1 ; i<=10 ; i+=2) -->
<c:forEach var="i" begin="1" end="10" >
	<c:if test="${i%2==1}">
		${i}&nbsp;,&nbsp;
	</c:if>
</c:forEach>

<h4>1부터10까지 짝수만 출력하자</h4>
<!-- for(int i=1 ; i<=10 ; i+=2) -->
<c:forEach var="i" begin="1" end="10" >
	<c:if test="${i%2==0}">
		${i}&nbsp;,&nbsp;
	</c:if>
</c:forEach>

<h4>1부터10까지의 합 출력</h4>
<c:forEach var="i" begin="1" end="10">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
1부터10까지의 합 : ${sum}<br>

 <!-- 변수의 사용이끝났으므로 변수 초기화 (다른변수를 만들어서 사용해도 상관없음)-->
 <!-- c:set으로 생성되는 함수는 page함수이므로 다른페이지에 영향은없음 -->
<c:set var="sum" value="${0}"/>

<h4>1부터10까지의 짝수 합 출력</h4>
<c:forEach var="i" begin="2" end="10" step="2">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
1부터10까지의 짝수 합 : ${sum}<br>

<!-- 변수의 사용이끝났으므로 변수 초기화(다른변수를 만들어서 사용해도 상관없음) -->
<c:set var="sum" value="${0}"/>

<h4>1부터10까지의 홀수 합 출력</h4>
<c:forEach var="i" begin="1" end="10">
	<c:if test="${i%2==1}">
		<c:set var="sum" value="${sum+i}"/>
	</c:if>
</c:forEach>
1부터10까지의 짝수 합 : ${sum}<br>


<h3>forEach태그를 이용해 구구단</h3>
<c:forEach var="i" begin="2" end="9">
	<h4>${i}단</h4>
	<c:forEach var="j" begin="2" end="9">
	   ${i} * ${j} = ${i*j}&nbsp;
	</c:forEach><br>
</c:forEach>


<h3>forEach태그를 이용해  List객체의 요소 출력해보기</h3>
<%
	List<Integer> list = new ArrayList<>();
	for(int i=1;i<=10;i++){
		list.add(i*10);
	}
	pageContext.setAttribute("list", list);
%>
<!-- varStatus : 인덱스번호를 반환해줌 -->
<!-- items : 해당변수의 요소출력 (자바의 향상된for문과 동일 -->
<c:forEach var="i" items="${list}" varStatus="s">
	[${s.index}]:${i} &nbsp;,&nbsp;
</c:forEach><br>

<!-- list를 2줄로 출력 -->
<c:forEach var="i" items="${list}" varStatus="s">
<c:if test="${s.index == 5}"><br></c:if>
[${s.index}]:${i} &nbsp;,&nbsp;
</c:forEach>




</body>
</html>