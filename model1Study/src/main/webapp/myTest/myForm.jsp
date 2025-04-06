<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동곤페이지</title>
</head>
<body>
<!-- onsubmit이 false면 action으로넘어가지않음 -->
<form action="myAdd.jsp"  onsubmit="return inputBox(this)"
method="post">
<table border="1">
	<caption>장바구니등록</caption>
	<tr><td colspan="3">상품명 : <select name="product">
	<option value="banana">바나나</option>
	<option value="apple">사과</option>
	<option value="melon">멜론</option>
	<option value="orange">오렌지</option>
	<option value="waterMelon">수박</option>
	<option value="grape">포도</option>
	</select></td></tr>
	<tr>
	<td colspan="3">갯수 입력<input type="number" placeholder="0이상입력" name="num" >
	</td>
	</tr>
	<tr>
	<td colspan="3"><button>담기</button></td>
	</tr>
</table>
</form>
<script src="myForm.js"></script>

</body>
</html>