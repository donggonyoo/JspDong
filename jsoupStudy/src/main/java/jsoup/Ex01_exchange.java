package jsoup;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex01_exchange {
	public static String Ex01() {
		String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
		String line = "";
		Document doc = null;
		
		try{
			doc = Jsoup.connect(url).get(); //url접속후 DOM트리 취상위문서
			Elements el = doc.select("table");//doc하위태그중 table태그선택
			for(Element ele  : el){ 
				//ele : table태그 1개
				String temp = ele.html();
				System.out.println(temp);
				line += temp;
				return line;
			}
		}
		catch(IOException e){
			e.printStackTrace();
		}
		return null;
	}

}
