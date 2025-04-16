<%@page import="model.member.MemberDto"%>
<%@page import="model.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info(회원정보)</title>
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
<%--
request.setAttribute("mem",Member객체)
	${mem.picutre} == mem.getPicture() 메서드호출됨
		Picture : get property
	
	${mem.id} : mem.getId() 호출 
	(주의 : 변수명(id)으로 가져오는게 아니라
	 get property(mem.getId())를 가져오는거임) 
 --%>
	
<table class="table">
<tr><td rowspan="6" width="30%">
	<img src="${pageContext.request.contextPath}/picture/${mem.picture}" width="200" height="210"></td>
<%--현재 웹 애플리케이션의 context path(루트경로)를 문자열로 반환 
	/model2Study/picture 가 반환될것임 (이걸 해야 url로 접근시 사진이안뜨는문제를 막음)
--%>
	<th width="20%">아이디</th><td>${mem.id}</td>
	<tr><th>이름</th><td>${mem.name}</td></tr>
	<tr><th>성별</th><td>${mem.gender==1?"남":"여"}</td></tr>
	<tr><th>전화</th><td>${mem.tel}</td></tr>
	<tr><th>이메일</th><td>${mem.email}</td></tr>
	<tr><td colspan="2">
	<a href="updateForm?id=${mem.id}"> 수정 </a>
		
	<c:if test="${param.id != 'admin'}">
	<a href="deleteForm?id=${mem.id}"> 탈퇴 </a>
	</c:if>
	</tr>
</table>
</body>
</html>