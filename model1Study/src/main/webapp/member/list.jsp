<%@page import="model.member.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- /webapp/member/list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
<table><caption>회원목록</caption>
<tr><th>아이디</th><th>사진</th><th>이름</th><th>성별</th><th>전화</th>
	<th>&nbsp;</th></tr>
<% String login = (String)session.getAttribute("login");
	request.setCharacterEncoding("UTF-8"); 
	if(login==null || login.equals("")){
	%>
<script>
alert("로그인");
loaction.href = "loginForm.jsp";
</script>
<% 
}else if(login!=null && login.equals("admin")){
%>

<%
List<Member> list = new MemberDto().list();
for(Member m : list){	
%>
<tr><td><a href="info.jsp?id="<%=m.getId() %>"><%=m.getId() %></a></td>
<td><img src="picture/<%=m.getPicture() %>" width="30" height="30"></td>
<td><%=m.getName() %></td><td><%=m.getGender()==1?"남":"여" %></td>
<td><%=m.getTel() %></td>
<td><a href="updateForm.jsp?id=<%=m.getId()%>">수정</a>

	<%if(!m.getId().equals("admin")){%><!-- id가 admin인 경우는 X -->
	<a href="deleteForm.jsp?id=<%=m.getId()%>">강제탈퇴</a>
	<%} %>
</td></tr>

<%} }else{ %>
<script>
alert("관리자만 접근할 수 있습니다");
location.href="main.jsp";
</script>
<%} %>
</table>
</body>
</html>