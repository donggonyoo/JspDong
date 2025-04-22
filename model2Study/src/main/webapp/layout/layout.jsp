<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property="title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.footer {
	display: flex;
	flex-direction: column;
}

.footer_link {
	height: 15%;
	display: flex;
	align-items: center;
}

.footer_link a {
	text-decoration: none;
	color: black;
	font-weight: bold;
	margin: 15px;
}

.footer_company {
	height: 70%;
}

.footer_company>ul {
	list-style: "- ";
	padding-left: 15px;
}

.footer_copyright {
	height: 15%;
	text-align: center
}

.footer>div {
	border-top: 1px solid gray
}
</style>
<sitemesh:write property="head" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>dongPage</h1>
		<p>남자의 페이지</p>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">목록</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${path}/member/main">회원관리</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/board/list?boardid=1">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/board/list?boardid=2">자유게시판</a></li>
				<c:if test="${sessionScope.login != null}">
					<li class="nav-item"><a class="nav-link" href="#">${sessionScope.login}님
							하이</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/member/logout">로그아웃</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="javascript:history.go(-1)">뒤로가기</a></li>

			</ul>
		</div>
	</nav>
	<div class="container" style="margin-top: 30px">
		<sitemesh:write property="body" />
	</div>

	<footer class="footer">
		<div>
			<span id="si"> 
			<select name="si" onchange="getText('si')">
				<option value="">시,도를 선택하세요</option>
			</select>
			</span>
			<span id="gu"> 
			<select name="gu" onchange="getText('gu')">
				<option value="">구군 선택하세요</option>
			</select>
			</span>
			<span id="dong"> 
			<select name="dong" onchange="getText('dong')">
				<option value="">동리를 선택하세요</option>
			</select>
			</span>
		</div>
		<div class="footer_link">
			<a href="">이용약관</a> | <a href="">개인정보취급방침</a> | <a href="">인재채용</a> |
			<a href="">고객센터</a>
		</div>
		<div class="footer_company">
			<ul>
				<li>상호명 : DongCompany</li>
				<li>대표자 : 유동곤</li>
				<li>전화 : 010-86948525</li>
				<li>개인정보책임자 : 유동곤 /ddkk8525@gmail.com</li>
			</ul>
		</div>
		<div class="footer_copyright">Copyright ⓒ dong Company.
			Allrights reserved.</div>
	</footer>
	
	<script type="text/javascript">
	$(function(){	
		$.ajax({
			url : "${path}/ajax/select",
			success: function(data){
//data : ["서울특별시","경기도",.....]
				let arr = JSON.parse(data)
				$.each(arr,function(i,item){
			//item : 서울특별시
					$("select[name=si]").append(function(){
						return "<option>"+item+"</option>"	
					})
				})
			},
			error:function(e){
				alert("서버오류 : "+e.status)
			}
		})
		
		function getText(type) {
			const si = $("select[name=si]").val();
			const gu = $("select[name=gu]").val();
			let url = "";
			let targetSelect;
			
			if (type === "si") {
				if (!si) return;
				url = "${path}/ajax/select?si="+si;
				targetSelect = $("select[name=gu]");
			} else if (type === "gu") {
				if (!si || !gu) return;
				url = "${path}/ajax/select?si="+si+"&gu="+gu;
				targetSelect = $("select[name=dong]");
			} else {
				// 'dong'은 선택 이벤트만 존재하고 요청은 보내지 않음
				return;
			}

			$.ajax({
				url: url,
				success: function(data) {
					const arr = JSON.parse(data);
					$.each(arr, function(i, item) {
						targetSelect.append("<option>"+item+"</option>"	);
					});
				},
				error: function(e) {
					alert("서버 오류 : " + e.status);
				}
			});
		}

	})

	</script>
</body>
</html>