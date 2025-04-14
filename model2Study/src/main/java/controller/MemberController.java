package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

	@RequestMapping("loginForm") 
	public String loginForm(HttpServletRequest request, HttpServletResponse response ) {
		String login = (String)request.getSession().getAttribute("login");
		if(login!= null) {
			request.setAttribute("msg", "이미로그인했어요");
			request.setAttribute("url", "member/main");
			return "alert";	
		}
		else {
			return "member/loginForm";
		}
	}


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

	@RequestMapping("mailForm")
	@MSLogin("loginAdminCheck") //관리자만가능
	public String  mailForm(HttpServletRequest request, HttpServletResponse response) {
		//관리자로 로그인시에만 실행
		String[] ids = request.getParameterValues("idchk");//해당파라미터의 값들을 배열로리턴		
		List<Member> list = dto.emailList(ids);  //파라미터의값(mem.id들을 이용해 Member객체를 요소로갖는 리스트반환)
		request.setAttribute("list", list); 
		return "member/mailForm"; 
	}
	/*
	 * 구글 smtp서버 이용해 메일전송하기
	 * 1.구글계정에 접속해 2단계 로그인설정하기
	 * 2.앱비밀번호 생성 
	 * 3.생성된 앱 비번을 메모장을 이용해저장하기
	 * 4. mail.properties 파일 /web-inf/에 만들기
	 */

	@RequestMapping("mailSend")
	@MSLogin("loginAdminCheck") //관리자만가능
	public String  mailSend(HttpServletRequest request, HttpServletResponse response) {
		String sender = request.getParameter("googleid") + "@gmail.com"; //작성자의아이디에 @gmail.com을붙임
		//앱비밀번호
		String passwd = request.getParameter("googlepw");
		String recipient = request.getParameter("recipient"); //이름,이메일,이름,이메일 느낌으로넘어올거임
		String title = request.getParameter("title");
		String mtype = request.getParameter("mtype");
		String result="메일전송실패";
		String content = request.getParameter("content");
		Properties prop = new Properties();//이메일전송위한 환경설정값
		try {
			String path = request.getServletContext().getRealPath("/") //내프로젝트의절대경로
					+"WEB-INF/mail.properties"; //해당파일사용
			FileInputStream fis = new FileInputStream(path); //파일을읽어
			prop.load(fis);//fis가 참조하는 파일의내용을 Properties객체의요소로저장
			prop.put("mail.smtp.user", sender);//전송하는 사람의 이메일주소
		}
		catch (Exception e) {
			e.printStackTrace();

		}
		//메일전송을 위한 사용자인증(연결)객체 
		MyAuthenticator auth = new MyAuthenticator(sender, passwd);
		//prop : 메일전송을위한 시스템환경설정 (mail.properties)
		//auth : 인증객체
		Session mailSession = Session.getInstance(prop,auth);

		//msg : 메일로전송되는 데이터객체
		MimeMessage msg = new MimeMessage(mailSession);
		//이메일주소들을 담을수있는 리스트
		ArrayList<InternetAddress> addrs = new ArrayList<InternetAddress>();
		try {
			//recipient는 name,email,name2,email2 형식의 String임.
			String[] emails = recipient.split(",");
			for (String email : emails) { //email : 이름 or email 
				try {
					//email.getBytes("UTF-8") : byte배열
					//8859_1 : 웹의 기본인코딩방식
					addrs.add(new InternetAddress( //addrs에는 이메일형식만 들어갈거야(이름은들어가지않음)
							new String(email.getBytes("UTF-8"),"8859_1")));
				}
				catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			InternetAddress[] address =  new InternetAddress[emails.length];
			for (int i = 0; i < addrs.size(); i++) {
				address[i] = addrs.get(i);
			}
			InternetAddress from = new InternetAddress(sender);
			msg.setFrom(from); //보내는사람의 이메일주소
			msg.setRecipients(Message.RecipientType.TO, address);//수신자
			msg.setSubject(title);
			msg.setSentDate(new Date());
			msg.setText(content);
			//multipart : 내용,첨부파일1,.....
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(content,mtype); //내용
			multipart.addBodyPart(body);
			msg.setContent(multipart);
			Transport.send(msg); //메일전송
			result = "메일전송완료";
		}
		catch (MessagingException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", result);
		request.setAttribute("url", "list");
		return "alert"; 
	}

	//-------------------------------------------
	//사용자 이름과 비밀번호를 저장하고, Session 객체가 이를 활용하여 
	//안전하게 이메일 서버에 연결할 수 있도록 합니다
	public final class MyAuthenticator extends Authenticator{
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
			return new javax.mail.PasswordAuthentication(id, pw);
		}
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

	@RequestMapping("id") //아이디찾기
	public String id(HttpServletRequest request, HttpServletResponse response)
									throws UnsupportedEncodingException {
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
			request.setAttribute("msg", name+"님의 id : "+id.substring(0,id.length()-2)+"**");
			request.setAttribute("id", id);
			return "idSearch";
		}
	}

	@RequestMapping("pw") // 비번찾기
	public String pw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		//name="name"인 파라미터를 가져와
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
			request.setAttribute("msg", id+"님의 password : "+pass.substring(0,pass.length()-2)+"**");
			request.setAttribute("pass", pass);
			return "pwSearch";
		}
	}

	
	@RequestMapping("passwordForm")
	@MSLogin("passwordLoginCheck")
	public String passwordForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/passwordForm";
	}
	
	@RequestMapping("password")//비밀번호변경부분
	@MSLogin("passwordLoginCheck")
	public String password(HttpServletRequest request, HttpServletResponse response) {
		String login = (String)request.getSession().getAttribute("login");
		String pass = request.getParameter("pass");//입력비번
		String chgpass = request.getParameter("chgpass");//변경비번
		Member mem = dto.selectOne(login); 
		//select * from member where id='login값'
		
		//입력한비밀번호와 DB상의비번이 같다면
		if(pass.equals(mem.getPass())) {
			if(dto.updatePass(login, chgpass)) {
				request.setAttribute("msg", "성공(새로운비번으로 로그인_");
				request.setAttribute("url", "logout");
				return "openerAlert";
			}
			else { // 비밀번호는 맞지만 DB내에서문제 생길 시 
				StringBuilder sb =new StringBuilder();
				sb.append("alert('비밀번호수정시오류가발생했습니다.')");
				request.setAttribute("script", sb.toString());
				return "dumy";
			}
		}else { //비밀번호를 틀렸을 시
			request.setAttribute("msg", "비밀번호가틀려요");
			request.setAttribute("url", "passwordForm");
			return "alert";
		}
		
		
	}


	public String passwordLoginCheck(HttpServletRequest request, HttpServletResponse response) {
		String login = (String)request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")){
			request.setAttribute("msg", "로그인하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		return null;

	}
	
	@RequestMapping("picture")
	public String picture(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("")+"/picture/";
		//C:\java\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\model2Study\picture
		String fname = null;
		File f = new File(path);//업로드되는 폴더정보
		if(!f.exists()){
			f.mkdirs(); //없으면 폴더생성
		}
		//request : 이미지데이터저장
		//path : 업로드되는 폴더정보
		//10*1024*1024 : 최대업로드크기(10M)
		//new DefaultFileRenamePolicy() : 중복파일명존재시 이름변경해

		MultipartRequest multi = new MultipartRequest(
					request,path,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		fname = multi.getFilesystemName("picture");
		request.setAttribute("fname", fname);
		return "pic";
	}


}