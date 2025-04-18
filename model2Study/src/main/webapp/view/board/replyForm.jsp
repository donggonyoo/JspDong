<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 답변글은 num을 파라미터로받음(답변을 달 글의 num) -->
<title>답변 게시글</title>
</head>
<body>
<form action="reply" method="post" name="f">
<input type="hidden" name="num" value="${b.num}">
<input type="hidden" name="grp" value="${b.grp}">
<input type="hidden" name="grplevel" value="${b.grplevel}">
<input type="hidden" name="grpstep" value="${b.grpstep}">
<input type="hidden" name="boardid" value="${b.boardid}">
<div class="container">
<h2>${(b.boardid eq '1')?"공지사항":"자유게시판"}</h2>
<table class="table">
<tr><th>글쓴이</th>
	<td><input type="text" name="writer" class="form-control"></td></tr>
<tr><th>비밀번호</th>
	<td><input type="password" name="pass" class="form-control"></td></tr>
<tr><th>제목</th>
	<td><input type="text" name="title" class="form-control" value="RE:${b.title}"></td></tr>
<tr><th>내용</th>
<td><textarea rows="15" name="content" class="form-control" id="content"></textarea>
<tr><td colspan="2" align="center">
	<a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
</table>
</div>
</form>

</body>
</html>