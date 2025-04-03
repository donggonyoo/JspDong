<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %> <!--현재페이지는 오류페이지임을 명시.exception객체추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR page</title>
</head>
<body>
 <h1>error 발생</h1>
 <h2>입력값을 다시확인해주세요</h2>
 <h3>숫자만입력가능</h3>
 <%= exception.getMessage() %><br> <%--에러메시지 --%>
 
 <% //오류메시지를 브라우저에 띄워라
 //exception.printStackTrace(response.getWriter()); %>
 


</body>
</html>