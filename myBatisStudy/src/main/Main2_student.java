package main;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2_student {
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
		//Connection객체를 이용해 mybatis와 DB를 연결
		SqlSession session = sqlMap.openSession();
		System.out.println("학생테이블에 레코드추가하기");
		//DB의 Student테이블컬럼과같은 프로퍼티를가진클래스
		Student st = new Student();
		st.setStudno(1002);
		st.setName("김삿갓2");
		st.setGrade(1);
		st.setId("sakgak2");
		st.setJumin("0003443355111");
		st.setMajor1(101);
		//insert(namespace.id값 , 파라미터값)
		// 파라미터이용해 DB에 새로운레코드추가(추가된레코드 건수 리턴)
		int cnt=session.insert("student.insert",st);
		System.out.println("student레코드 추가 : "+cnt);
		
		Student stResult = session.selectOne("student.selectNo",st.getStudno());
		System.out.println("추가한 레코드 조회 ===: ");
		System.out.println(stResult);
		//1002번의 학생의 학년을 2학년, 몸무게:80 , 키:170 지도교수:1001 으로수정
		
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(170);
		st.setProfno(1001);
		int update = session.update("student.update",st);
		System.out.println("update!!"+update);
		
		stResult = session.selectOne("student.selectNo",st.getStudno());
		System.out.println("변경한 레코드조회 == ");
		System.out.println(stResult);	
		
		//1002번 학생을 삭제하자
		int delete = session.delete("student.delete",1002);
		System.out.println("삭제된 건수 : "+delete);
		
		stResult = session.selectOne("student.selectNo",st.getStudno());
		System.out.println("삭제 레코드조회 : "+stResult);
		
		
//		session.commit(); 실제 DB에 Commit
		
	}

}
