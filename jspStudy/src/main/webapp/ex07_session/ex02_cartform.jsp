<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspStudy/src/main/webapp/ex07_session/ex02_cartform.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 이용한 장바구니</title>
</head>
<body>

<!-- submit 시 ex02_cartAdd.jsp로 요청을 보냄 -->
<form action="ex02_cartAdd.jsp" method="post">
<select name="product">
	<option>사과</option><option>배</option><option>감</option>
	<option>자몽</option><option>귤</option><option>딸기</option>
</select>
<input type="submit" value="장바구니 추가">
</form>
<a href="ex02_cartView.jsp">장바구니보기</a>
ID:<%= session.getId().substring(1, 10) %>


</body>
</html>