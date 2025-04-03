<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 내장객체</title>
</head>
<body>
<h3>out 객체는 response 객체의 출력버퍼에 데이터를 출력할수있는 출력스트림 객체</h3>
<%
	int sum=0;
	for(int i=1;i<=10;i++){
		sum+= i ;
%>
1부터 <%=i %>까지의 부분합 : <%=sum %><br>
<%} %>
1부터10까지의 합 : <%=sum %>

<hr> 
<h3>out객체 활용</h3>
<%
	sum=0;
for(int i=1;i<=10;i++){
	sum+= i ;
	out.println("1부터"+i+"까지의 부분합 : "+sum+"<br>");
}
out.println("1부터10까지의합 " +sum);
%>

</body>
</html>