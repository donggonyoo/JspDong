<%@page import="model.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- 
   1.파라미터값 저장
   2.DB에서 두개의파라미터를 이용해 id값을 리턴
   	id MemberDto.idSearch(name,tel)
   	3.id존재 : 화면에 아이디뒤쪽 2자를 **표시해 화면에출력하기
   		아이디전송 버튼을 누르면 opener창에 id입력란에 전달,
   		id.jsp 화면을 닫자
    id없음 : id가없습니다 후 idForm.jsp로 이동 
    -->
    
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String id = new MemberDto().idSearch(name, tel);
	if(id == null){
%>
<script>
alert("아이디가 없어요");
location.href = "idForm.jsp";//아이디찾기로다시이동
</script>
<%} else{ %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이디찾는화면</title>
</head>
<body>
<table>
<tr><th>아이디</th><td><%=id.substring(0,id.length()-2)+"**"%></td></tr>
<tr><td colspan="2">
	<input type="button" value="아이디전송" onclick="idsend('<%= id.substring(0,id.length())%>')">
</table>
<script>
function idsend(id){
	opener.document.f.id.value = id;
	//loginForm의 form하위의 id의 value
	self.close();
}
</script>
<%} %>
</body>
</html>