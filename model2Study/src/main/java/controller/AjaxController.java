package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.board.BoardDao;

@WebServlet(urlPatterns = {"/ajax/*"},
initParams = { @WebInitParam(name = "view", value = "/view/") })

public class AjaxController extends MskimRequestMapping {
	
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
				if(arr.length >= 3) { //무조건 시,구,동 정보(3개)가 있어야만 함 
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
						StringBuilder sb = new StringBuilder();
						sb.append(arr[2].trim());
						if(arr.length>3) {
							sb.append(" ");
							sb.append(arr[3].trim()); 
						}
						String dongg = sb.toString();
						
						set.add(dongg);
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
	
	/*@RequestMapping("graph1") 구식방법
	public String graph1(HttpServletRequest request , 
			HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String,Object>> list = dao.boardgraph1();
		StringBuilder sb = new StringBuilder("[");
		int i=0;
		for(Map<String,Object> m : list) {
			for(Map.Entry<String, Object> me : m.entrySet()) {
				if(me.getKey().equals("cnt")) {
					sb.append("{\"cnt\":"+me.getValue()+",");
				}
				if(me.getKey().equals("writer")) {
					sb.append("\"writer\":\""+me.getValue()+"\"}");
				}
				//하나의 map을 처리				
			}//2번for문종료
			i++;
			if(i<list.size()) {
				sb.append(",");
			} //각 map사이에 , 를 찍어줌
			
		}//1번for문 종료
		
		sb.append("]");//[{"cnt":xx,"writer":xx},{"cnt":x2,"writer":x2}]의형태
		request.setAttribute("json", sb.toString().trim());
		return "ajax/graph";
		
	}*/
	
	@RequestMapping("graph1")
	public String graph1(HttpServletRequest request , 
			HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String,Object>> list = dao.boardgraph1();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String json = objectMapper.writeValueAsString(list);
			request.setAttribute("json", json);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "ajax/graph";
		
	}
	
	/*@RequestMapping("graph2") //구식의방법
	public String graph2(HttpServletRequest request , 
			HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		List<Map<String,Object>> list = dao.boardgraph2();
		StringBuilder sb = new StringBuilder("[");
		int i=0;
		for(Map<String,Object> m : list) {
			for(Map.Entry<String, Object> me : m.entrySet()) {
				if(me.getKey().equals("date")) {
					sb.append("{\"date\":\""+me.getValue()+"\",");
				}
				
				if(me.getKey().equals("cnt")) {
					sb.append("\"cnt\":"+me.getValue()+"}");
				}
				
				
				//하나의 map을 처리
				
			}//2번for문종료
			i++;
			if(i<list.size()) {
				sb.append(",");
			} //각 map사이에 , 를 찍어줌
			
		}//1번for문 종료
		
		sb.append("]");//[{"cnt":xx,"writer":xx},{"cnt":x2,"writer":x2}]의형태
		request.setAttribute("json", sb.toString().trim());
		return "ajax/graph";
		 
	}*/
	
	@RequestMapping("graph2")
	public String graph3(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao dao = new BoardDao();
		List<Map<String, Object>> list = dao.boardgraph2();
		 ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			/* 날짜 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            objectMapper.setDateFormat(dateFormat);*/
        		   
			// List<Map<String, Object>>를 JSON 문자열로 변환
            String jsonStr = objectMapper.writeValueAsString(list);
            // 변환된 JSON 문자열 출력
            System.out.println(jsonStr);
            request.setAttribute("json", jsonStr);
		} catch (IOException e) {
            e.printStackTrace();
        }
		
		return"ajax/graph";
	}

}
