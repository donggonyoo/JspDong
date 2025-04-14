<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
img = opener.document.getElementById("pic");//id="pic" ..이미지객체임
img.src = "${pageContext.request.contextPath}/picture/${fname}"; 

/*form하위의 name=picture인 값에 넣어라*/
opener.document.f.picture.value = "${fname}";
//self : 현재페이지
self.close();//창을 닫는다
</script>