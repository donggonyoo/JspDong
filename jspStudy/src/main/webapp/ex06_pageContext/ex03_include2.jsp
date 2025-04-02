<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>ex03_include2.jsp 페이지</h4>
<p>
	ex03_include.jsp 페이지에 포함되는 페이지 입니다.<br>
	include 지시어와 다른점은 하나의 서블릿에 생성되지않음<br>
	그래서 변수가 공유되지 않습니다.<br>
	<%--
	System.out.println(msg); 사용불가능
	--%>
	test파라미터(2) : <%= request.getParameter("test")%>
</p>