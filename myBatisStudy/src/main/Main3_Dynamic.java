package main;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MybatisSet;

public class Main3_Dynamic {
	/*
	private  static SqlSessionFactory sqlMap;
	
	//한 번만 초기화되는 전역 SqlSessionFactory를 만들기 위한 구조
	//MyBatis 설정 파일을 읽고 파싱하는 작업을 중앙집중화해서 중복 제거 및 관리 용이성 확보
	public final static  SqlSession getSession() {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");		
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
		return sqlMap.openSession();
	}
	 이걸로 밑에 getSession()메서드를 만든거임*/

	public static void main(String[] args) {
		SqlSession session = MybatisSet.getSession(); 
		
		System.out.println("학생전체레코드조회");
		List<Student> list = session.selectList("student2.select1");
		for (Student s : list) {
			System.out.println(s);
		}
		System.out.println("--- 1학년학생레코드조회하기 ---");
		Map<String, Object> map = new HashMap<>();
		map.put("grade",1);
		//똑같은 select1쿼리사용(where태그와 if태그이용)
		list = session.selectList("student2.select1",map);
		for (Student s : list) {
			System.out.println(s);
		}
		System.out.println("학생 중 학번이 220111인 레코드조회");
		map.clear(); // 모든요소제거
		map.put("studno", 220111);
		Student st = session.selectOne("student2.select1",map);
		System.out.println(st);
		
		System.out.println("학생 중 키가 180이상인 학생의정보조회");
		map.clear();
		map.put("height", 180);
		list = session.selectList("student2.select1",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		/*System.out.println("학생 중 키가 180이상인 1학년 학생의정보조회");
		map.clear();
		map.put("height", 180);
		map.put("grade", 1);
		list = session.selectList("student2.select1",map);
		for (Student s : list) {
			System.out.println(s);
		}*/
//------------------------------------------------------------------------------		
		System.out.println("@@@@");
		System.out.println("---------student2.select2로 조회하기----");
		System.out.println("@@@@");
		System.out.println("학생 중 키가 180이상인 1학년 학생의정보조회");
		map.clear();
		map.put("height", 180);
		map.put("grade", 1);
		list = session.selectList("student2.select2",map);
		for (Student s : list) {
			System.out.println(s);
		}
//------------------------------------------------------------------------------------------------------------------		
		System.out.println("@@@@");
		System.out.println("-----------student2.select3로 조회하기------");
		System.out.println("@@@@");
		System.out.println("학생 중 학번이 220111인 레코드조회");
		map.clear(); // 모든요소제거
		map.put("studno", 220111);
		st = session.selectOne("student2.select3",map);
		System.out.println(st);
		
		
		
		System.out.println("전체학생정보조회");
		list = session.selectList("student2.select3");
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1학년학생정보조회");
		map.clear();
		map.put("grade", 1);
		list = session.selectList("student2.select3",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("키가180이상인학생의정보");
		System.out.println("학생 중 키가 180이상인 학생의정보조회");
		map.clear();
		map.put("height", 180);
		list = session.selectList("student2.select3",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("학생 중 키가 180이상인 1학년 학생의정보조회");
		map.clear();
		map.put("height", 180);
		map.put("grade", 1);
		list = session.selectList("student2.select3",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1학년학생중 키가180이상이고 학번이240111인학생");
		map.clear();
		map.put("height", 180);
		map.put("studno",240111);
		map.put("grade", 1);
		list = session.selectList("student2.select3",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("@@@@");
		System.out.println("-----------student2.select4로 조회하기------");
		System.out.println("@@@@");
		System.out.println("101,201,301학과에 속한 학생의정보조회");
		List<Integer> mlist = Arrays.asList(101,201,301);
		map.clear();
		map.put("column", "major1");
		map.put("datas", mlist);
		list = session.selectList("student2.select4",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("몸무게가75 80인 학생정보조회");
		mlist = Arrays.asList(75,80);
		map.clear();
		map.put("column", "weight");
		map.put("datas", mlist);
		list = session.selectList("student2.select4",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("키가170 175 180 185학생정보조회");
		mlist = Arrays.asList(170 ,175 ,180, 185);
		map.clear();
		map.put("column", "height");
		map.put("datas", mlist);
		list = session.selectList("student2.select4",map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		
		
	}
}
