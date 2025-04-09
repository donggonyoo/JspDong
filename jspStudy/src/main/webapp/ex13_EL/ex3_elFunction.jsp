<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	prefix = "test" : 접두어가 test인 태그(함수)인 경우
	
	uri="/ELFunctions" : uri가 /ELFunctions인 파일 참조
	/WEB-INF/의 하위폴더에서 <uri>/ELFunctions</uri> 형태로
					설정된파일 검색=> /tlds/el_function.tld파일선택
 -->
<%@ taglib prefix="test" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post"><!-- action속성X => 현재페이지다시호출 -->
x : <input type="text" name="x" value="${param.x}"><br>
y : <input type="text" name="y" value="${param.y}"><br>
<input type="submit" value="더하기">
</form>
<p>
합계 : ${test:add(param.x,param.y) }<br>
</body>

</html>