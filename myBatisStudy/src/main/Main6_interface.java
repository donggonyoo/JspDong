package main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MybatisSet;
import mapper.StudentMapper2;

public class Main6_interface {
	private final static Class<StudentMapper2> cls = StudentMapper2.class;
	private static Map<String,Object>map = new HashMap<>();
	
	public static void main(String[] args) {
		SqlSession session = MybatisSet.getSession();
		System.out.println("모든학생정보조회하기");
		List<Student> list = session.getMapper(cls).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1학년학생의정보");
		map.put("grade", 1);
		list = session.getMapper(cls).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("키가175이상인 학생정보조회");
		map.clear();
		map.put("height", 175);
		list = session.getMapper(cls).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("몸무게가 60 이하인 학생의정보");
		map.clear();
		map.put("weight", 60);
		list = session.getMapper(cls).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		
//----------------------select2 메서드를 이용할거임-------------------------------------
		System.out.println("@");
		System.out.println("select2 이용!!!!!!!");
		System.out.println("@");
		
		System.out.println("1학년학생의정보");
		map.put("grade", 1);
		list = session.getMapper(cls).select2(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("키가175이상인 학생정보조회");
		map.clear();
		map.put("height", 175);
		list = session.getMapper(cls).select2(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1학년학생중 키가175이상인 학생의정보조회하기");
		map.clear();
		map.put("grade", 1);
		map.put("height", 175);
		list = session.getMapper(cls).select2(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		
	}

}
