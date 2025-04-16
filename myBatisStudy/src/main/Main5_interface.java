package main;

import org.apache.ibatis.session.SqlSession;

import mapper.MybatisSet;
import mapper.StudentMapper;


public class Main5_interface {
	
	private final static Class<StudentMapper> cls = StudentMapper.class;
	
	public static void main(String[] args) {
		SqlSession session = MybatisSet.getSession();
		System.out.println("이몽룡학생추가");
		Student st = new Student();
		st.setStudno(1002);
		st.setName("이몽룡");
		st.setJumin("9710011345111");
		st.setId("leemy97");
		int cnt = session.getMapper(cls).insert(st);
		System.out.println("변경된 레코드수 : "+cnt);
		
		Student dbst= session.getMapper(cls).selectName("이몽룡").get(0);
		System.out.println(dbst);
		
		System.out.println("이몽룡학생의 학년1 , 몸무개80 키175수정");
		st.setGrade(1);
		st.setWeight(80);
		st.setHeight(175);
		int update = session.getMapper(cls).update(st);
		System.out.println("업데이트한 레코드 수 : "+update);
		
		dbst= session.getMapper(cls).selectName("이몽룡").get(0);
		System.out.println(dbst);
		
		System.out.println("이몽룡학생정보 삭제하기");
		cnt = session.getMapper(cls).deleteName(st.getName());
		
		System.out.println(session.getMapper(cls).selectName("이몽룡"));
	}
}
