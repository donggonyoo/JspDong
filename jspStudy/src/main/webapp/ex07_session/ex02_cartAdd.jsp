<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
request.setCharacterEncoding("UTF-8");
String fruits = request.getParameter("product"); 
// cart속성을 가져옴
//ex02_cartform과 같은브라우저임(같은session영역)
List<String> cart = (List<String>)session.getAttribute("cart");

//없다면 cart속성을 만든다.
if(cart==null){
	cart = new ArrayList<String>();
	session.setAttribute("cart", cart);
}
cart.add(fruits); //session의 cart속성(List<>)에 넣기
%>
<script type="text/javascript">
	alert('<%=fruits %>가 장바구니에 추가 ID:<%= session.getId().substring(1, 10) %>');
	history.go(-1); //전 페이지로
</script>



</body>
</html>