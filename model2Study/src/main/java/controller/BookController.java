package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.book.Book;
import model.book.BookDao;

@WebServlet(urlPatterns = {"/book/*"},
//view파일을 찾을 떄  /view/에서 찾는다
initParams = {@WebInitParam(name="view",value="/view/")}
		)
public class BookController extends MskimRequestMapping {
	BookDao dao = new BookDao();
	
	@RequestMapping("bookwrite")
	public String write(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date dt = new Date();//작성한 날짜시간
		
		Book book = new Book();
		book.setWriter(writer);
		book.setTitle(title);
		book.setContent(content);
		book.setDt(dt);
		if(dao.insert(book)) {
			request.setAttribute("msg", "성공");
			request.setAttribute("url", "bookList");
			return "alert";
			
		}
		else {
			request.setAttribute("msg", "실패");
			request.setAttribute("url", "writeForm");
			return "alert";
		}
	}
	
	@RequestMapping("bookList")
	public String bookList(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));

		} catch (NumberFormatException e) {}
		int limit = 10;
		int boardcount = dao.bookCount();//현재등록된 게시물건수
		//pageNum에 해당하는 게시물목록을 최대10개 조회
		List<Book> list = dao.list(pageNum,limit);
		int maxpage = (int)((double)boardcount/limit + 0.95);
		//11개 존재 시 -> 11/10 + 0.95 : 2.1 (2페이지필요함)
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 +1;
		//현재페이지가 1이라면 1페이지부터시작
		int endpage = startpage+9; 
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		int num = boardcount - (pageNum-1)*limit;
		//13 - 0  = 13 (1페이지)
		//13 - 10 = 3 (2페이지)
		
		request.setAttribute("boardcount", boardcount);//게시판종류별 등록된게시물
		request.setAttribute("pageNum", pageNum);//현재페이지
		request.setAttribute("list", list);//현재페이지에출력한 게시물목록
		request.setAttribute("startpage", startpage);//페이지시작번호
		request.setAttribute("num", num);
		request.setAttribute("endpage", endpage);//페이지마지막번호
		request.setAttribute("maxpage", maxpage);//페이지의 갯수
		return "book/bookList";
		
		
	}
	
}
