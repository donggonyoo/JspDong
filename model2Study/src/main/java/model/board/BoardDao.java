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


	public int boardCount(String boardid, String column, String find) {
		
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardid", boardid);
			map.put("column", column);
			map.put("find", find);
			if(column!=null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2].trim());
				case 2 : map.put("col2", cols[1].trim());
				case 1 : map.put("col1", cols[0].trim());
				}//3개가있다면 3개 다 집어넣어야함( break문 안씀)
			}
			return session.getMapper(cls).boardCount(map);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


	
	public List<Board> list(String boardid, int pageNum, int limit, String column, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		map.clear();
		map.put("boardid", boardid);
		map.put("start", (pageNum-1) * limit);
		map.put("limit", limit);
		map.put("column", column);
		map.put("find", find);
		if(column!=null) {
			String[] cols = column.split(",");
			switch(cols.length) {
			case 3 : map.put("col3", cols[2].trim());
			case 2 : map.put("col2", cols[1].trim());
			case 1 : map.put("col1", cols[0].trim());
			}//3개가있다면 3개 다 집어넣어야함( break문 안씀)
		}
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


	public Board numSearch(int num) {
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


	public int readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).readcntAdd(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


	public void grpStepAdd(int grp,int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("grp", grp);
			map.put("grpstep", grpstep);
			session.getMapper(cls).grpStepAdd(map);

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		
	}


	public boolean update(Board b) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(b);

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
	}


	public int grpSearch(int grp , int grplevel) {
		SqlSession session = MyBatisConnection.getConnection();
		map.clear();
		map.put("grp", grp);
		map.put("grplevel", grplevel);
		try {
			return session.getMapper(cls).grpSearch(map);

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


	public boolean delete(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(num)>0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return false;
		
	}


	public List<Map<String, Object>> boardgraph1() {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Object>> list = null;
		try {
			list = session.getMapper(cls).boardgraph1();
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}


	public List<Map<String, Object>> boardgraph2() {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Object>> list = null;
		try {
			list = session.getMapper(cls).graph2();
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	
	
}
