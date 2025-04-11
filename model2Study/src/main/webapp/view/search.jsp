<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("${msg}")
opener.document.f.id.value = "${id}"
self.close();
</script>