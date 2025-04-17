package controller;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.board.Board;
import model.board.BoardDao;

@WebServlet(urlPatterns = {"/board/*"},
	initParams = {@WebInitParam(name="view",value="/view/")}
		)
public class BoardController extends MskimRequestMapping {
	private BoardDao dao =  new BoardDao();

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
		String boardid = (String)request.getSession().getAttribute("boardid");
		if(boardid==null) {
			boardid="1"; // 공지사항 기본게시판으로설정
		}
		board.setBoardid(boardid);//게시판종류 1:공지사항 , 2:자유게시판
		
		if(board.getFile1()==null) {
			board.setFile1("");
		}
		int num = dao.maxnum();//가장큰 키값을 가져옴
		board.setNum(++num); // 게시글 키값(게시글번호)
		board.setGrp(num); // 그룹번호
		String msg="게시물등록실패";
		String url = "writeForm";
		if(dao.insert(board)) {
			return "redirect:list?boardid="+boardid;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
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
		String num = request.getParameter("num");
		
		Board board = dao.numSearch(num);
		if(board != null) {
			if(dao.UpdateCnt(board.getReadcnt()+1,num)>0) {
				request.setAttribute("b", board);
				return "board/info";
			}
			else {
				return "redirect:board/list";
			}
		}else {
			return "redirect:board/list";
		}

	}
	
	
	
}
