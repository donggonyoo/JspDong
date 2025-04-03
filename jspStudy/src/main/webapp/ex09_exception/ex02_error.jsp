<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류발생 페이지</title>
</head>
<body>
<% String str = null; %>; 
<%= str.trim() %> <!-- 500번에러발생 -->
<!-- NumnerformatException -->
<% 
int num = Integer.parseInt("abc"); 
%>

</body>
</html>