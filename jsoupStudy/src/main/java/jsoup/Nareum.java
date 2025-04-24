package jsoup;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Nareum {
	public static List<String> nareum() {
		String url = "https://nareum.co.kr/product/list.html?cate_no=28";
		Document doc = null;
		ArrayList<String> list = new ArrayList<>();
		try {
			doc = Jsoup.connect(url).get();
			Elements div= doc.select("img");
			for (Element im : div) {
				if(im!=null ) {
					String src = im.absUrl("src");
					System.out.println(src);
					if(!src.contains("wish") && !src.contains("cate_no")) {
						list.add(src);
					}
				}
			}
			return list;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}


