package main;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader= null;
		try {
			//reader : 입력스트림(파일읽어오기)
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			//reader를 읽어 mybatis 환경설정
			//sqlMap : sql구문들을 저장 (id속성값으로 sql구문저장)
			sqlMap = new SqlSessionFactoryBuilder().build(reader);			
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		int x= 0;
		//session : Connection객체를 mybatis에서 연결한객체
		SqlSession session = sqlMap.openSession();
		//selectOne(sql구문의id값) : 결과레코드가 1건인경우
		x = (Integer)session.selectOne("member.count");
		System.out.println("member테이블의 레코드갯수 : "+x);
		System.out.println("member테이블의 전체레코드조회 ===");
		List<Member>list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		System.out.println("member테이블의 admin레코드조회");
		Member admin = session.selectOne("member.selectId","admin");
		//session.selectxxx("namespace.id","value")
		System.out.println(admin);
		
		System.out.println("테이블에서 이름에 '이'를 가진 레코드조회===");
		list = session.selectList("member.selectName","%이%");
		for (Member m : list) {
			System.out.println(m);
		}
		
		System.out.println("테이블에서 이름에 '이'를 가진 레코드조회2===");
		list = session.selectList("member.selectName2","이");
		for (Member m : list) {
			System.out.println(m);
		}
		
		System.out.println("member테이블에서 이름에'이'를 가진 남자정보조회");
		HashMap<String,Object> map = new HashMap<>();
		map.put("name", "이");
		map.put("gender", "1");
		//("member.selectNameGender","이",1)의형태로는 들어갈수없음
		list = session.selectList("member.selectNameGender",map);
		for (Member m : list) {
			System.out.println(m);
		}
		
		
	}
}
