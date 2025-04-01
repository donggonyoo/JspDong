<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP에서 사용되는 주석</title>
</head>
<body>
<h1>JSP에서 사용되는 주석 : 3가지</h1>
<ol>
	<li> JSP 주석 : &lt;%-- JSP 주석 --%&gt;</li>
	<%-- JSP 주석입니다 . JSP페이지가 servlet으로 변경될 떄 제외됨
	servlet소스에서 볼 수 없음 --%>
	<li>JAVA 주석 : &lt;% //java 주석 , /*자바 주석*/ %&gt; <br>
		자바에서 사용되는 주석 . 스크립트내부에서 사용됨 <br>
		자바주석은 JSP , 서블릿페이지에서 볼 수 있습니다.<br>
		서블릿페이지가 컴파일 될 때 주석으로 처리됩니다.
	</li>
	<li>HTML주석 : &lt;!-- HTML 주석 --&gt; 
		JSP나 서블릿에서는 주석이 아님 . <br>
		브라우저에서 화면출력시 주석으로인식
		<% String msg = "JSP 메시지"; %>
		<!--  <%=msg %> : 이곳은 HTMl주석입니다 . 서블릿까지 주석이아님.<br>
		HTML 주석은 브라우저의 소스보기에 보여집니다-->
	</li>
</ol>
</body>
</html>