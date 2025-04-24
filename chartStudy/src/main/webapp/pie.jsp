<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
   <%--pie그래프로 게시글 작성자별 건수 출력하기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PIE</title>
</head>
<body>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/gdjdb"
	user="gduser" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
select writer,count(*) cnt from board
group by writer
order by count(*) desc
</sql:query>
<div style="width:75%"><canvas id="canvas"></canvas></div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
let randomColorFactor = function(){
	return Math.round(Math.random()*255)//0~255사이의 정수
}
let randomColor = function(opacity){
		return "rgba("+ randomColorFactor()+","
			+ randomColorFactor() + ","+randomColorFactor()+","
			+(opacity || ".3")+")";
}

let chartData = {
		labels:  
	[<c:forEach items="${rs.rows}" var="m">"${m.writer}",</c:forEach>],
		datasets :[
			{
				type:'pie',
				borderWidth : 2,
				backgroundColor : [<c:forEach items="${rs.rows}" var="m">randomColor(1),</c:forEach>],
				label :'건수',
				fill : false,
				data: 
					[<c:forEach items="${rs.rows}" var="m">"${m.cnt}",</c:forEach>],
			}]
		
		
	}
	
window.onload = function(){
	let ctx = document.querySelector("#canvas");
	new Chart(ctx,{
		type:'pie',
		data : chartData,
		options:{
		responsive : true,
			plugins:{
				legend:{
					display:true,
					position:'right'
				},
				
				title:{
					display:true,
					text:"작성자별 게시판 등록건수",
					position:'bottom',
					color:'purple',
					font:{
						size:30
					}
				},
			},
			
		}//option
	})//chart
}

	


</script>

</body>
</html>