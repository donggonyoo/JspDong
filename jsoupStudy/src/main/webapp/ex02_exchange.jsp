<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환율 정보</title>
<style type="text/css">
	table{border-collapse: collapse;}
	tabel,td,th{border: 3px solid purple;}
</style>
</head>
<body>
<%
String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
String line = "";
Document doc = null;
List<List<String>> trlist = new ArrayList<List<String>>();
List<String> title = Arrays.asList("전신환받으실때","전신환보내실때","매매기준율","장부가격","중개매매기준율","중개장부 가격");
try{
	doc = Jsoup.connect(url).get(); //DOM트리 최상위문서
	Elements trs = doc.select("tr"); //tr태그들
	for(Element tr : trs) {//tr : tr태그 1개
		List<String> tdlist = new ArrayList<String>();
		Elements tds = tr.select("td"); // td태그들
		for(Element td : tds){ // td : td태그 1개
			tdlist.add(td.html());//td의 내용
		}
		trlist.add(tdlist);
	}
}catch(IOException e) {
	e.printStackTrace();
}
pageContext.setAttribute("trlist", trlist);//el,jstl사용위해 속성등록
pageContext.setAttribute("title", title);
%>
<table>
<c:forEach items="${trlist}" var="tdlist">
	<c:forEach items="${tdlist}" var="td" varStatus="stat">
		<c:choose>
			<c:when test="${stat.index % 8 == 0}"> <%--1번쨰 td(통화코드) --%>
				<tr><td rowspan="6">${td}</td>
			</c:when>
			<c:when test="${stat.index % 8 == 1}"><%--2번쨰 td(통화명) --%>
				<td rowspan="6">${td}</td>
			</c:when>
			<c:when test="${stat.index % 8 == 2}"><%--3번쨰 td : 전신환받으실때의 환율 --%>
				<td>${title[0]}</td><td>${td}</td></tr>
			</c:when>
			<c:otherwise>
				<tr><td>${title[stat.index -2]}</td><td>${td}</td></tr>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:forEach>
</table>
</body>
</html>