
<%@page import="org.apache.catalina.mbeans.DataSourceUserDatabaseMBean"%>
<%@page import="java.nio.DoubleBuffer"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버시장지표검색</title>
</head>
<body>
<%
	String url = "https://finance.naver.com/marketindex/";
	Document doc = null;
	List<String> codes = new ArrayList(); //통화량
	List<String> values = new ArrayList(); //환율
	List<Double> changes = new ArrayList(); //상승하락
	
	try{
		doc = Jsoup.connect(url).get();
		Elements hlist = doc.select("div.head_info");
		Elements htitle = doc.select("h3.h_lst");
		for(int i=0;i<hlist.size();i++){
			Element tag = hlist.get(i);
			Element title = htitle.get(i);
			System.out.println(tag); //환율정보(가격 ,원화,변동률 등)
			System.out.println(title); //통화명들
			/*tag
			<div class="head_info point_up">
			<span class="value">1,433.90</span> 
			<span class="txt_krw">
			<span class="blind">원</span></span> 
			<span class="change">1.90</span> 
			<span class="blind">상승</span>
			</div>
			
			title
			<h3 class="h_lst">
			<span class="blind">미국 USD</span></h3>*/
			
			System.out.println("============");
			//selectFirst : 첫번쨰요소리턴
			String name = title.selectFirst("span.blind").html(); //통화명
			if(!name.trim().contains("국제금") && !name.trim().contains("국내금") ){
			out.print(name+":");
			codes.add(name);
			
			String value = tag.selectFirst("span.value").html();//가격
			out.print(value+"&nbsp;&nbsp;");
			values.add(value.replace(",", ""));
			
			
			
			String change = tag.selectFirst("span.change").html();//변동률
			out.print(change+"&nbsp;&nbsp;");
		
			
			Elements blinds = tag.select("span.blind");// 원 , 상승/하락문자열
			Element blind = blinds.get(blinds.size()-1); // 상승하락문자열
			out.print(blind+"<br>");
			double d = 0;
			System.out.println(blind+"===========");
			
			if(blind.toString().trim().contains("하락")){
				d = Double.parseDouble(change.replace(",",""))*-1;
			}
			else{
				d = Double.parseDouble(change.replace(",", ""));
			}
			
			changes.add(d);
			
			}
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}	
	
	
	//국제금 국내금 제외시키기
	for(int i=1;i<=2;i++){
		codes.remove(codes.size()-1);
		changes.remove(changes.size()-1);
		values.remove(values.size()-1);
	}
	
	request.setAttribute("codes", codes);
	request.setAttribute("changes", changes);
	request.setAttribute("values", values);

	
	
%>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<%--데이터이용해서 change값으로 선그래프 구현하기 (국제금,국내금 제외)--%>
<canvas id="canvas1" width="300" height="100"></canvas>
<%--데이터이용해서 value값으로 막대 구현하기 --%>
<canvas id="canvas2" width="300" height="100"></canvas>



<script type="text/javascript">
let codes = [<c:forEach var="code" items="${codes}">"${code}",</c:forEach>]
let chartData1 = {
	labels: codes,
	datasets:[{
		borderColor : '#FF00FF',
		borderWidth : 3,
		fill : false,
		data : [<c:forEach var="chg" items="${changes}">${Double.parseDouble(chg)},</c:forEach>]
	}]
}
let chartData2 = {
		labels: codes,
		datasets:[{
			borderColor : '#FF00FF',
			backgroundColor : '#00FF00',
			borderWidth : 3,
			fill : false,
			data : [<c:forEach var="val" items="${values}">${val},</c:forEach>]
		}]
	}

window.onload = function(){
	let ctx1 = document.querySelector("#canvas1")
	new Chart(ctx1,{
		type:'line',
		data:chartData1,
		options:{
			responsive : true,
			title : {diplay:true , text:'네이버금융데이터'},
			legend : {display : false}
		}
	})
	let ctx2 = document.querySelector("#canvas2")
	new Chart(ctx2,{
		type:'bar',
		data:chartData2,
		options:{
			responsive : true,
			title : {diplay:true , text:'네이버금융데이터(환율)'},
			legend : {display : false}
		}
	})
}
</script>

</body>
</html>