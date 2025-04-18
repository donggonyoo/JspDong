package model.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MyBatisConnection;
import model.mapper.BookMapper;

public class BookDao {

	private Class<BookMapper> cls = BookMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public boolean insert(Book book) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			return session.getMapper(cls).insert(book)>0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	
	public List<Book> list(int pageNum, int limit) {
SqlSession session = MyBatisConnection.getConnection();
		
		try {
			map.clear();
			map.put("pageNum", (pageNum-1)*limit);
			map.put("limit", limit);
			return session.getMapper(cls).list(map);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}


	public int bookCount() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).bookCount();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
		
}
