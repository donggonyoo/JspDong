<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
int a  = Integer.parseInt(request.getParameter("f"));
int num = Integer.parseInt(request.getParameter("num"));
switch(a){
case 0 :{
		int sum=0;
		for(int i =1 ; i<=num ; i++){
			sum+= i;
		}
		 out.print(sum);
		}break;
		
case 1 :{
	int sum=0;
	for(int i =1 ; i<=num ; i++){
		if(i%2==0){
			sum+= i;
		}
	}out.print(sum);
	}break;

case 2 :{
	int sum=0;
	for(int i =1 ; i<=num ; i++){
		if(i%2==1){
			sum+= i;
		}
	}
	out.print(sum);
	}	break;	
}
 %>
<td></td>