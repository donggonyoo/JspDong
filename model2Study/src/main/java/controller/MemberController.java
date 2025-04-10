package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.member.Member;
import model.member.MemberDto;

//http://localhost:8080/model2Study/member/joinForm로 접속해봐
@WebServlet(urlPatterns = { "/member/*" }, 
initParams = { @WebInitParam(name = "view", value = "/view/") })
//서블릿(MskimRequestMapping)에 존재하지않는다면 view폴더 하위의 member폴더 하위에서찾는다

public class MemberController extends MskimRequestMapping {
	private MemberDto dto = new MemberDto();

	/*
	 * 1.파라미터정보를 Member객체에 저장 (인코딩필요) (Filter이용) 
	 * 2.Member객체를 이용해 db에insert(member테이블저장) 
	 * 3.가입성공 : 성공메시지 출력 후 loginForm 이동 
	 * 가입실패 : 실패메시지출력 후 joinForm 이동
	 */


	@RequestMapping("join") // http://localhost:8080/model2Study/member/join 시 호출
	public String join(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		if (dto.insert(mem)) {// 삽입
			request.setAttribute("msg", mem.getName()+"님 회원가입완료");
			request.setAttribute("url", "loginForm");
		}
		else {
			request.setAttribute("msg", mem.getName()+"님 회원가입시 오류발생");
			request.setAttribute("url", "joinForm");
		}
		return "alert"; //view하위의 alert페이지로 이동해라(alert페이지 출력과 페이지이동을 위한페이지)

	}

	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response ) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDto().selectOne(id);
	
		if(mem==null){
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url","loginForm");
		}

		else{
			//요청받은 비밀번호와 DB의 비밀번호비교
			if(pass.equals(mem.getPass())){//로그인성공
				session.setAttribute("login", id);
				request.setAttribute("msg", mem.getName()+"님이 로그인 하셨습니다");
				request.setAttribute("url","main");
				
			}
			else{
				request.setAttribute("msg", "비번을 확인하세요");
				request.setAttribute("url","loginForm");

			}
		}
		return "alert";

	}
}