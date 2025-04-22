<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Random r = new Random();
	/*String[] num2 = new String[10];
	for(int i=0; i<10; i++){
		num2[i] = String.valueOf(r2.nextInt(100));// 0~99
	}
	out.print(num2);*/
	
	
	for(int i=0; i<10; i++){
		int a  = r.nextInt(100);// 0~99
		out.print(a);
		if(i!=9){
			out.print(",");
		}
	}
	
	
	
	
%>
