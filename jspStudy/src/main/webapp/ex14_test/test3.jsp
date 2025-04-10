<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method="post" name="f">
  x:<input type="text" name="x" value="${param.x}" size="5">
  <select name="op">
  <!-- 선택된값을 selected 처리해줌(선택) -->
     <option value="+" >+</option>
     <option value="-" >-</option>
     <option value="*" >*</option>
     <option value="/">/</option>
  </select>
  y:<input type="text" name="y" value="${param.y}" size="5">
  <input type="submit" value="=">
  <script>
  	var op = '${param.op}';
  	if(op==''){
  		op = '+';
  	}
  	document.f.op.value = op;
  </script>
</form>
	<c:if test="${param.op eq '+'}">
		<h4>${param.x}+${param.y}=${param.x+param.y}</h4>
	</c:if>
	<c:if test="${param.op eq '-'}">
		<h4>${param.x}-${param.y}=${param.x-param.y}</h4>
	</c:if>
	<c:if test="${param.op eq '*'}">
		<h4>${param.x}*${param.y}=${param.x*param.y}</h4>
	</c:if>
	<c:if test="${param.op eq '/'}">
		<h4>${param.x}/${param.y}=${param.x/param.y}</h4>
	</c:if>


  </body></html>