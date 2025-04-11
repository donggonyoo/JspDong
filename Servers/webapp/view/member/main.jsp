<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- /webapp/member/main.jsp -->
    <!--  
   1.로그인여부 검증이필요함 => main.jsp페이지는 로그인상태에서만 조회
   현재 로그인 상태 : 현재화면 출력
   현재 로그아웃상태 : 이 페이지는 보여줄수없음 
   (로그인하라는 메시지와 함께 loginForm.jsp창으로이동) 
   
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<body>

<%
String login = (String)session.getAttribute("login");
if(login != null){
%>
<!-- session에 login속성에 값이있다면 로그인되어있다고본다. -->
<h3><%= login  %>님이 로그인 했어요</h3>
<h3><a href="logout.jsp">로그아웃</a></h3>

<!-- 관리자로 로그인 시 회원목록조회 -->
<%if(login.equals("admin")){ %>
<h3><a href="list.jsp">회원목록보기</a></h3>
<%} %>
<h3><a href="info.jsp?id=<%= login%>">회원정보 보기</a></h3>
<% } else{//로그아웃상태 session에 login속성이 존재X%>
<script type="text/javascript">
alert("로그인하세요");
location.href = "loginForm";
</script>
<%} %>

</body>
</html>