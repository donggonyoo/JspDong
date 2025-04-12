<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("${msg}")
//requestScope.msg
opener.document.f.pass.value = "${pass}"
//requestScope.pass
self.close();
</script>