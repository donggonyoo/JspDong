<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 보기</title>
</head>
<body>
<% 
List<String> cart = (List<String>)session.getAttribute("cart");
// 같은 브라우저의 session은 동일하다
if(cart==null || cart.size() == 0 ){
%>
<h3>장바구니에 상품X</h3>
<%} else{ %>
<h3>장바구니상품</h3>
<% for(String s : cart){ %>
<h3><%= s %></h3>
<%--장바구니 조회 후 장바구니 초기화 --%>
<% } }  session.removeAttribute("cart");%>


ID:<%= session.getId().substring(1, 10) %>



</body>
</html>