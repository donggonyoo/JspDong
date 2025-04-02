<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    파라미터명 : <input type=".." name="파라미터명"> 
String request.getParameter(파라미터명) : 파라미터의 값 1개만 리턴
String[] request.getParameterValues(파라미터명) : 파라미터의값들을 배열로 리턴
Enumeration request.getParameterNames() : 파라미터의 이름들 가져오기    
    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송된 파라미터값 출력</title>
</head>
<body>
<% //클라이언트가 전송한 데이터를 인코딩하여 한글 깨짐을 방지
	request.setCharacterEncoding("UTF-8");
//파라미터(name)속성으로 요청정보의 파라미터를 가져옴
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	//getParameter("파라미터명") : 한개의값만조회
	String hobby = request.getParameter("hobby");
	//select태그 : option태그의 value값
	String year = request.getParameter("year");
	
%>
<%-- 화면에 표시되는 부분들(표현식) --%>
이름 : <%= name %><br>
나이 : <%= age %><br>
성별 : <%= gender.equals("1")?"남":"여" %><br>
취미 : <%=hobby %><br>
출생년도 : <%=year %><br>

<hr>
<h3>모든취미정보 조회</h3>
<%
	String[] hobbies = request.getParameterValues("hobby");
for(String h : hobbies){
%>
<%= h %> &nbsp;&nbsp;&nbsp; <%--for문 내부에서 동작 --%>
<% } %>

<hr>
<h3>모든파라미터 정보 조회</h3>
<table border="1">
  <tr><th>파라미터이름</th><th>파라미터값</th></tr>
  <%--
  	Enumeration : 반복자.
  	Enumeration.getParameterNames(); 파라미터의 이름목록리턴
   --%>
  <% Enumeration e = request.getParameterNames(); 
  	while(e.hasMoreElements()){
  		//pname : 파라미터 이름 중 한개
  		String pname = (String)e.nextElement();
  		//values : 파라미터의 값들
  		String[] values = request.getParameterValues(pname);
  		
  %>
  <%-- while 구문 내부문장 --%>
  <tr><td><%=pname %></td>
  <td><% for(String s: values){ %>
  	<%= s %>&nbsp;&nbsp;&nbsp;
  	<% } %><%--for문종료 --%>
  	</td>
  </tr>
<%} %><%--while문 종료 --%>
</table>

</body>
</html>