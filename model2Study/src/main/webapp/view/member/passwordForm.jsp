<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번수정폼</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<h3>비밀번호변경</h3>
<form action="password" method="post" name="f" onsubmit="return input_check(this)">
<table class="table">
<tr><th>현재 비밀번호</th>
	<td><input type="password" name="pass" class="form-control"></td></tr>
<tr><th>변경 비밀번호</th>
	<td><input type="password" name="chgpass" class="form-control"></td></tr>
<tr><th>재입력</th>
	<td><input type="password" name="chgpass2" class="form-control"></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="비밀번호변경" class="btn btn-primary">
	<input type= "reset" value="초기화" class="btn btn-secondary"></td></tr>
</table>
</form>
<script type="text/javascript">
function input_check(f){
	if(f.chgpass.value != f.chgpass2.value){
		alert("변경할비밀번호 제대로 재입력하세요");
		f.chgpass2.value="";
		f.chgpass2.focus();
		return false;
	}
	return true;
}
</script>


</body>
</html>