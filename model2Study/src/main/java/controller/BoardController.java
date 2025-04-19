package controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.board.Board;
import model.board.BoardDao;

@WebServlet(urlPatterns = {"/board/*"},
initParams = {@WebInitParam(name="view",value="/view/")}
		)
public class BoardController extends MskimRequestMapping {
	private BoardDao dao =  new BoardDao();



	public String noticeCheck(HttpServletRequest request , 
			HttpServletResponse response) { //관리자만 접근할수있게
		String login = (String)request.getSession().getAttribute("login");
		String boardid = (String)request.getSession().getAttribute("boardid");

		if(!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 글쓸수있어요");
			request.setAttribute("url",
					request.getContextPath()+"/board/list?boardid="+boardid);
			return "alert";
		}
		return null;	
	}

	@RequestMapping("writeForm") 
	@MSLogin("noticeCheck") 	//writeForm에 접속 시 실행됨
	public String writeForm(HttpServletRequest request , 
			HttpServletResponse response) {
		return "board/writeForm";
	}
	
	@MSLogin("noticeCheck")
	@RequestMapping("write")
	public String write(HttpServletRequest request , 
			HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/")+"/upload/board/";
		//C:/java/workspace/.metadata/
		// .plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/model2Study/upload/board/
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		int size = 10*10*1024;//10M(업로드파일의 최대크기)
		MultipartRequest multi = null;
		try {
			//form을 enctype=multipart/form-data로 전달 시
			//request를 사용할수없음!!!MultipartRequest을 이용해받아서사용하자
			multi = new MultipartRequest(request, path,size,"UTF-8");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		Board board = new Board();
		board.setWriter(multi.getParameter("writer"));
		board.setPass(multi.getParameter("pass"));
		board.setTitle(multi.getParameter("title"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1")); //업로드된 파일명
		//list에서 boardid를 세션으로등록함.
		String boardid = (String)request.getSession().getAttribute("boardid");
		if(boardid==null) {
			boardid="1"; // 공지사항 기본게시판으로설정
		}
		board.setBoardid(boardid);//게시판종류 1:공지사항 , 2:자유게시판

		if(board.getFile1()==null) {//file을 등록하지않았다면 빈값이 들어감
			board.setFile1("");
		}
		int num = dao.maxnum();//가장큰 키값(num)을 가져옴
		board.setNum(++num); // 게시글 키값(게시글번호)
		board.setGrp(num); // 그룹번호
	
		if(dao.insert(board)) {
			return "redirect:list?boardid="+boardid;
		}
		request.setAttribute("msg", "게시물등록실패");
		request.setAttribute("url",  "writeForm");
		return "alert";
	}

	/*
	 * 1.한 페이지당 10건의 게시물을 출력하기. 
	 * pageNum이라는 파라미터값 => 없는경우는 1로설정
	 * boardid파라미터값 => 있는경우 session에등록
	 * 2.최근등록된 게시물이 가장 위쪽
	 * 3.db에서 해당페이지에 출력될 내용만 조회해 화면에출력
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request , 
			HttpServletResponse response) {
		//pageNum파라미터가존재하면 파라미터값을 pageNum변수에 저장
		//pageNum 파라미터가없으면 파라미터값을 pageNum변수는 1로저장
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));

		} catch (NumberFormatException e) {}
		
		//boardid파라미터값 
		String boardid = request.getParameter("boardid");
		if(boardid==null || boardid.trim().equals("")) {
			boardid = "1";//boardid파라미터가 없는경우 '1'로설정
		}
		//board값을 session에 등록
		request.getSession().setAttribute("boardid", boardid);



		int limit = 10;//페이지당 출력되는 게시물의건수
		int boardcount = dao.boardCount(boardid);//현재등록된 게시물건수
		//pageNum에 해당하는 게시물목록을 최대10개 조회
		List<Board> list = dao.list(boardid,pageNum,limit);
		int maxpage = (int)((double)boardcount/limit + 0.95);
		/*
		 * maxpage : 필요한페이지 갯수 
		 * 	게시물건수    maxpage
		 *    10        10.0/10 +0.95 = (int)1.95 => 1
		 *    11        11.0/10 + 0.95  = (int)2.05 => 2
		 *    500       500.0/10 + 0.95 = (int)50.95 => 50
		 */
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 +1;
		/*
		 * startpage : 화면에출력되는 시작페이지
		 * 	현재페이지(pageNum)   startpage  endPage
		 *     1                   1        10
		 *     12                  11       20
		 *     43                  41       50 
		 */
		int endpage = startpage+ 9;//한화면에는 10개의 페이지번호만보임
		if(endpage>maxpage) { //maxpage보다 크다면 endpage는 maxpage로 바뀐다
			endpage = maxpage;
		}
		//ex) 11개의 게시물밖에없는데 10개의페이지가 필요할까? 2개의페이지(maxpage)만있으면된다!
		String boardName = "공지사항";

		if(boardid.equals("2")) {
			boardName = "자유게시판";
		}
		int num = boardcount - (pageNum-1)*limit; 

		/*
		 * num : 목록번호(boardid별로 다름)
		 * 	boardid=1 이 13개의 게시글을 가지고있고 1페이지인경우
		 *  13- 0*10 = 13    
		 *  2페이지인경우
		 *  13 - 10 =  3 
		 */

		request.setAttribute("boardName", boardName); //게시판이름
		request.setAttribute("boardcount", boardcount);//게시판종류별 등록된게시물
		request.setAttribute("boardid", boardid); //게시판코드
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);//현재페이지
		request.setAttribute("list", list);//현재페이지에출력한 게시물목록
		request.setAttribute("startpage", startpage);//페이지시작번호
		request.setAttribute("endpage", endpage);//페이지마지막번호
		request.setAttribute("today", new Date()); //오늘날짜
		request.setAttribute("maxpage", maxpage);//페이지의 갯수
		return "board/list";

	}

	/*
	 * 1.num파라미터저장
	 * 2.num의 게시물을 DB에서조회해야함(num은 기본키임)
	 * 3.게시물의 조회수를 하나올려야함(readcnt)
	 * 4.조회된게시물 화면에 전달
	 */
	@RequestMapping("info")
	public String info(HttpServletRequest request , 
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));	
		Board board = dao.numSearch(num);

