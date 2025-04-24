<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="jsoup.Ex01_exchange" %>
<%--
	1.jsoupStudy 프로젝트생성
	2.ex01_exchange.jsp 생성
	3.3개의 jar파일넣기
	4.브라우저에서 한국수출입은행 사이트에서
	업무안내--> 환율정보 클릭 
	 환율정보url : https://www.koreaexim.go.kr/wg/HPHKWG057M01
	 (주소는 매번바뀔수있음 주의)
 --%>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수출입은행 환율 정보조회</title>
<style type="text/css">
	table{border-collapse: collapse;}
	table,td,th{border:2px solid grey;}
</style>
</head>
<body>

<%
	/*String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
	String line = "";
	Document doc = null;
	
	try{
		doc = Jsoup.connect(url).get();
		Elements el = doc.select("table");
		for(Element ele  : el){
			String temp = ele.html();
			line += temp;
		}
	}
	catch(IOException e){
		e.printStackTrace();
	} EX01_exchange.java파일로 옮겨놨음
	*/
	String line = Ex01_exchange.Ex01();
%>

<table><%=line%></table>
</body>
</html>