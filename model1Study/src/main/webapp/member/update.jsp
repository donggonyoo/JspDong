<%@page import="model.member.MemberDto"%>
<%@page import="model.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    1.모든파라미터를 Member객체에저장
    2.입력된비번과 DB에 저장된 비번을 비교
    관리자인경우 관리자비밀번호로비교
    불일치 : '비밀번호오류' 메시지 출력 후 updateForm.jsp페이지로이동
    3.Member 객체의내용으로 DB수정 : boolean MemberDto.update(Member)
    	성공 : 회원정보 수정완료 메시지출력후 info.jsp로 이동
    	실패 : 회원정보 수정 실패 메시지출력 후 updateForm.jsp로이동
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업뎃</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
String login = (String)session.getAttribute("login");//login세션정보를 가져옴

	Member mem = new Member();
	mem.setId(request.getParameter("id"));
	
if(login.equals("admin")){//session정보(로그인된 아이디) == admin이라면
//session의 정보를가지고 DB에서 레코드를 가져옴
	Member mem2 = new MemberDto().selectOne(login);
	//레코드의 Pass와 파라미터(입력된)Pass가 같다면
	if(mem2.getPass().equals(request.getParameter("pass"))){
		mem.setPass(mem2.getPass());
	}
	//입력된 get.Parameter("pass")와 admin의Pass가 다르다면
	else{%>
	<script type="text/javascript">
	alert("비밀번호오류");
	location.href = "updateForm.jsp?id=<%=login%>";
	</script>
<% 
	}
}

//session정보가 admin이 아니라면
else{
	mem.setPass(request.getParameter("pass"));
} 	

mem.setName(request.getParameter("name"));
mem.setGender(Integer.parseInt(request.getParameter("gender")));
mem.setTel(request.getParameter("tel"));
mem.setEmail(request.getParameter("email"));

Member mem2 = new MemberDto().update(mem);//
if(mem2 ==null){%>
<script>
alert("회원정보 수정 실패");
location.href = "updateForm.jsp?id=<%=login%>";
</script>
<% }else{%>
<script>
alert("회원정보 수정 성공");
location.href = "info.jsp?id=<%= request.getParameter("id")%>";
</script>
<%} %>

</body>
</html>