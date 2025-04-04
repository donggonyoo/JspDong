<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	session에 등록된 날짜 조회 후
	session 속성에서 제거하기<br>
	등록된 날짜가없는 경우에는 다시돌아가기
</h3>
<%
if(session.getAttribute("date")==null){
%>
<script type="text/javascript">
alert('등록된 날짜X');
history.go(-1); //전페이지로
</script>

<%
}else{
%>
<% Date date = (Date)session.getAttribute("date");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String d  = sdf.format(date);
%>
<%= d %>
<%session.removeAttribute("date"); } %>



</body>
</html>