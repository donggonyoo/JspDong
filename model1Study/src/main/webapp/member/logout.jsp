<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session.removeAttribute("login"); 
//새로운 session객체로변경 , 이전 session객체에 등록된 모든속성이없다
session.invalidate();
%> 


<script type="text/javascript">
alert("로그아웃")
location.href = "loginForm.jsp";
/*
 * loginForm.jsp(초기화면)으로 이동
 */
</script>
