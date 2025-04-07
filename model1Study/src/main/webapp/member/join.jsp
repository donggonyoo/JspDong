<%@page import="model.member.MemberDto"%>
<%@page import="model.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 
	joinForm.jsp 에서 입력된값을 DB의 member테이블(위에서만듬)에 등록하기
	1.파라미터값을 Member 클래스객체 (자바소스 : /java/Member.java)에 저장
	2.Member객체를 DB에 insert  
	3.회원가입 성공 : loginForm.jsp로 이동  
	회원가입 실패 : joinForm.jsp페이지로 이동(잔류)
--%>

<%	
//1
request.setCharacterEncoding("UTF-8");
//Member클래스 : 파라미터의갯수와 같은 프로퍼티를 가진 Bean클래스
// DTO : 데이터를 DB에 전달하기위한 객체
Member mem = new Member();
mem.setId(request.getParameter("id")); /*요청으로받은 id를 Member객체의 id로 Setting*/
mem.setPass(request.getParameter("pass")); 
mem.setName(request.getParameter("name")); 
	//request.getParameter(x)의반환값 :String이므로 변환해줘야함
	//gender의 자료형 : int
mem.setGender(Integer.parseInt(request.getParameter("gender"))); 
mem.setTel(request.getParameter("tel")); 
mem.setEmail(request.getParameter("email")); 
mem.setPicture(request.getParameter("picture")); 
//=> mem 객체는 joinForm.jsp 페이지에서 입력한 값을 저장하고있는 객체

//2
MemberDto dto = new MemberDto();
String msg = "회원가입 실패";
String url = "joinForm.jsp";

if(dto.insert(mem)){//true : DB등록성공  
	msg = "회원가입 성공";
	url = "loginForm.jsp"; //해당페이지로이동
}
%>
<script>
	alert("<%=msg%>");
	location.href="<%= url %>";
</script>