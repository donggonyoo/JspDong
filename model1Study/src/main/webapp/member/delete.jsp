<%@page import="model.member.Member"%>
<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
   1. 2개의 파라미터 정보를 조회하여 변수 저장
   2. 로그인 정보를 검증
      - 로그아웃 상태 : 로그인하세요. loginForm.jsp로 페이지 이동
      - 본인만 탈퇴가능(관리자는 제외) : 본인만 탈퇴 가능합니다. main.jsp로 페이지 이동
      - 관리자가 탈퇴는 불가 ("admin"은 탈퇴 불가) : 관리자는 탈퇴 불가합니다. list.jsp로 페이지 이동
   3. 비밀번호 검증
      - 로그인 정보로 비밀번호 검증. 
      - 비밀번호 불일치 : 비밀번호 오류 메시지 출력. deleteForm.jsp로 페이지 이동
   4. db에서 id에 해당하는 회원정보 삭제하기
      boolean MemberDao.delete(id)
      탈퇴 성공 
          - 일반 사용자 : 로그 아웃 실행. 탈퇴 메시지 출력, loginForm.jsp로 페이지 이동
          - 관리자 : 탈퇴메시지 출력, list.jsp로 페이지 이동
      탈퇴 실패
          - 일반 사용자 : 탈퇴실패메시지 출력, main.jsp로 페이지 이동
          - 관리자 : 탈퇴실패메시지 출력, list.jsp로 페이지 이동
 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String id  = request.getParameter("id");//파라미터로받은 id
String login = (String)session.getAttribute("login");//로그인정보
String pass  = request.getParameter("pass");
String msg="";
String url="";
if(login==null){//로그인없이 deleteForm에접근시
	msg="로그인하세요";
	url = "loginForm.jsp";
}
//로그인정보가 admin이 아니고 + 로그인정보가id가 다를경우
else if(!login.equals("admin") && !id.equals(login)) {
	msg="본인만 탈퇴가능함";
	url="main.jsp";
}

else if(login.equals("admin")){//로그인한사람이 admin이라면
	Member admin = new MemberDto().selectOne(login);
	if(!admin.getPass().equals(pass)){
		//관리자비밀번호를 입력하지않았다면
		msg="관리자비번을 입력해";
		url="list.jsp";
	} 
	else{ //관리자비밀번호를 입력 시
		if(new MemberDto().delete(id)){
		//delete가 정상적으로 됐다면
		msg= id+"님 탈퇴성공";
		url="list.jsp";
		}
		else{ 
			msg=id+"님 탈퇴실패";
			url="list.jsp"; 
			} 
	}
}
else{ //회원의 아이디와login정보가 같을 떄
	Member mem = new MemberDto().selectOne(login);
	mem.getPass();	
	if(!mem.getPass().equals(pass)){
		msg="잘못된비번";
		url="main.jsp";
		} 
	else{  //비밀번호 일치 시
		if(new MemberDto().delete(id)){
			session.invalidate();//세션초기화(로그아웃)
			msg= id + "탈퇴성공(강제로그아웃)";
			url="loginForm.jsp";
		}
		else { 
			msg= id + "님 탈퇴실패";
			url = "main.jsp";
			} 
	} 
}
%>
<script>
alert("<%=msg%>")
location.href = "<%=url%>"
</script>
</body>
</html>