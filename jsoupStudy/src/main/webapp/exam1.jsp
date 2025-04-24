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
<%--수출입은행 환율 정보중  EUR,JPY(100),CNH,USD 통화만 
	ex02_exchange.jsp형태로출력--%>
<html>
<head>
<meta charset="UTF-8">
<title>EXAM1</title>
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
List<String> list = Arrays.asList("EUR","JPY(100)","CNH","USD");
try{
	doc = Jsoup.connect(url).get(); //DOM트리 최상위문서
	Elements trs = doc.select("tr"); //tr태그들
	for(Element tr : trs) {//tr : tr태그 1개
		List<String> tdlist = new ArrayList<String>();
		Elements tds = tr.select("td"); // td태그들
		for(Element td : tds){ // td : td태그 1개
			tdlist.add(td.html());//td의 내용
			
		}
		//tdlist가 비어있지않고 통화코드가들어있는리스트(list)에 tdlist의0번째인덱스가 존재한다면
		if(tdlist.size()>0 && list.contains(tdlist.get(0))){
			trlist.add(tdlist);
		}
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