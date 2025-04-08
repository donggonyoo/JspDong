<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	1.request객체로 이미지업로드불가능 ==>cos.jar
	2.이미지업로드폴더 : 현재폴더/picture 설정
	3.opener 화면에이미지볼수있도록 결과전달
	4.현재화면 close하기
-->
<%
String path = application.getRealPath("")+"member/picture/";
String fname = null;
File f = new File(path);//업로드되는 폴더정보
if(!f.exists()){
	f.mkdirs(); //없으면 폴더생성
}
//request : 이미지데이터저장
//path : 업로드되는 폴더정보
//10*1024*1024 : 최대업로드크기(10M)
//new DefaultFileRenamePolicy() : 중복파일명존재시 이름변경해

MultipartRequest multi = new MultipartRequest
	(request,path,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());

fname = multi.getFilesystemName("picture");

//getFilesystemName("picture") 파라미터가 'picture'인정보를가져옴
%>


<script>
/*
 * opener : 현재창을 open한 window객체(joinForm.jsp페이지의 window객체)
 */
	img = opener.document.getElementById("pic");//id="pic" ..이미지객체임
	/*id=pic인 태그에 미리보기 지원*/
	img.src = "picture/<%= fname%>"; 
	
	/*form하위의 name=picture인 값에 넣어라*/
	opener.document.f.picture.value = "<%=fname%>";
	//self : 현재페이지
	self.close();//창을 닫는다
/*
 * BOM 
 	window : 최상위객체
 	document : 문서객체
 	 form : <form name="f"..>
		input: <input type="hidden" value="fname"..>
 	location : 현재페이지의 url저장
 	history : 현재페이지의 과거부터현재까지의 url정보
 */
</script>


