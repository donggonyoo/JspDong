<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jQeury -->
</head>
<body>
<div>
<form id="frm_upload" action="ex01_upload.jsp" 
	method="post" enctype="multipart/form-data">
	<!-- enctype="multipart/form-data" : 파일의 이름뿐만아니라 데이터까지 추가로넘긴단 의미 
	
	=> 서버에서는 request를 이용해 파라미터값을 가져올 수 없다
	
	=>ex01_upload.jsp 에게 요청시
		1개의 파라미터(uploader)와 
		1개의 파일정보+파일내용(filename)
	-->	
<div>
	<label for="uploader">작성자</label>
	<input type="text" id="uploader" name="uploader">
</div>
<div>
	<label for="filename">파일첨부</label>
	<input type="file" id="filename" name="filename">
	<!-- 파일의이름만넘어간다고 다른곳에서열리지않음 (파일자체가 넘어가야함)-->
</div>
<div>
	<button>첨부하기</button> <!-- button태그는 submit과 같다 -->
	<input type="reset" value="다시작성">
</div>
</form></div>
<script type="text/javascript">
$("#filename").on("change",function(){
	let filename = $(this).val();
	let extname = filename.substring(filename.lastIndexOf(".")+1).toLowerCase();
	let acceptList = ["jpg","jpeg","png","gif","tif"];
	if($.inArray(extname,acceptList)== -1){
		alert("이미지만 첨부");
		$(this).val("");
		return;
	}
})
</script>


</body></html>