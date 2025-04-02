<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이 페이지는 보여지지않습니다</h1>
<%
//요청받은 파라미터를 가져옴
	String city = request.getParameter("city");
//브라우저와 상관없이 서버내부에서 ex01_seoul.jsp | ex01_busan.jsp 페이지를 forwarding
// ex01_seoul.jsp | ex01_busan.jsp 의 결과로 브라우저에게 응답 전달
//ex01_city.jsp 페이지와 forward된 ex01_seoul.jsp | ex01_busan.jsp는 
// 같은 request 영역에 속함
	pageContext.forward("ex01_"+city+".jsp"); //request , response 객체 전달
	/*pageContext.forward() : 
	현재 JSP 페이지를 실행하지 않고, 지정된 JSP 파일로 요청을 넘기는 역할을 합니다.*/

%>

</body>
</html>