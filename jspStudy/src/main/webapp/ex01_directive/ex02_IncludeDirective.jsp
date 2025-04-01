<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String msg = "ex02_includeDirective.jsp 페이지의 msg 변수";
%>
<h1>ex02_includeDirective.jsp 입니다</h1>
<!--Tomcat이 ex02_IncludeDirective2.jsp에게 이동-->
<%@ include file = "ex02_IncludeDirective2.jsp" %>
<%-- ex02_IncludeDirective2.jsp
<hr>
<p>
	ex02_includeDirective.jsp 페이지에 포함됩니다 <br>
	2개의 페이지가 같은 서블릿으로 변경되므로 변수공유가 가능.
	msg : <%=msg %>
</p>
<hr>
 --%>
<h3>include 지시어를 이용해 다른 페이지의 내용을 가져올 수 있음 <br>
	2개의 jsp페이지는 하나의 servlet으로 변환되므로 변수 공유 가능</h3>
</body>
</html>