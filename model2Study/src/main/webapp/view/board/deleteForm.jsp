<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE FORM</title>
</head>
<body>
<form action="delete" method="post">
<input type="hidden" name="num" value="${param.num}">
<table class="table">
<tr><td>password:<input type="password" name="pass" class="form-control"></td></tr>
<tr><td><button class="btn btn-danger">게시물삭제</button></td></tr>
</table>
</form>
<script type="text/javascript">

</script>


</body>
</html>