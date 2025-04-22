<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!-- database Connection객체 -->
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3306/gdjdb"
	user="gduser" password="1234"/>
<!-- SQL 문장 실행 -->
<!-- rs : select구문실행결과(레코드정보) -->
<sql:query var="rs" dataSource="${conn}" >
select * from member where id=? and pass=?
<sql:param>${param.id}</sql:param><%--1번째 '?' --%> 
<sql:param>${param.pass}</sql:param><%--  2번째 '?'--%>
</sql:query>
<c:if test="${!empty rs.rows}"> <%-- rs.rows : 조회된결과들 --%>
	<h1>반갑습니다 ${rs.rows[0].name}님</h1>
</c:if>

<c:if test="${empty rs.rows}">
	<h1><font color="red">아이디or비번이 틀려요</font></h1>
</c:if>
