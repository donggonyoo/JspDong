<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath }" scope="application"></c:set>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.min.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
	
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.min.js"></script>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-6" style="border: 1px solid #EEEEEE;">
				<%-- 작성자별 게시물 등록 건수 pie그래프 : 가장많이작성한작성자 5명만 --%>
				<canvas id="canvas1"></canvas>
			</div>
			<div class="col-6" style="border: 1px solid #EEEEEE;">
				<%-- 최근작성일자 기준 게시물 등록 건수 pie그래프 : 가장많이작성한작성자 5명만--%>
				<canvas id="canvas2" ></canvas>
			</div>
		</div>
		<sitemesh:write property="body" />
	</div>

	<footer class="footer">
		<div>
			<span id="si"> <select name="si" onchange="getText('si')">
					<option value="">시,도를 선택하세요</option>
			</select>
			</span> <span id="gu"> <select name="gu" onchange="getText('gu')">
					<option value="">구군 선택하세요</option>
			</select>
			</span> <span id="dong"> <select name="dong">
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
		piegraph();
		bargraph();
		
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
	}) //여기까지의부분은 모든 시(name='si')를 AJAX를 통해 가져올거임
	
			
		function getText(type) { // 시 or 도를 선택하면 발생하는 함수
			const si = $("select[name=si]").val(); //클릭한 시의 vlaue
			const gu = $("select[name=gu]").val();//클릭한 구의 vlaue
			let url = "";
			let targetSelect;
			
			if (type === "si") {
				if (!si) return;
				url = "${path}/ajax/select?si="+si; //입력받은si의값을 파라미터로갖는 주소
				targetSelect = $("select[name=gu]"); //target을 gu에해당하는 select태그로설정
				// 시를 선택하면 기존 구, 동 초기화
		        $("select[name=gu]").html('<option value="">구군 선택하세요</option>');
		        $("select[name=dong]").html('<option value="">동리를 선택하세요</option>');
		        
			} else if (type === "gu") {
				if (!si || !gu) return;
				url = "${path}/ajax/select?si="+si+"&gu="+gu;
				targetSelect = $("select[name=dong]");
				// 구를 선택하면 기존  동 초기화		  
		        $("select[name=dong]").html('<option value="">동리를 선택하세요</option>');
			} else {
				return;
			}

			$.ajax({ //ajax에 요청을 보낼거임
				url: url, //위 type에의한  url 설정
				success: function(data) {
					const arr = JSON.parse(data); //성공시 JSON방식(배열)으로 데이터를가져옴
					$.each(arr, function(i, item) {
						//해당배열을 순회해서 나온값들을 모두 taget태그하위에 option으로넣는다
						targetSelect.append("<option>"+item+"</option>"	);
					});
				},
				error: function(e) {
					alert("서버 오류 : " + e.status);
				}
			});
		}
	
	
	function piegraph(){
		$.ajax("${path}/ajax/graph1",{
			success: function(data){
//data : [{"cnt":24,"writer":유동곤"},{"cnt":2,"writer":fff"},{"cnt":2,"writer":admin"},{"cnt":1,"writer":김창민"},{"cnt":1,"writer":김민지"}]
				pieGraphPrint(data);
			},
			error : function(e){
				alert("서버오류 : "+e.status)
			}
		})
	}
	
	function bargraph(){
		$.ajax("${path}/ajax/graph2",{
			success: function(data){
				bargraphPrint(data);
			},
			error : function(e){
				alert("서버오류 : "+e.status)
			}
		})
	}
	
	let randomColorFactor = function(){
		return Math.round(Math.random()*255)//0~255사이의 정수
	}
	
	let randomColor = function(opacity){
		//rgba(100,100,50,1) : rgba(red,green,blue,투명도)
		//투명도 : 0~1사이의값,  0:투명 1:불투명
			return "rgba("+ randomColorFactor()+","
				+ randomColorFactor() + ","+randomColorFactor()+","
				+(opacity || ".3")+")";
		}
	
	
	function pieGraphPrint(data){
		let rows = JSON.parse(data); //json형식으로데이터를받아
		let writers = [] //작성자목록
		let datas=[] //게시물 갯수
		let color=[] // 랜덤한Color를 넣어둘곳
		
		$.each(rows,function(i,item){//모든데이터를 순회

		//item : {"cnt":3,"writer":"홍길동"}
			writers[i] = item.writer; // "홍길동"
			datas[i] = item.cnt; //3
			color[i] = randomColor(1);
		})
		
		let config = {
			type:'pie',
			data : {
				datasets:[{
					data : datas,//cnt가있는배열
					backgroundColor : color
				}],
				labels : writers,
			},
			options : {
				responsive: true,//반응형차트생성
					legend : {position:"right"},//label을 우측에위치
					title : {
						display : true,
						text : '게시물 작성자별 등록건수(최대 5명)',
						position:'bottom'
					}
			}
		}
		let ctx = document.querySelector("#canvas1");
		new Chart(ctx,config)
	}
	
	
	
	function bargraphPrint(data){
		let rows = JSON.parse(data);
		let dates =[] //날짜
		let cnts=[] //게시물 갯수
		let color=[] // 랜덤한Color를 넣어둘곳
		console.log("rows : ",rows)

	
		
		$.each(rows,function(i,item){//모든데이터를 순회
			cnts[i] = item.cnt; //게시물개수
			dates[i] = item.date; //날짜(년월일)
			color[i] = randomColor(1);
		})

		let config = {
			type:'bar',
			data : {
				datasets:[{
					data : cnts,
					backgroundColor : color
				}],
				labels : dates,
			},
			options : {
				responsive: true,
					legend : { display: false,position:"right"},
				title : {
					display : true,
					text : '날짜별 등록건수(최대5일)',
					position:'bottom'
				},
			scales:{
				yAxes:[{
					ticks:{
						display : true,
						beginAtZero:true
					},
				}]
			}
				
			}
		}
		let ctx = document.querySelector("#canvas2");
		new Chart(ctx,config)
	}


	</script>

</body>
</html>