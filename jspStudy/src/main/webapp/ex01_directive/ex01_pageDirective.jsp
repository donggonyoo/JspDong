<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%--
   		해당파일이/jspStudy/src/main/webapp/
		ex01_directive/ex01_pageDirective.jsp -->
    --%>
   	<%--jsp구성요소
   	1.Directive(지시어) : <%@ 지시어속성1="속성값1"...%>
   		1) page directive : jsp페이지의 특징을 설정하는기능
   		2) include directive : 다른페이지를 포함시키는 기능
   		3) taglib directive : 커스텀태그(JSTL)사용시 설정
    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //스크립트 릿 : JAVA영역 (java소스코딩)
	//Date today = new Date();
LocalDateTime today = LocalDateTime.now();

//SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
DateTimeFormatter sf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>
<h3>현재일시 : <%=sf.format(today) %></h3>
<h3>page directive : (지시어,지시자)</h3>
<ul>
  <li> page의 정보를 설정하는기능</li>
  <li>형식 : &lt;%@ page 속성1="속성값1" .... %&gt;정보를 설정하는 기능</li>
  <li>contentType : 반드시 기술해야함 . MIME(text/html)타입으로 설정함</li>
  <li>import : 사용되는 클래스의 패키지명 생략할수있도록 설정, 여러번설정가능</li>
  <li>isErrorPage : "true | false" => 기본값:false <br>
  					ture :  현재 페이지가 오류인 경우     </li>
</ul>
</body>
</html>