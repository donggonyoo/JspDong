package ex03_parameter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String model = request.getParameter("model"); //name이model인 파라미터 get
		String price = request.getParameter("price");//name이price인 파라미터 get
		//response응답객체
		PrintWriter pw = response.getWriter();//브라우저로보내기위함
//		pw.print("모델명 : "+model+",가격 : "+price);
		pw.print("<html><head><title>파라미터연습</title></head><body>");
		pw.print("<table border='1'><tr><th>모델명</th><th>가격</th></tr>");
		pw.print("<tr><td>"+model+"</td><td>"+price+"</td></tr></table></body></html>");
		//위내용들이 브라우저로 전송됨(코딩할게 너무많음)
	}
}
