package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = {"/ajax/*"},
initParams = { @WebInitParam(name = "view", value = "/view/") })

public class AjaxController extends MskimRequestMapping {
	
	private static Map<String, Map<String, Set<String>>> locationMap = new HashMap<>();

	@RequestMapping("select")
	public String select(HttpServletRequest request , 
			HttpServletResponse response) {

		String si = request.getParameter("si");
		String gu = request.getParameter("gu");
		
		BufferedReader fr = null;
		String path = request.getServletContext().getRealPath("/")+ "file/sido.txt";
		try {
			fr = new BufferedReader(new FileReader(path));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Set<String> set = new LinkedHashSet<>(); //순서가있는 set
		String data = null;
		try {
			while((data=fr.readLine()) != null) {
				String[] arr = data.split("\\s+"); //공백기준으로나눔
				if(arr.length >= 3) { //무조건 시구동 정보(3개)가 있어야만 함 
					if(si==null ) {
						//아무것도 선택받지않은상태
							set.add(arr[0].trim()); //제일 앞에 있는정보만(시,도) set에넣음
					}
					else if(si!=null && gu==null && si.equals(arr[0])) {
						//si(시)를 입력받은 상태 구(gu)는 입력X ( 시에 해당하는 동만 set에넣을거임)
						set.add(arr[1].trim()); //제일 앞에 있는정보만(시,도) set에넣음
					}
					else if(si!=null && gu!=null && si.equals(arr[0]) && gu.equals(arr[1])) {
						//시,구를 입력받은 상태 (해당시,구에 해당하는 동리를 set에넣을거임)
						set.add(arr[2].trim());
					}	
				}
			}
			fr.close(); //이제fr은사용하지않으므로 닫아준다
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", new ArrayList<String>(set));
		request.setAttribute("len",set.size());
		return "ajax/select";
	}
}
