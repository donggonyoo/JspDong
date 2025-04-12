<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("${requestScope.msg}")

opener.document.f.pass.value = "${requestScope.pass}"
//request영역의 속성인 msg , pass

self.close();
</script>