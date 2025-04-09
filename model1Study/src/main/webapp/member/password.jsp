<%@page import="model.member.Member"%>
<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	1.파라미터저장
	2.로그인한 사용자의 비밀번호변경만 가능 
	로그아웃상태 : 로그인하세요 출력 후 opener창을 loginForm.jsp로 이동후 현재페이지닫기
	3.비밀번호 검증 : 현재비밀번호로비교
	비밀번호 오류 : 비밀번호 오류 메시지 출력 후 현재페이지를 passwordForm.jsp로이동
	4.db에 비밀번호수정
		boolean MemberDto.updatePass(id,비번)
		수정성공 : 성공메시지 출력 후
			(로그아웃되었습니다. 변경된 비밀번호로 다시로그인하세요_
			opener페이지 loginForm.jsp로 이동,현재페이지닫기
		수정실패 : 수정실패 메시지 출력후 현재페이지 닫기
 -->
<html>
<head>
<%
String login = (String)session.getAttribute("login");
String pass = request.getParameter("pass");
String chgpass = request.getParameter("chgpass");
Member mem = new MemberDto().selectOne(login);
String myPass = mem.getPass();

if(login==null || login==""){
%>
<script type="text/javascript">
alert("로그인하세요");
opener.location.href = "loginForm.jsp"
self.close();
</script>

<!-- 입력한비번과 DB상의 비번이 맞지않는다면 -->
<%} else if(!pass.equals(myPass)){%> 
<script>
alert("비밀번호오류")
location.href = "passwordForm.jsp";
</script>

<%}else{ 
	MemberDto dto = new MemberDto();
if(dto.updatePass(login, chgpass)){ //비밀번호성공
	session.invalidate();
%>
<script type="text/javascript">
alert("로그아웃되었습니다. 변경된 비밀번호로 다시로그인하세요");
opener.location.href = "loginForm.jsp"
self.close();
</script>
<%}else{ %>
<script type="text/javascript">
alert("실패");
self.close();
</script>
<%}} %>

