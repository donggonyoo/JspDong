<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
img = opener.document.getElementById("pic");//id="pic" ..이미지객체임
img.src = "${pageContext.request.contextPath}/picture/${fname}"; 

/*form하위의 name=picture인 값에(type=hidden) 넣어라
 * DB에 경로를 전부다 넣기에는 길다.
 */
opener.document.f.picture.value = "${fname}";
//self : 현재페이지
self.close();//창을 닫는다
</script>