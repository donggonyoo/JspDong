<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<h2>회원목록</h2>
	<form action="mailForm" name="f" method="post"
		onsubmit="return input_check(this)">
		<table class="table">
			<tr>
				<th>아이디</th>
				<th>사진</th>
				<th>이름</th>
				<th>성별</th>
				<th>전화</th>
				<th>&nbsp;</th>
				<th><input type="checkbox" name="alchk"
					onchange="allchkbox(this)">전체선택</th>
			</tr>
			<c:forEach var="mem" items="${list}"> <%--멤버객체가있는 list --%> 
				<tr>
					<td><a href="info?id=${mem.id}">${mem.id}</a></td>
					<td><img src="${pageContext.request.contextPath}/picture/${mem.picture}" width="30" height="30"></td>
					<%--C:/java/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/model2Study/picture/ --%>
					<td>${mem.name}</td>
					<td>${mem.gender==1?"남":"여"}</td>
					<td>${mem.tel}</td>
					<td><a href="updateForm?id=${mem.id}">수정</a> <c:if
							test="${mem.id == 'admin'}">
							<a href="deleteForm?id=${mem.id}">강제탈퇴</a>
						</c:if></td>
					<td><input type="checkbox" name="idchk" class="idchk"  value="${mem.id}"
									onchange="${mem.id}"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7" id="center"align="right">
					<button type="submit" class="btn btn-outline-dark">메일보내기</button>
				</td>
			</tr>
		</table>
	</form>

<script type="text/javascript">
	function input_check(f){
		let cnt=0;
		document.querySelectorAll(".idchk").forEach((idchk)=>{
		if(idchk.checked){
			cnt++; //idchk : checkbox한개
		}
	})	
	
	if(cnt==0){ //선택된 checkbox가 없는경우
		alert("이메일 전송 아이디를 선택하세요");
		return false;
	}
	return true;
   }

	function allchkbox(chk) {
		const checkboxes = document.querySelectorAll('.idchk').forEach((idchk)=>{
				idchk.checked = chk.checked;
		})	
	}
</script>

</body>
</html>