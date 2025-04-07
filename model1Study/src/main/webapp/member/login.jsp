<%@page import="model.member.MemberDto"%>
<%@page import="model.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    1파라미터값을 조회해야함
    2.DB에서 입력된 아이디의 레코드를 읽어서 멤버객체에저장
    3.입력된내용과 조회된 내용을 비교
    	아이디존재 : 없는경우 -> 아이디없음 메시지출력 후 loginForm.jsp로이동
    			있는경우 => 비번을 비교
    	비밀번호 비교
    	불일치 : 비밀번호 오류 loginForm.jsp로이동
    	일치 : session 로그인정보등록 , main.jsp로이동
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//DB에서 등록정보조회
	Member mem = new MemberDto().selectOne(id);
	//3 내용비교
	String msg=null;
	String url = "loginForm.jsp";
	
	if(mem==null){
		msg="아이디를 확인하세요";
	}
	
	else{
		//요청받은 비밀번호와 DB의 비밀번호비교
		if(pass.equals(mem.getPass())){//로그인성공
			session.setAttribute("login", id); //login속성 등록
			msg= mem.getName()+"님이 로그인 하셨습니다";
			url = "main.jsp";
		}
		else{
			msg = "비밀번호가 틀려요";
			//url = "loginForm.jsp";
			
			}
	}

	%>
<script type="text/javascript">
alert("<%=msg%>");
location.href = "<%= url%>";
</script>
</body>
</html>