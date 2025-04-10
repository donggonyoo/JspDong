<%@page import="java.util.Arrays"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach를 이용해 Collection 객체 조회</title>
</head>
<body>
<h3>forEach태그를 이용해 Map객체 출력하기</h3>
<%
	Map<String,Object> map = new HashMap<>();
	map.put("name","홍길동");
	map.put("today", LocalDateTime.now());
	map.put("age",20);
	pageContext.setAttribute("map", map);
%>
<c:forEach var="m" items="${map}" varStatus="s">
	${s.count}:${m.key}=${m.value}<br>
	<!-- HashMap이므로 순서는알수없다 키값쌍만 잘 나오면 됨! -->
</c:forEach>

<h3>map객체를 EL을 이용해 출력</h3>
이름(\${map.name}):${map.name}<br>
나이(\${map.age}):${map.age}<br>
날짜(\${map.today}):${map.today}<br>

<h3>forEach를 이용해 배열객체출력</h3>
<c:set var="arr" value="<%=new int[]{10,20,30,40,50}%>"/>
<c:forEach var="a" items="${arr}" varStatus="s">
	arr[${s.index}] = ${a} <br>
</c:forEach>

<h3>배열객체를 EL을 이용해 출력하기</h3>
arr[0]=${arr[0]}<br>
arr[1]=${arr[1]}<br>
arr[2]=${arr[2]}<br>
arr[3]=${arr[3]}<br>
arr[4]=${arr[4]}<br>

<h3>List객체를 EL을 이용해 출력</h3>
<c:set var="list" value="<%= Arrays.asList(10,20,30,40,50,60)%>" />
list[0]=${list[0]}<br>
list[2]=${list[2]}<br>
list[4]=${list[4]}<br>

<h3>forEach태그를 이용해 배열객체의 두번쨰 요소(1번인덱스)부터 세번쨰요소만(2번인덱스) 출력하기</h3>
<c:forEach var="a" items="${arr}" varStatus="s" begin="1" end="2">
<!-- 여기서 begin end 는 인덱스를 의미하게됨 -->
arr[${s.index}] = ${a}
</c:forEach>

<h3>forEach태그를 이용해 배열객체의 짝수인덱스요소만</h3>
<c:forEach var="a" items="${arr}" varStatus="s" step="2">
arr[${s.index}] = ${a}
</c:forEach>

<h3>forEach태그를 이용해 배열객체의 홀수인덱스요소만</h3>
<c:forEach var="a" items="${arr}" varStatus="s" begin="1" step="2" > 
arr[${s.index}] = ${a}
</c:forEach>

</body>
</html>