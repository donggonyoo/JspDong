<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//request.getServletContext() : application객체
//realPath : ..../org.eclipse.wst.server.core/tmp0/wtpwebapps\/jspStudy/upload/

	
	String realPath = application.getRealPath("upload");//업로드되는폴더설정
	File dir = new File(realPath);
	if(!dir.exists()){
		dir.mkdirs(); //존재x 시 폴더생성
	}
	//MultipartRequest : 파일 업로드를 처리하는 역할
	MultipartRequest multi = new MultipartRequest(
			request, //요청정보,파라미터정보,파일정보(처리를할수없을 뿐 내용은 존재)
			realPath,//업로드되는 폴더설정 => 폴더에파일저장 => 업로드
			1024*1024*10,//10M => 업로드되는 파일의 최대크기
			"UTF-8",//인코딩방식
			new DefaultFileRenamePolicy()); // 파일명 중복시 이름 변경(뒤에숫자를붙여줌)
	
	String uploader = multi.getParameter("uploader"); //파라미터정보조회(name=uploader)
	String originName = multi.getOriginalFileName("filename");//선택된파일명(name=filename)
	String fileSystemName = multi.getFilesystemName("filename");//저장할떄의 파일명
	
	
	File file = multi.getFile("filename"); //업로드된파일의 정보를 File객체로반환
	String name = file.getName();//파일의이름
	String parents = file.getParent();//파일이속해있는 폴더명
	
	String lastModified = new SimpleDateFormat("yyyy-MM-dd").format(file.lastModified());
	
	//#,##0 : 숫자출력시 3자리마다 , 를표시
	//file.length() : 파일의 바이트크기 
	//file.length()/ 1024 => KB로 화산
	String size = new DecimalFormat("#,##0").format(file.length() / 1024 + 
			(file.length() % 1024 == 0? 0:1));
			
%>
<ul style="list-style-type:circle; font-size:24px"></ul>
<li>작성자 : <%= uploader %></li>
<li>원래업로드파일명 : <%= originName %></li>
<li>저장된 업로드파일명 : <%=fileSystemName  %></li>
<li>파일의 폴더경로 : <%= parents %></li>
<li>파일명 : <%= name %></li>
<li>최종수정일 : <%= lastModified %></li>
<li>파일크기 : <%= size %>KB</li>
<img src="/jspStudy/upload/<%= fileSystemName%>">


</body>
</html>