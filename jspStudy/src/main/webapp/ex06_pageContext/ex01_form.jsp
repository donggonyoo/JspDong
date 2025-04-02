<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시조회</title>
</head>
<body>
<select id="city">
<option value="seoul">서울</option><option value="busan">부산</option>
</select>
<input type="button" value="도시조회" onclick="city_select(document.querySelector('#city').value)">
<script type="text/javascript">
	function city_select(city) {
		location.href = "ex01_city.jsp?city="+city; //city = seoul | busan
	<%--select에 따라 현재 URL을 다음과같이 변경한다 --%>
	}
</script>

</body>
</html>