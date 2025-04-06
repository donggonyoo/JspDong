<%@page import="java.util.List"%>
<%@page import="model.adder.AdderDto"%>
<%@page import="model.adder.Adder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니목록</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
Adder ad = new Adder();
ad.setFruit(request.getParameter("product"));
ad.setNum(Integer.parseInt(request.getParameter("num")));
AdderDto dto = new AdderDto();
List<Adder> listOne = dto.print();
%>
<table border="1">
<caption>변경 전 테이블</caption>
<th>상품명</th><th>갯수</th>
<%for(Adder a1 : listOne) {%>
<tr><td><%=a1.getFruit() %></td><td><%=a1.getNum() %></td></tr>
<%} %>
</table>

<h2>추가된 품목 : <%=ad.getFruit() %> <%=ad.getNum() %>개 </h2>
<table border="1">
<th>상품명</th><th>갯수</th>
<% 
List<Adder> list = dto.insert(ad); //입력받은 값을 넣은 후 전체DB를 LIST로반환
for(Adder a : list){
%>
<tr><td><%=a.getFruit() %></td><td><%=a.getNum() %></td></tr>
<%} %>
</table>

<input type="button" id="back" value="뒤로가기"> 

<script type="text/javascript">
document.querySelector("#back").onclick =  function(){
	history.go(-1)
}
</script>



</body>
</html>