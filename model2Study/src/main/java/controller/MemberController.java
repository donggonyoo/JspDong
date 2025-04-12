package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.member.Member;
import model.member.MemberDto;

//http://localhost:8080/현재패키지/member/ ? 로 접근
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

	/*
	 * http://localhost:8080/model2Study/member/joinForm
	 * =>  @RequestMapping("joinForm")필요
	 * 구현되지않은경우
	  /member/joinForm url 정보를 이용해 /webapp/view/member/joinForm.jsp 페이지가 
	 * 			view로 설정되도록 구현
	 */
	//==    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response ) {
		HttpSession session = request.getSession(); 
		//session정보를 얻음(session영역 속성 등록을위해)

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
	//	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	
	@RequestMapping("main")
	public String main(HttpServletRequest request , HttpServletResponse response) {

		String login = (String)request.getSession().getAttribute("login");
		if(login==null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url","loginForm");
			return "alert";
		}
		return "member/main"; //forward 됨
		//redirect시 다른 request영역이므로 속성이 넘어가지않음

	}
	//=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	

	/*
	 * forward   서버에서 요청하는것(같은 request영역)
	 * redirect  서버에서 브라우저로 재요청(그냥새로운페이지임)(다른 request영역)
	 * */



	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "redirect:loginForm"; //redirect하도록 설정
	}

	//=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	=    =       = 	
	/*
	   1. 로그인상태검증 --> @MSLogin("loginIdCheck")
	   loginIdCheck() 함수를 호출해 검증 실행
	   리턴값이 null인 경우 == 정상

	    로그인상태 : 회원정보보여줌(자신)
	    	다른id를 조회불가능 단 관리자는 다른id를 조회할수있음
	    2.id파라미터조회
	    3.id에 해당하는 레코드조회
	 */
	@RequestMapping("info")
	@MSLogin("loginIdCheck")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		//로그인 검증 완료 시 실행되는 문장들
		String id = request.getParameter("id");
		Member mem = dto.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/info";	 //redirect로보내면 mem속성이 넘어가지않음
	}

	//--------------------함수생성-----------------------------------------------------
	public String loginIdCheck(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String login  = (String)session.getAttribute("login");
		if(login==null) {
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		else if(!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인만 접근가능");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null; //정상인경우
	}

	@RequestMapping("updateForm")
	@MSLogin("loginIdCheck")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		//로그인 검증 완료 시 실행되는 문장들
		String id = request.getParameter("id");
		Member mem = dto.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/updateForm";	 //redirect로보내면 mem속성이 넘어가지않음
	}

	/*/webapp/member/update.jsp 
	   1. 모든 파라미터를 Member 객체에 저장하기
	   2. 입력된 비밀번호와 db에 저장된 비밀번호 비교.
	       관리자로 로그인 한 경우 관리자비밀번호로 비교
	       본인 정보 수정시 본인의 비밀번호로 비교
	       불일치 : '비밀번호 오류' 메세지 출력후 updateForm 페이지 이동 
	   3. Member 객체의 내용으로 db를 수정하기 : boolean MemberDto.update(Member)
	       - 성공 : 회원정보 수정 완료 메세지 출력후 info로 페이지 이동
	       - 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm 페이지 이동   
	 */

	@RequestMapping("update")
	@MSLogin("loginIdCheck")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		//2 비밀번호를 위한 db의 데이터 조회. : login 정보로 조회하기
		String login = (String)request.getSession().getAttribute("login");
		Member dbMem = dto.selectOne(login);
		String msg = "비번이틀려요";
		String url = "updateForm?id="+mem.getId();
		if(mem.getPass().equals(dbMem.getPass())) {
			if(dto.update(mem)) { //정상적으로 업데이트성공
				msg = "수정완료";
				url = "info?id="+mem.getId();
			}
			else {
				msg="수정실패";
			}
		}
		//비밀번호오류 시
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("deleteForm")
	@MSLogin("loginIdCheck")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if(id.equals("admin")) {
			request.setAttribute("msg","관리자는 탈퇴할 수 없습니다.");
			request.setAttribute("url","info?id="+id);
			return "alert";
		}
		return "member/deleteForm";
	}

	/* 	delete
	 *  1. 2개의 파라미터 정보를 조회하여 변수 저장
   2. 로그인 정보를 검증
      - 로그아웃 상태 : 로그인하세요. loginForm.jsp로 페이지 이동
      - 본인만 탈퇴가능(관리자는 제외) : 본인만 탈퇴 가능합니다. main.jsp로 페이지 이동
      - 관리자가 탈퇴는 불가 ("admin"은 탈퇴 불가) : 관리자는 탈퇴 불가합니다. list.jsp로 페이지 이동
   3. 비밀번호 검증
      - 로그인 정보로 비밀번호 검증. 
      - 비밀번호 불일치 : 비밀번호 오류 메시지 출력. deleteForm.jsp로 페이지 이동
   4. db에서 id에 해당하는 회원정보 삭제하기
      boolean MemberDao.delete(id)
      탈퇴 성공 
          - 일반 사용자 : 로그 아웃 실행. 탈퇴 메시지 출력, loginForm.jsp로 페이지 이동
          - 관리자 : 탈퇴메시지 출력, list.jsp로 페이지 이동
      탈퇴 실패
          - 일반 사용자 : 탈퇴실패메시지 출력, main.jsp로 페이지 이동
          - 관리자 : 탈퇴실패메시지 출력, list.jsp로 페이지 이동
	 */

	@RequestMapping("delete")
	@MSLogin("loginIdCheck")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = (String)request.getSession().getAttribute("login");
		if(id.equals("admin")) {
			request.setAttribute("msg","관리자는 탈퇴할 수 없습니다.");
			request.setAttribute("url","info?id="+id);
			return "alert";
		}
		Member dbMem = dto.selectOne(login);
		String msg = "비밀번호오류";
		String url = "deleteForm?id="+id;

		if(pass.equalsIgnoreCase(dbMem.getPass())) {
			if(dto.delete(id)) {
				if(login.equals("admin")) {
					msg = "탈퇴성공";
					url = "list";
				}
				else {//관리자가 아닌경우
					request.getSession().invalidate();
					msg = "(탈퇴성공) 로그아웃합니다";
					url = "main";
				}
			}
			
			else {
				msg = "탈퇴실패";
			}
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return "alert";
	}
	

	@RequestMapping("list")
	@MSLogin("loginAdminCheck")
	public String  list(HttpServletRequest request, HttpServletResponse response) {
		//관리자로 로그인시에만 실행
		List<Member> list = dto.list(); //DB값들을 list형식으로 가져옴
		request.setAttribute("list", list); //list속성에저장
		return "member/list"; // forward방식으로 member/list 로 리턴(이동)
	}
	
	
	public String loginAdminCheck(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String login  = (String)session.getAttribute("login");
		if(login==null) {
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		else if(!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 접근가능합니다");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null; //정상인경우
	}
	
	@RequestMapping("id")
	public String id(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String name = request.getParameter("name");
		//name="name"인 파라미터를 가져와
		//charEncodingFilter를 만들어놨으므로 인코딩이필요없음
		String tel = request.getParameter("tel");
		String id = dto.idSearch(name, tel);
		//MemberDto에 가서 DB정보와비교해 가져온다
		if(id==null) {
			request.setAttribute("msg", "id를 찾을수없어요");
			request.setAttribute("id", id);
			return "idSearch";
		}
		else {
		request.setAttribute("msg", name+"님의 id : "+id);
		request.setAttribute("id", id);
		return "idSearch";
		}
	}
	
	@RequestMapping("pw")
	public String pw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		//name="name"인 파라미터를 가져와
		//charEncodingFilter를 만들어놨으므로 인코딩이필요없음
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass = dto.pwSearch(id, tel, email);
		//MemberDto에 가서 DB정보와비교해 가져온다
		if(pass==null) {
			request.setAttribute("msg", "password를 찾을수없어요");
			request.setAttribute("pass", pass);
			return "pwSearch";
		}
		else {
		request.setAttribute("msg", id+"님의 password : "+pass);
		request.setAttribute("pass", pass);
		return "pwSearch";
		}
	}
	

	
	
	
}