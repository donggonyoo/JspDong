<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL형식화 태그</title>
</head>
<body>
<h3>숫자관련 형식 지정</h3>
<!-- ￦(ㄹ + 한자버튼)  -->
<!-- formatNumber : 숫자를 타입에맞게 설정해줌 currency(money) percent(%) pattern(커스텀가능) -->
<fmt:formatNumber value="500000" type="currency" currencySymbol="￦" />원<br>
<fmt:formatNumber value="0.15" type="percent" /><br>
<fmt:formatNumber value="50000.345"  pattern="###,###.00" /><br>
<!--  pattern="###,###.00" 3자리마다 , 를 찍고  반올림 후 소수점 두자리까지만표시 -->

<!-- setLocal value="지역" : 지역설정 -->
<h3>지역설정하기</h3>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber value="500000" type="currency"/><br>
<fmt:setLocale value="ko_KR"/>
<fmt:formatNumber value="500000" type="currency"/><br>

</body>
</html>