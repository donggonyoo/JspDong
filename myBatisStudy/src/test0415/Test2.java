package test0415;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import main.Professor;
import mapper.MybatisSet;

/*
 * ProfessorMapper.xml 파일을 이용하기
 * Professor.java 파일 이용하기
1. 교수테이블에 등록된 레코드의 건수를 출력하기.
2. 교수테이블에 등록된 모든 정보를 출력하기
3. 교수중 101번 학과의 교수 정보를 출력하기
4. 교수중 성이 김씨인 시간강사 정보를 출력하기 
*/
public class Test2 {
	public static void main(String[] args) {
	
		SqlSession session = MybatisSet.getSession();
		Professor pf = new Professor();
		List<Professor> pfList = new ArrayList<>();
		//1. 교수테이블에 등록된 레코드의 건수를 출력하기.
		 int cnt = session.selectOne("professor.selectCount");
		 System.out.println("professor테이블 레코드 건수 : "+cnt);
		 
		 //2. 교수테이블에 등록된 모든 정보를 출력하기
		 pfList = session.selectList("professor.selectAll");
		 System.out.println("==== professor테이블 모든 정보 === ");
		 for (Professor p : pfList) {
			 System.out.println(p);	
		}
		 
		 //3. 교수중 101번 학과의 교수 정보를 출력하기
		 pfList= session.selectList("professor.select101",101);
		 System.out.println("==== 101번 학과 교수 === ");
		 for (Professor p : pfList) {
			 System.out.println(p);	
		}
		 
		 //4. 교수중 성이 김씨인 시간강사 정보를 출력하기 
		 Map<Object, String> map = new HashMap<>();
		 map.put("name", "김");
		 map.put("position", "시간강사");
		 pfList = session.selectList("professor.selectTimeKim",map);
		 System.out.println("---------김씨 시간강사-----");
		 for (Professor p : pfList) {
			 System.out.println(p);	
		}
	}
	
}
