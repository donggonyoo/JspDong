<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검색</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
.able {
	color: green;
	font-size: 15px;
}

.disable {
	color: red;
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<td>아이디</td>
				<td>${param.id}</td>
			</tr>
			<tr>
				<td colspan="2"><div id="msg">${msg}</div></td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="self.close()"
						class="btn btn-primary">닫기</button></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
if(${able}){
	document.querySelector("#msg").className="able"; //글자색변경을위해
	opener.document.f.chk.className = "btn btn-success";

}
else{
	opener.document.f.id.value="" //아이디입력값 다 지워버리기
	opener.document.f.chk.className = 	"btn btn-warning"
	document.querySelector("#msg").className="disable";
}
</script>
</body>
</html>