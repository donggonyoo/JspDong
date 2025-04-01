<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>script 예제</title>
</head>
<body>
<h1>스크립트의 종류</h1>
<ol>
  <li>스크립트릿(scriptlet) : &lt;% ... %&gt; : 자바소스의영역</li>
  <li>표현식(experssion) :  &lt;%= ... %&gt; : 브라우저에 내용출력</li>
  <li>선언문(declaration) :  &lt;%! ... %&gt; : servlet의 멤버로변환.(사용안함)</li>
</ol>
<h1>스크립트릿(&lt;% %&gt;) : _jspService() 메서드 소스에 설정</h1>
<%
	String msg = "스크립트 예제";
	for(int i=1 ; i<=10;i++){	
	
%>
<%=i+":"+msg /*여러줄주석*/%><br>
<% } %>
<h1>표현식(&lt;%= %&gt;) : 브라우저에 내용 출력하기</h1>
<ul>
<li>문장에 끝에 ; 사용</li>
<li>값이 존재해야함 : 변수,수식,return값 존재하는 함수</li>
<%-- <%=System.out.println("aaa")%> =>오류발생 --%>
<%= "aaa"  %>
<li>주석은 반드시 /* */ 만 사용가능 //주석 불가능 </li>
<%= "##"+ msg %><br>
<%=  "##"+(10 * 20) %>
</ul>
<h1>선언문 : jsp Servlet의 멤버로설정됨(거의사용하지않음)</h1>
<%= this.msg %><br>
<%= this.getMsg() %><br>
<%!
	String msg = "선언문의 msg변수";
	String getMsg(){
		return msg;
	}
%>


</body>
</html>