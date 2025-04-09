package ex13.el;

import java.util.Arrays;
import java.util.List;

/*
 JspDong\jspStudy\src\main\java\ex13\el\Compute.java
 */
public class Compute {
	public static int add(String x, String y) { 
		//add메서드
		   try {
			   int a = Integer.parseInt(x);
			   int b = Integer.parseInt(y);
			   return a + b;
		   } catch (Exception e) {}
		   return 0;
	   }
	   public static boolean contains(String[] arr,String str) {
		   try {
			   List<String> list = Arrays.asList(arr);
			   return list.contains(str);
		   } catch (Exception e) {e.printStackTrace();}
		   return false;
	   }

}
