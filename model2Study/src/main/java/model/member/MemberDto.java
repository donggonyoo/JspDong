package model.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MyBatisConnection;
import model.mapper.MemberMapper;

public class MemberDto {
	private final static Class<MemberMapper> cls = MemberMapper.class;
	private static Map<String,Object>map = new HashMap<>();
	public boolean insert(Member mem) {
		
		SqlSession conn = MyBatisConnection.getConnection(); //DB와 연결하기위한 객체
		
		try {
			if(conn.getMapper(cls).insert(mem)>0) {
				return true;
			}
			else return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(conn);
			//DB에 commit후 DB를 닫는 메서드(finally를 이용해서 항상 해준다)
		}
		return false;
	}
	
	public  Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;	//없다면 null;	
	}
	
	
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectList();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	
		public boolean update(Member mem) {
			SqlSession session = MyBatisConnection.getConnection();
			try {
				if(session.getMapper(cls).update(mem)>0) {
					return true;
				}
				else return false;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return false;
		}
	
		
	public boolean delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "delete from member where id=?";
		try {
			if(session.getMapper(cls).delete(id)>0) {
				return true;
			}
			else return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}


	public String idSearch(String name , String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select id from member where name=? and tel=?";
		map.clear();
		map.put("name",name);
		map.put("tel",tel);
		try {
			return session.getMapper(cls).idSearch(map);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public String pwSearch(String id,String tel,String email) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select pass from member where id=? and tel=? and email=?";
		map.clear();
		map.put("id", id);
		map.put("tel", tel);
		map.put("email", email);
		try {
			return session.getMapper(cls).pwSearch(map);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public boolean updatePass(String id , String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "update member set pass=? where id=?";
		map.clear();
		map.put("id", id);
		map.put("pass", pass);
		try {
			if(session.getMapper(cls).updatePass(map)>0) {
				return true;
			}
			else return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Member> emailList(String[] ids) {
		SqlSession session = MyBatisConnection.getConnection();
		ArrayList<Member> list = new ArrayList<Member>();
		StringBuilder sb = new StringBuilder();
		map.clear();
		map.put("datas", ids);
		try {
			return session.getMapper(cls).emailList(map);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	

}
