<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일작성</title>
<script type="text/javascript">
function inputchk(f) {
	if(f.googleid.value==""){
		alert("구글아이디입력바람");
		f.googleid.focus();
		return false;
	}	
	if(f.googlepw.value==""){
	alert("구글비번을 입력하세요")
	f.googlepw.focus();
	return false;
	}
	return true;
}
</script>
</head>
<body>
<div class="container"></div>
<h2 id="center">메일보내기</h2>
<form action="mailSend" method="post" name="form1" onsubmit="return inputchk(this)">
<table class="table">
<tr><td>보내는사람</td>
<td>본인구글ID:<input type="text" name="googleid" class="form-control" value="ddkk8525">
	본인구글PW:<input type="password" name="googlepw" class="form-control" value="muefnfldrbqlbfez"></td>
</tr>
<tr><td>받는사람</td>
	<td><input type="text" name="recipient" class="form-control" 
value="<c:forEach items="${list}" var="m">${m.name} &lt;${m.email}&gt;</c:forEach>">
<%-- name <email> 의 형태 --%>
	</td></tr>
<tr><td>제목</td>
	<td><input type="text" name=title class="form-control"></td>
</tr>
<tr><td>메시지형식</td>
	<td><select name="mtype" class="form-control">
		<option value="text/html;charset=UTF-8">HTML
		<option value="text/plain;charset=UTF-8">TEXT
	<!-- plane : 순수한 text파일이라는뜻(태그인식X) -->
	</select></td>
</tr>
<tr><td colspan="2">
<textarea name="content" rows="10" cols="40" class="form-control"></textarea></td></tr>
<tr><td colspan="2" id="center">
	<button type="submit" class="btn btn-primary">전송</button></td></tr>
</table>
</form>

</body>
</html>