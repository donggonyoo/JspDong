<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/jspStudy/css/main.css"> <!-- 해당경로의 css파일을 사용 -->
<%-- http://localhost:8080/jspStudy/
	이클립스폴더  : /jspStudy/src/main/wepapp 폴더를 시작
 --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");//JDBC Drive 클래스 로드

	Connection conn = DriverManager.getConnection
	("jdbc:mariadb://localhost:3306/gdjdb","gduser","1234"); //db와연결
	//gdjdb : DB명  , gduser:유저명 , 1234 : 비번)
	
	PreparedStatement pstmt = conn.prepareStatement("select * from professor");
	//prepareStatement : SQL명령문을 DB에 전달하기위한 객체(Statement의 하위)
	
	//executeQuery() : sql문 실행해 ResultSet으로 리턴
	//ResultSet : select구문의 결과를 저장하는 객체
	ResultSet rs  = pstmt.executeQuery();
	
	//ResultSetMetaData : 결과데이터의 정보 저장
	ResultSetMetaData rsmt = rs.getMetaData(); 
%>

<table><tr>
<% for(int i=1;i<=rsmt.getColumnCount();i++){%>
	<th><%=rsmt.getColumnName(i)%></th><%}%></tr> <!-- 모든 컬럼명 -->
<%  while(rs.next()) {%><tr>
<% for(int i=1;i<=rsmt.getColumnCount();i++){ %> <!-- rs.getString("컬럼명") : 컬럼의값 읽어오기 -->
	<td><%=rs.getString(i)%></td><%}%></tr><!-- for문종료 -->
	<%} %><!-- while문 종료 -->
</table>

</body>
</html>