		if(board != null) {
			String boardid = board.getBoardid();
			String boardName = "공지사항";
			if(boardid.equals("2")) {
				boardName ="자유게시판";
			}
			if(dao.UpdateCnt(board.getReadcnt()+1,num)>0) {	
				request.setAttribute("b", board);
				request.setAttribute("boardName", boardName);
				return "board/info";
			}
			else {
				return "redirect:board/list?boardid="+boardid;
			}
		}else {
			return "redirect:board/list";
		}

	}
	@MSLogin("noticeCheck")
	@RequestMapping("replyForm")
	public String replyForm(HttpServletRequest request , 
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.numSearch(num);
		request.setAttribute("b", b);
		return "board/replyForm";
	}

	/*
	 * 1.파라미터값을 Board객체에저장
	 * 원글정보 : num,grp,grplevel,grpstep,boardid
	 * 답글정보 : writer , pass, title , content 
	 * 2.같은 grp에 속하는 게시물들의 grpstep값을 1 증가시키기
	 * 	BoardDao.grpStepAdd(grp,grpstep)
	 * 3.Board에 저장된 답글 정보를 DB에 추가하기
	 * num: maxnum +1 
	 * grp : 원글과동일
	 * grplevel : 원글의 grplevel +1 
	 * grpstep : 월글의 grpstep+1
	 * 
	 * 4.추가성공 : list로 페이지이동
	 *  추가실패 : replyForm페이지이동
	 */
	@MSLogin("noticeCheck")
	@RequestMapping("reply")
	public String reply(HttpServletRequest request , 
			HttpServletResponse response) {
		
		//원글 정보
		int num = Integer.parseInt(request.getParameter("num"));
		int grp = Integer.parseInt(request.getParameter("grp"));
		int grpstep = Integer.parseInt(request.getParameter("grpstep"));
		int grplevel = Integer.parseInt(request.getParameter("grplevel"));
		String boardid = request.getParameter("boardid");

		//답글정보
		Board b = new Board();
		b.setGrp(grp);
		b.setBoardid(boardid); //원글과 grp, boardid는 동일함
		
		b.setWriter(request.getParameter("writer"));
		b.setPass(request.getParameter("pass"));
		b.setTitle(request.getParameter("title"));
		b.setContent(request.getParameter("content"));

		//2. 같은 grp에속하는 게시물들의 grpstep(답글의순서 라고보면될듯)값 1증가시키기
		dao.grpStepAdd(grp,grpstep);

		//3.Board에 저장된 답글정보를 db에추가하기
		b.setNum(dao.maxnum()+1);
		b.setGrplevel(grplevel+1);
		b.setGrpstep(grpstep+1);
		if(dao.insert(b)) {
			return "redirect:list?boardid="+boardid;
		}
		else {
			request.setAttribute("msg", "답변등록실패");
			request.setAttribute("url", "replyForm?num="+num);
			return "alert";
		}
	}

	@MSLogin("noticeCheck")
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request , 
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.numSearch(num);
		request.setAttribute("b", b);
		return "board/updateForm";
	}

	/*
	 * 1.파라미터정보를 Board객체에저장 ->request객체사용불가능
	 * 2.비밀번호검증 : 비밀번호오류시 , 메시지출력후 updateForm페이지이동
	 * 3.게시물수정 .BoardDao.update(Board)
	 * 4.수정성공 : info페이지로이동 
	 * 	수정실패 : 수정실패메시지출력 후 updateForm으로 페이지이동
	 */
	@MSLogin("noticeCheck")
	@RequestMapping("update")
	public String update(HttpServletRequest request , 
			HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/")+"/upload/board/";
		File f = new File(path);
		int size = 10*10*1024;//10M(업로드파일의 최대크기)
		MultipartRequest multi = null;
		try {
			//enctype:multipart/form-data로 설정했으므로 일반적으로는 request파라미터를 받을수없음
			//MultipartRequest을 이용해서 받자
			multi = new MultipartRequest(request, path,size,"UTF-8");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		Board b = new Board();
		int num = Integer.parseInt(multi.getParameter("num"));
		String pass = multi.getParameter("pass");
		b.setNum(num);
		b.setFile1(multi.getFilesystemName("file1"));
		b.setWriter(multi.getParameter("writer"));
		b.setPass(pass);
		b.setTitle(multi.getParameter("title"));
		b.setContent(multi.getParameter("content"));
		b.setRegdate(new Date());

		//변경한 파일이없다면(변경한 파일만 file1에 들어감)
		if(b.getFile1()==null || b.getFile1().equals("")) {
			//이전 첨부파일(file2) 유지
			b.setFile1(multi.getParameter("file2"));
		}


		Board DBb = dao.numSearch(num);
		if(!DBb.getPass().equals(pass)) { //비밀번호오류시
			request.setAttribute("msg", "비밀번호오류");
			request.setAttribute("url", "updateForm?num="+num);
			return "alert";
		}
		if(dao.update(b)) { //수정성공
			return "redirect:info?num="+num;
		}
		else {
			request.setAttribute("msg", "수정실패");
			request.setAttribute("url", "updateForm?num="+num);
			return "alert";
		}	
	}

	/*
	 * 1,num pass파라미터를 변수에저장
	 * 2,비밀번호검증
	 * 	틀린경우 : 메시지출력 , deleteForm페이지로이동
	 * 3.답변글이 있는 원글인 경우 삭제못하게하자(시도 시 메시지출력후 list로이동)
	 * 4.게시물삭제
	 * 	boolean BoardDao.delete(num)
	 * 	삭제성공 ㅣ list로 이동
	 * 	삭제실패 : 삭제실패메시지출력 후 delteForm 페이지이동
	 */

	@MSLogin("noticeCheck")
	@RequestMapping("delete")
	public String delete(HttpServletRequest request , 
			HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		Board DbBoard = dao.numSearch(num);
		int grp = DbBoard.getGrp();
		int grplevel = DbBoard.getGrplevel()+1;


		if(!DbBoard.getPass().equals(pass)) {
			request.setAttribute("msg", "비밀번호오류");
			request.setAttribute("url", "deleteForm?num="+num);
			return "alert";
		}
		if(dao.grpSearch(grp,grplevel)>0) {
			request.setAttribute("msg", "답변글부터삭제하세요");
			request.setAttribute("url", "list?boardid="+DbBoard.getBoardid());
			return "alert";

		}
		else {
			if(dao.delete(num)) {
				request.setAttribute("msg", "성공");
				request.setAttribute("url", "list?boardid="+DbBoard.getBoardid());
				return "alert";
			}
			else {
				request.setAttribute("msg", "삭제실패");
				request.setAttribute("url", "deleteForm?num="+num);
				return "alert";

			}
		}

	}



}
