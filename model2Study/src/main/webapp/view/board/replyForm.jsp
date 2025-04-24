<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }" scope="application"></c:set>
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
<td><textarea rows="15" name="content" class="form-control" id="summernote"></textarea>
<tr><td colspan="2" align="center">
	<a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
</table>
</div>
</form>
<script type="text/javascript">
	$(function(){
		$("#summernote").summernote({
			height:300,
			callbacks:{
				//이미지업로드이벤트발생
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
			//${path}를 사용하기위해서는 layout부분에 path를 설정한곳에 
			//scope="application"추가
			url : "${path}/board/uploadImage", //업로드의기능만가진서블릿
			type:"post",
			data: data, 
			processData : false,
			contentType:false,
			success: function(url){
			//url : 업로드된 이미지의 접근url정보
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