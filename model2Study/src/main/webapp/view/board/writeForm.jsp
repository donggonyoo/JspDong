<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- /webapp/view/board/writeForm.jsp -->
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글등록</title>
</head>
<body>
	<form action="write" method="post" enctype="multipart/form-data"
		name="f">
		<h2 class="text-center">게시판 글쓰기</h2>
		<table class="table">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer" class="form-control"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="form-control"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content" id="content"
						class="form-control"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:inputcheck()" class="btn btn-outline-secondary">[게시물등록]</a></td>
			</tr>
		</table>

	</form>
	<script type="text/javascript">
		function inputcheck() {
			f = document.f;
			if (f.writer.value == "") {
				alert("글쓴이 입력");
				f.writer.focus();
				return;
			}
			if (f.pass.value == "") {
				alert("비밀번호입력");
				f.pass.focus();
				return;
			}
			if (f.title.value == "") {
				alert("제목입력");
				f.title.focus();
				return;
			}
			f.submit(); //모두아니라면 submit발생 
		}
	</script>

</body>
</html>