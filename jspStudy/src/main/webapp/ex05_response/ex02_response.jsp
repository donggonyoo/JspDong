<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_response2.jsp</title>
</head>
<body>
<h2>ex02_response2.jsp</h2>
ex01_response1.jsp 페이지에서 요청하면 이 페이지가 호출 <br>
브라우저의 url 부분도 이 페이지의 url로 변경되어 있습니다 <br>
이런현상을 redirect  , 이후의 forward와 비교해 정확한 의미를 이해하자 <br>
<h2><%= request.getParameter("id")%></h2>
</body>
</html>