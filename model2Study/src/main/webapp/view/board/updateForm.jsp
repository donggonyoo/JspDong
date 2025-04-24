<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>
</head>
<body>
	<form action="update" method="post" enctype="multipart/form-data" name="f">
	<input type="hidden" name="num" value="${b.num}">
	<input type="hidden" name="file2" value="${b.file1}">
	<div class="container">
	<h2 align="center">${(b.boardid eq '1')?"공지사항":"자유게시판"} 수정</h2>
	<table class="table">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer" value="${b.writer}" class="form-control"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="form-control"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${b.title}"  class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content" id="summernote"
						class="form-control">${b.content}"</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td style="text-align:left">
				<c:if test="${!empty b.file1}">
				<div id="file_desc">${b.file1}
				<a href="javascript:file_delete()">[첨부파일 삭제]</a>
				</div>
				</c:if>
				<input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()" class="btn btn-outline-secondary">[게시물 수정]</a></td>
			</tr>
		</table>
	</div>
	</form>
<script type="text/javascript">
function file_delete() {
	document.f.file2.value="";
	file_desc.style.display="none";
	}
</script>
<script type="text/javascript">
	$(function(){
//id가summernote인 태그를 summernote에디터로변환
		$("#summernote").summernote({
			height:300,
			callbacks:{
				//onImageUpload : 이미지업로드이벤트발생
				//files : 한개이상의 이미지업로드가능(배열)
				onImageUpload : function(files){
					for(let i=0;i<files.length;i++){
						sendFile(files[i]); //하나씩 ajax이용해 서버로파일 전송
					}
				}
			}
		})
	})
	function sendFile(file){
		let data = new FormData(); //폼데이터수집하고 전송가능한 객체, 파일업로드에사용
		data.append("file",file); //이미지파일
		$.ajax({
		//path는 c:set을 이용해 절대경로로지정하자(최상단에구현)
			url : "${path}/board/uploadImage", //업로드의기능만가진서블릿에게 요청을보냄
			type:"post",
			data: data, 
			processData : false,
			contentType:false,
			success: function(url){
			//url : 업로드된 이미지의 접근url정보
			//insertImage API : 이미지삽입
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