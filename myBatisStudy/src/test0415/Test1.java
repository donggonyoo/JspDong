package test0415;
/*
 * StudentMapper1.xml 파일을 이용하기
 * 1. 학생테이블의 등록된 레코드의 건수를 출력하기
 * 2. 학생테이블의 등록된 레코드의 정보를 출력하기
 * 3. 학생테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기
 * 4. 학생테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
 * 5. 학생테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기
 */

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import main.Student;

public class Test1 {
	private final static SqlSessionFactory sqlMap;
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
	}
	
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		Student st = new Student();
		//1. 학생테이블의 등록된 레코드의 건수를 출력하기(countAll)
		 int cnt = (Integer)session.selectOne("student.countAll");
		 System.out.println("---studentTable 전체레코드 수 : "+cnt);
		 
		 //2. 학생테이블의 등록된 레코드의 정보를 출력하기(selectAll)
		 List<Student> list = session.selectList("student.selectAll");
		 System.out.println("--- student레코드의 모든정보----");
		 for(Student s : list) {
			 System.out.println(s);
		 }
		 
		 //3. 학생테이블의 등록된 레코드의 1학년 학생의 정보를 출력하기
		 list = session.selectList("student.selectGrade1",1);
		 System.out.println("----1학년 학생의 정보----");
		 for(Student s : list) {
			 System.out.println(s);
		 }
		 
		 //4학생테이블의 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
		 list = session.selectList("student.selectNameKim","김");
		 System.out.println("-------- 김씨 정보 --------");
		 for(Student s : list) {
			 System.out.println(s);
		 }
		 
		 //5. 학생테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보를 출력하기
		 HashMap<Object,String> map = new HashMap<>();
		 map.put("grade", "3");
		 map.put("jumin1", "2"); //여자의주민번호7자리는 2 or 4임
		 map.put("jumin2", "4");
		 list = session.selectList("student.selectjumin",map);
		 System.out.println("-------- 3학년여자 --------");
		 for(Student s : list) {
			 System.out.println(s);
		 }
		 
		 
		 
		 
		 
		 
		 
		 
	}

}
