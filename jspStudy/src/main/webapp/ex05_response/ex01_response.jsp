<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response :응답객체</title>
</head>
<body>
 <h1>response 객체는 브라우저에 전달되는 객체라 이해하면된다
 내부에 출력버퍼를 가지고있어서 , 브라우저에 전달되는 내용을 저장하고있다</h1>
 <h2>또한 response 객체를 이용해 브라우저로 하여금 다른페이지를 요청하도록 할 수 있다.
 다른페이지를 요청하도록 하는것을 redirect 라고 한다.</h2>
 <h2>지금보여지고있는 페이지의 내용은 하나도 보이지안음</h2>
 <%-- 밑에 sendRedirect떄문에 위에있는 문장들은 나타나지않을것임  --%>
 
 <%-- response.sendRedirect(".jsp")를 보자마자 
 	ex02_response.jsp로 다시 요청한다
 --%>
 <% response.sendRedirect("ex02_response.jsp"); %>

</body>
</html>