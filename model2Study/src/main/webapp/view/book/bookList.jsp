<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%-- /webapp/view/book/bookList.jsp : 방명록 목록 조회하기
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
</head>
<body>
<h2>회원목록</h2>
<table class="table">

<tr>
<th> </th><th>작성자</th><th>제목</th>
<th>내용</th><th>등록일</th>
</tr>
<c:forEach var="b" items="${list}">
<tr>
<c:set var="num" value="${num}"></c:set>
<td style="color:purple">${num}</td>
<c:set var="num" value="${num-1}"></c:set>
<td>${b.writer}</td>
<td>${b.title}</td>
<td>${b.content}</td>
<fmt:formatDate value="${b.dt}" type="both" var="dt"/> <!-- 날짜포맷팅을위함 -->
<td>${dt}</td>
</tr>
</c:forEach>
	<tr><td colspan="5" align="center">
		<c:if test="${pageNum <= 1}">[이전]</c:if>
		<c:if test="${pageNum > 1}">
		<a href="bookList?pageNum=${pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == pageNum}"><a href="#">[${a}]</a></c:if><!-- 현재페이지를 누르면 아무일도일어나지않음 -->
			<c:if test="${a != pageNum}"><!-- 다른페이지클릭시 해당 pageNum으로넘어감 -->
				<a href="bookList?pageNum=${a}">[${a}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageNum >= maxpage}">[다음]</c:if>
		<c:if test="${pageNum < maxpage}">
			<a href="bookList?pageNum=${pageNum+1}">[다음]</a>
		</c:if>
	</td></tr>
<tr><td colspan="5"><p align="right"><a href="bookForm" class="btn btn-outline-primary ">[글쓰기]</a></p></tr>
</table>
</body>
</html>