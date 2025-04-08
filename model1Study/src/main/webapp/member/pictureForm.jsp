<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원사진등록</title>
</head>
<body>
<table>
<tr><td><img id="preview" src=""></td></tr>
<tr><td>
<!--  MIME 타입 :문서의 형식설정 문서유형/세부종류 text/html , img/jpeg , img/gif...
	accept = "img/*" img문서유형만 업로드한단 뜻
-->
<form action="picture.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="picture" id="imageFile" accept="img/*">
	<input type="submit" value="사진등록">
</form></td></tr>
</table>
<script type="text/javascript">
let imagefile = document.querySelector('#imageFile');
let preview = document.querySelector('#preview');
//파일선택을 클릭시 발생하는 이벤트
imagefile.addEventListener('change',function(e){
	//선택된파일을 담는 변수
	//e.target.files : 선택된파일들
	let get_file = e.target.files;
	let reader = new FileReader(); //파일을 읽기위한 스트림객체
	
	//reader객체에 파일이 로드되는경우 이벤트등록
	//Img매개변수 : preeview객체를 저장
	//자바스크립트에서는 함수객체를 리턴할수있음
	reader.onload = (function(Img){
		//preview(이미지태그)를 매개변수로하는 함수호출
		return function(e){
			//e.target.result: 선택된파일의value값(파일명)
			Img.src = e.target.result;
		}
	})(preview);
	
	//get_file : 선택된파일이존재하는가?
	//reader.readAsDataURL(get_file[0]) :
		//첫번쨰선택된 파일을 reader로 읽기
	if(get_file){reader.readAsDataURL(get_file[0]);}
});
</script>

</body>
</html>