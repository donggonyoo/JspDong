    <%@page import="org.apache.catalina.tribes.transport.MultiPointSender"%>
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
<title>이미지추출</title>
<style type="text/css">
	img{
		border:30px;
		width:100px;
		height:100px;
	}
td{
	border: 1px solid purple;
	width:200px;
}
</style>
</head>
<body>
<%
	String url = "https://heroesbaseball.co.kr/players/infielder/list.do";
	String line = "";
	Document doc = null;
	List<String> html = new ArrayList<>();
	try{
		doc = Jsoup.connect(url).get();
		Elements ele = doc.select("a");
		for(Element el : ele){
			//id가position인 태그가져와
			Element positionElement = el.select(".position").first();
			//태그가있고 태그내의 이름이 내야수인 태그만!!!!
			if(positionElement!=null && positionElement.text().equals("내야수")){
				Elements img = el.select("img");//img태그들
				for(Element im : img){
					if(img!=null){
						String ab = im.absUrl("src");//src를 가져와 절대경로로바꿈	          
		                img.attr("src", ab); // 바꾼경로를 해당 src에 넣음
					}
				}
				html.add(el.html()); // a태그의 html을 List에넣기
				
			}
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	request.setAttribute("list",html);
	
%>

<table>
<tr>
<c:forEach items="${list}" var="s" varStatus="i">
<td>${s}</td>
<c:if test="${i.count%4==0}"></tr><tr></c:if>
</c:forEach>
</tr>
</table>
</body>
</html>