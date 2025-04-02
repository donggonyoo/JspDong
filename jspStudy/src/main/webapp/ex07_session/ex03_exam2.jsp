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
history.go(-1);
</script>

<%
}else{
%>
<%= session.getAttribute("date") %>
<%session.removeAttribute("date"); } %>



</body>
</html>