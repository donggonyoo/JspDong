package ex15_model2;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/jspStudy/hello.do 요청
//hello.do 라는 파일은 존재하지않음
// *.do => a.do .....adadakk/gg.do ..요청시 Controller 서블릿호출
@WebServlet(urlPatterns = {"*.do"},
initParams = {@WebInitParam(name="properties",value="url.properties")})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties();
	private Action action = new Action();
	private Class[] paramType = new Class[] 
			{HttpServletRequest.class,HttpServletResponse.class};


	@Override
	public void init(ServletConfig config) throws ServletException{
		//config : properties = url.properties 값이 저장
		FileInputStream f = null;
		String props = config.getInitParameter("properties");
		//props : url.properties 가 저장
		try {
			//config.getServletContext().getRealPath("/") : 웹어플리케이션폴더
			//f = WEB-INF/ url.properties 파일 읽기
			f=new FileInputStream
					(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
			pr.load(f); //  url.properties에 작성한 /hello.do=hello를 가지고있게됨 
			f.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Object[] paramObjs = new Object[] {request,response};
		ActionForward forward = null;
		String command = null;
		try { 
			// request.getRequestURI() : jspStudy/hello.do
			// request.getContextPath().length() : /jspStudy의 길이 
			//command = /hello.do
			//methodName = hello
			
			command = request.getRequestURI().substring(request.getContextPath().length());
			String methodName = pr.getProperty(command);
			//action.getClass() : Action클래스의정보를 가져옴
			//getMethod(메서드명,파라미터타입) : 클래스정보에서 method정보
			Method method = action.getClass().getMethod(methodName, paramType);
			//invoke(호출대상객체,매개변수값(인자)) : 지정된 매개변수사용해 메서드호출
			forward = (ActionForward)method.invoke(action, paramObjs);
			//forward = return new ActionForward(false,"ex15_model2/hello.jsp");
		}
		catch (NullPointerException e) {
			forward = new ActionForward();
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		if(forward!= null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}
			else {
				//forward.getView() : "ex15_model2/hello.jsp"
				//disp : 다음호출할 페이지
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
				//ex15_model2/hello.jsp페이지를 호출
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
