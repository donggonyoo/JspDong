package model.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MyBatisConnection;
import model.mapper.BoardMapper;

public class BoardDao {

	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	
	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


	public boolean insert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			if(session.getMapper(cls).insert(board)) {
				return true;
			}
			return false;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}


	public int boardCount(String boardid) {
		
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).boardCount(boardid);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


	
	public List<Board> list(String boardid, int pageNum, int limit) {
		SqlSession session = MyBatisConnection.getConnection();
		map.clear();
		map.put("boardid", boardid);
		map.put("start", (pageNum-1) * limit);
		map.put("limit", limit);
		try {
			return session.getMapper(cls).list(map);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}


	public Board numSearch(String num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).numSearch(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	
	}


	public int UpdateCnt(int readcnt, String num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("readcnt", readcnt);
			return session.getMapper(cls).UpdateCnt(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	
	
}
