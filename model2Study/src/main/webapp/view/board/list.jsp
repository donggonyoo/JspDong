<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- 
첨부파일이 존재하는 게시물의 제목앞에 @ 표시
 -->
<head>
<meta charset="UTF-8">
<title>게시물목록</title>
</head>
<body>
<h2>${boardName}</h2>
<table class="table">
<c:if test="${boardcount == 0}">
	<tr><td colspan="5">등록된게시글이없어요</td></tr>
</c:if>
<c:if test="${boardcount > 0}">
	<tr><td colspan="5" style="text-align:right">글 갯수:${boardcount}</td></tr>
	<tr>
	<th width="8%">번호</th><th width="50%">제목</th>
	<th width="14%">작성자</th><th width="17%">등록일</th>
	<th width="11%">조회수</th>
	</tr>
	<c:set var="num" value="${num}" /> <!-- (controller에서만듬)num속성을 c:set으로 지정 -->
	<c:forEach var="b" items="${list}" >
		<tr><td>${num}</td>
	<c:set var="num" value="${num-1}" /> <!-- num을 -1해줌 -->
		<td style="text-align: left">
		
		<c:if test="${!empty b.file1}"><a href="../upload/board/${b.file1}">@</a></c:if>
		<c:if test="${empty b.file1}">&nbsp;&nbsp;&nbsp;</c:if>	
		<a href="info?num=${b.num}">${b.title}</a></td>
		<td>${b.writer}</td>
		<td>${b.regdate}</td>
		<td>${b.readcnt}</td>
	</c:forEach>
	<tr><td colspan="5" align="center">
		<c:if test="${pageNum <= 1}">[이전]</c:if>
		<c:if test="${pageNum > 1}">
		<a href="list?pageNum=${pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == pageNum}"><a href="#">[${a}]</a></c:if><!-- 현재페이지를 누르면 아무일도일어나지않음 -->
			<c:if test="${a != pageNum}"><!-- 다른페이지클릭시 해당 pageNum으로넘어감 -->
				<a href="list?pageNum=${a}">[${a}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageNum >= maxpage}">[다음]</c:if>
		<c:if test="${pageNum < maxpage}">
			<a href="list?pageNum=${pageNum+1}">[다음]</a>
		</c:if>
	</td></tr>
</c:if>
<tr><td colspan="5" style="text-align:right">
	<p align="right"><a href="writeForm">[글쓰기]</a></p>
</td></tr>
</table>

</body>
</html>