<%@page import="model.member.Member"%>
<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
	1 id파라미터조회
	2. 로그인상태검증
	로그아웃 : 로그인하세요=> loginForm.jsp 페이지로
	로그인상태 
	- 다른 아이디정보 변경 불가능( 단 , admin은 다른 정보 변경가능)
	=> 내 정보만 수정가능 . main.jsp페이지로이동
	3.db에서 id의 레코드조회 . Member객체로리턴
	4. 조회된내용을 화면에 출력하기
 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 전 화면조회(updateForm.jsp)</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String login = (String)session.getAttribute("login");
if(login==null || login.equals("")){ //로그인이안돼있을때를 얘기
%>
<script>
alert("로그인해");
location.href="loginForm.jsp";
</script>
<%}else if(!id.equals(login) && !login.equals("admin")){ %>
<!--  아이디와 세션정보가 다르고 admin이 아니라면 -->
<script>
alert("내정보만 수정가능");
location.href="main.jsp";
</script>
<%} else { //(login.equals("admin") || id.eqals(login))
Member mem = new MemberDto().selectOne(id);
%>
<form action="update.jsp" name="f" method="post" onsubmit="return input_check(this)">
<table><caption>회원정보수정</caption>
<tr><td rowspan="4" valign="bottom">
	<input type="hidden" name="picture" value="<%=mem.getPicture()%>"><!-- 파라미터전달용(화면에보이지않음) -->
	<img src="picture/<%=mem.getPicture()%>" width="100" height="120" id="pic"><br>
	<font sizeie="1"><a href="javascript:win_upload()">사진수정</a></font>
	</td><th>아이디</th><td><input type="text" name ="id" value="<%=mem.getId() %>" readonly></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pass" placeholder="<%=login+"의비밀번호"%>"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
	<tr><th>성별</th><td><input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":"" %>>남
	<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":"" %>>여</td></tr>
	
	<tr><th>전화번호</th><td colspan="2">
	<input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
	
	<tr><th>이메일</th><td colspan="2">
	<input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
	<tr><td colspan="3"><button>회원수정</button>
	<%if(id.equals(login)){ %>
	<button type="button" onclick="win_passchg()">비밀번호수정</button>
	<% } }%>
</table>
</form>

<script type="text/javascript">
function win_upload(){
	let op = "width=500,height=500 ,top=50 ,left=150";
	open("pictureForm.jsp","",op);
	
}
</script>
</body>
</html>