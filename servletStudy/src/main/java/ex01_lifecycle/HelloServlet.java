package ex01_lifecycle;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */

/*
 * ==1번쨰실행결과===
 * 생성자호출
 * init 메서드호출
 * service메서드 호출
 * doGET 메서드 호출
 * ==2번쨰 실행결과 ==
 * service메서드 호출
 * doGET 메서드 호출
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 1.생성자
     *  1)가장먼저 호출됨
     *  2)한번생성된 객체는 재사용됨
     *  3) 생성자호출 후 init메서드호출
     */
    public HelloServlet() {
        super();
        System.out.println("생성자 호출");
    }
    

    /*
     * 2.init()
     * 1) 서블릿환경 설정 담당
     * 2) init() 메서드호출 후 service() 메서드호출 
     */
	@Override  //init(ServletConfig) 오버라이딩
	public void init(ServletConfig config) throws ServletException {
		//config객체 : 서블릿 환경설정값을 저장하고있는 객체
		System.out.println("init메서드호출");
	}

	
	/*
	 * 3.service()
	 * 1) 클라이언트의 요청시 호출되는 메서드
	 * 2) 클라이언트요청 처리
	 * 3)요청방식 (Get ,Post)방식에따라 doGet , doPost 메서드호출
	 * 4) service() 메서드를 구현하지않아도, doGet , doPost메서드 호출
	 */

	@Override //service(HttpServletRequest,HttpServletResponse) 오버라이딩
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * req : 요청객체(request 객체)
		 * resp : 응답객체(reponse 객체)
		 */
		System.out.println("서비스메서드호출");
		switch(req.getMethod()) {
		case "GET" -> doGet(req, resp);
		case "POST" -> doPost(req, resp);
		}
	}


	/*
	 * 4.doGet()
	 * 1)Get방식 요청 처리하는 메서드
	 * 2) Get방식 요청
	 *   (1) <a href="http://localhost:8080/servletStudy/HelloServlet">;
	 *   (2) <form action="http://localhost:8080/servletStudy/HelloServlet">;
	 *   (3) location.href= "http://localhost:8080/servletStudy/HelloServlet";
	 *   (4)open("http://localhost:8080/servletStudy/HelloServlet");
	 *   (5) $.ajax({
	 *   type :"GET", (type생략가능)
	 *   url : "http://localhost:8080/servletStudy/HelloServlet"
	 *   })
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request : 요청객체 .클라이언트로부터 전달받은 정보 저장
		// response : 응답객체 . 클라이언트에 전달할 정보 저장
		System.out.println("doGET 메서드 호출");
		//PrintWriter getWriter() : 문자형출력스트림
		// append() , write() , print() , println()
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/*
	 * 5.doPost()
	 * 1)POST 방식의요청을 처리하는 메서드
	 * 2) POST 방식의 요청 방법
	 * (1) <form method="POST" action="http://localhost:8080/servletStudy/HelloServlet">;
	 * (2) $.ajax({
	 *   type :"POST", 
	 *   url : "http://localhost:8080/servletStudy/HelloServlet"
	 *   })
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST 메서드 호출");
		doGet(request, response);
	}

}
