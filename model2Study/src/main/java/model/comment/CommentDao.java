package model.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MyBatisConnection;
import model.mapper.CommentMapper;

public class CommentDao {

	private Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	
	public int maxseq(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq(num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public boolean insert(Comment comm) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.put("num", comm.getNum());
			map.put("content", comm.getContent());
			map.put("writer", comm.getWriter());
			map.put("seq", comm.getSeq());
			return session.getMapper(cls).insert(comm);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public  List<Comment> list(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public boolean delete(int num, int seq) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("seq", seq);
			return session.getMapper(cls).delete(map);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

}
