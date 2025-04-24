<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!-- /webapp/view/board/writeForm.jsp -->
<!-- 
	1. boardid가 1인경우 , 관리자가아니면 관리자만 공지사항 글쓰기가 가능합니다
	공지사항 목록 페이지이동
 -->
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
				<td><textarea rows="15" name="content" id="summernote"
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
	<%--summernote관련 구현 --%>
<script type="text/javascript">
	$(function(){
		$("#summernote").summernote({
			height:300,
			callbacks:{
				//onImageUpload : 이미지업로드이벤트발생
				//files : 한개이상의 이미지업로드가능(배열)
				onImageUpload : function(files){
					for(let i=0;i<files.length;i++){
						sendFile(files[i]); //파일 하나씩 ajax이용해 서버로파일 전송
					}
				}
			}
		})
	})
	function sendFile(file){
		let data = new FormData(); //폼데이터수집하고 전송가능한 객체, 파일업로드에사용
		data.append("file",file); //이미지파일
		$.ajax({
			//${path}를 사용하기위해서는 layout부분에 path를 설정한곳에 
			//scope="application"추가
			url : "${path}/board/uploadImage", //업로드의기능만가진서블릿
			type:"post",
			data: data, //data = 전송받은 이미지파일들
			processData : false,
			contentType:false,
			success: function(url){
			//url : 업로드된 이미지의 접근url정보
			//insertImage : image삽입
				$("#summernote").summernote("insertImage",url);
			},
			error : function(e){
				alert("이미지업로드실패 : "+e.status);
			}
		})
	}
</script>
</body>
</html>