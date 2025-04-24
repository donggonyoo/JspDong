<%@page import="java.util.List"%>
<%@page import="jsoup.Nareum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	img{
		height:100px;
		width:100px;
	}
	td{
		width:50px;
	}
</style>
<meta charset="UTF-8">
<title>나름SHOP</title>
</head>
<body>
<%
	List<String> list = Nareum.nareum();
	request.setAttribute("list", list);
%>

<table>
<tr>
<c:forEach items="${list}" var="s" varStatus="i">
<td><img src="${s}"></td>
<c:if test="${i.count%8==0}"></tr><tr></c:if>
</c:forEach>
</tr>
</table>

</body>
</html>