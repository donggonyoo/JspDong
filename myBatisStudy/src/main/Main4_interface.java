package main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MybatisSet;
import mapper.StudentMapper;

public class Main4_interface {
/*	private final static SqlSessionFactory sqlMap;
	
	static { //static변수 초기화
		InputStream input = null;
		try {
			//해당파일을 읽어 myBatis환경을 설정
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");		
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		//
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	} */ 
	
	//cls : Mapper의 클래스정보
	private final static Class<StudentMapper> cls = StudentMapper.class;
	public static void main(String[] args) {
		SqlSession session = MybatisSet.getSession();
		System.out.println("모든 학생 정보 조회(인터페이스이용");
		List<Student> list = session.getMapper(cls).select();
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("@ 1학년학생정보조회 @ ");
		list = session.getMapper(cls).selectGrade(1);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("@240111학생조회하기@");
		Student st = session.getMapper(cls).selectStudno(240111);
		System.out.println(st);
		
		
		System.out.println("@인터페이스형태를 xml형식으로호출해보기");
		st=session.selectOne("mapper.StudentMapper.selectStudno",240111);
		System.out.println(st);
		
		System.out.println("@진영훈 학생의 학번과이름 조회해보기");
		list = session.getMapper(cls).selectName("진영훈");
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("@1학년학생중 키가180이상인 학생정보조회");
		Map<String, Object> map = new HashMap<>();
		map.put("grade", 1);
		map.put("height", 180);
		list = session.getMapper(cls).selectGradeHeight(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		list = session.getMapper(cls).selectGradeHeight2(1,180);
		for (Student s : list) {
			System.out.println(s);
		}
		
	}
}
