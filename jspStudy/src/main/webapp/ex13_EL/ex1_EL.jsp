<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1.request : 요청객체(브라우저에서 전달되는 요청정보 저장)
	2.response : 응답객체(브라우저로 전달하는 정보 저장)
	3.pageContext : 현재페이지의 정보저장하고있는 객체
	4.session : 브라우저의 상태정보를 저장할수있는 객체
	5.applcation : 웹 어플리케이션(프로젝트)정보 저장 객체
 -->
<%
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test", "pageContext의 test속성");
	request.setAttribute("test", "request의 test속성");
	session.setAttribute("test", "session의 test속성");
	application.setAttribute("test", "application의 test속성");
	String name = "홍길동";
%>
<h3>JSP의 스크립트를 이용해 파라미터와 속성값 출력하기</h3>
pageContext tel속성값 : <%=pageContext.getAttribute("tel") %> <br>
pageContext test속성값 : <%=pageContext.getAttribute("test") %><br>
request test속성값 : <%=request.getAttribute("test") %><br>
session test속성값 : <%=session.getAttribute("test") %><br>
application test속성값 : <%=application.getAttribute("test") %><br>
name 변수값 : <%= name %><br>
id파라미터 : <%= request.getParameter("id") %><br>
없는속성 : <%= request.getAttribute("noAttr") %><br>
없는 파라미터 : <%=request.getParameter("noParam") %>

<h3>JSP 의 EL을 이용해 파라미터와 속성값 출력하기</h3>
pageContext tel속성값 : ${pageScope.tel}<br> 
pageContext test속성값 : ${pageScope.test}<br> 
request test속성값 : ${requestScope.test}<br> 
session test속성값 : ${sessionScope.test}<br> 
application test속성값 : ${applicationScope.test}<br>
name 변수값 : EL방식으로 출력할방법이없음 <br>  
id 파라미터 : ${param.id}<br> 
없는속성 : ${requestScope.noAttr}<br>
없는 파라미터 : ${param.noParam}<br>
<!-- pageScope : pageContext에 저장된속성을 참조시 사용 -->
<!-- ${값} -->


<h3>영역을 표시해 속성 출력</h3>
<!--  \ 뒤에 적은것들은 그대로 출력이됨 -->
\${test} : ${test}<br>
\${pageScope.test} :${pageScope.test}<br> 
\${requestScope.test} :${requestScope.test}<br> 
\${sessionScope.test} :${sessionScope.test}<br> 
\${applicationScope.test} :${applicationScope.test}<br>
\${param.id} : ${param.id}<br>
\${requestScope.noAttr} : ${requestScope.noAttr}<br>
\${param.noParam} : ${param.noParam}<br>
<!-- 
	${test} : 영역담당객체에 등록된 속성중 이름이 test인 속성값 출력
	우선순위
	1.page영역에등록된 pageScope.test 속성값
	2.1번이없으면  , request영역에등록된 pageScope.test
	3.2번이없으면 , session영역에등록된 sessionScope.test
	4.3번이없으면 , application영역에등록된 applicationScope.test
	5.1~4번이없으면 공백을 출력
	
	${영역객체.A} : 영역객체에 등록된속성중 이름이A인 속성값출력
	1.해당영역에 A속성이없다면 공백을 출력 
 --> 



</body>
</html>