<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- /webapp/member/pw.jsp
  1. 파라미터 저장.
  2. db에서 id,email과 tel 을 이용하여 pass값을 리턴
       pass = MemberDao.pwSearch(id,email,tel)
  3. 비밀번호 검증 
     비밀번호 찾은 경우 :화면에 앞 두자리는 **로 표시하여 화면에 출력. 닫기버튼 클릭시 
                     현재 화면 닫기
     비밀번호 못찾은 경우: 정보에 맞는 비밀번호를 찾을 수 없습니다.  메세지 출력후
                     현재 페이지를 pwForm.jsp로 페이지 이동. 
--%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
String pass = new MemberDto().pwSearch(id, tel, email);
if(pass==null){
%>
<script>
alert("정보에맞는 비밀번호를 찾을수없습니다");
location.href = "pwForm.jsp";
</script>
<%} else{%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번찾기</title>
</head>
<body>
<table>
<tr><th>비밀번호</th><td><input type="text" value="<%=pass.substring(0,pass.length()-2)+"**"%>"></td></tr>
<tr><td colspan="2"><input type="button" value="비밀번호전송" onclick="sendPw('<%=pass.substring(0,pass.length())%>')"></td></tr>
</table>
<script type="text/javascript">
function sendPw(ps){
	//opener : 이 창을 연 최상위부모window객체(loginForm.jsp)
	//name='f'인form의 name='pass'인 태그의 value = ps;
	//즉 로그인화면에서 비밀번호가 채워지게될것임
	opener.document.f.pass.value = ps;
	self.close();
}
</script>
<%} %>

</body>
</html>