package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;

public class MemberDto {

	public boolean insert(Member mem) {
		Connection conn= DBConnection.getConnection(); //DB와 연결하기위한 객체
		PreparedStatement pstmt = null;//SQL을 DB에전달하기위한 객체
		String sql = "insert into member(id,pass,name,gender,tel,email,picture)"
		+" values(?,?,?,?,?,?,?)"; //모든속성값을 넣는것이기때문에 굳이 속성명을 입력하지않아도됨
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1,A): sql의 첫번쨰 ?를 String형태의 A으로 설정
			pstmt.setString(1, mem.getId());//첫번쨰값을 Member의 id로한다.
			pstmt.setString(2, mem.getPass());
			pstmt.setString(3, mem.getName());
			pstmt.setInt(4, mem.getGender());//gender의 자료형int
			pstmt.setString(5, mem.getTel());
			pstmt.setString(6, mem.getEmail());
			pstmt.setString(7, mem.getPicture());
			if(pstmt.executeUpdate()>0) { 
				return true;
			}
			else return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn,pstmt,null);
		}
		return false;
	}
	
	public  Member selectOne(String id) {

		String sql = "select * from member where id=?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt =null;
		ResultSet rs = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);//?를 파라미터로받은 id로 사용한다.
			rs = psmt.executeQuery();//select문 실행
		while(rs.next()) {//id에 해당하는 레코드가있는지 검사
			Member mem = new Member();
			if(rs.getString(1).equals(id)) {
				mem.setId(rs.getString("id")); //rs.getString("컬럼명")
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));//이거만 int형임
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, psmt, rs);
		}
		return null;	//없다면 null;	
	}
	
	public List<Member> list() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setPicture(rs.getString("picture"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				list.add(m);
			}
			return list;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, psmt, rs);
		}
		return null;
	}
	
		public boolean update(Member mem) {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = null;
			String sql = "update member set name=?,gender=?,tel=?,email=?,"
					+ "picture=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem.getName());
				pstmt.setInt(2, mem.getGender());
				pstmt.setString(3, mem.getTel());
				pstmt.setString(4, mem.getEmail());
				pstmt.setString(5, mem.getPicture());
				pstmt.setString(6, mem.getId());
				return pstmt.executeUpdate() > 0;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(conn, pstmt, null);
			}
			return false;
		}
	
		
	public boolean delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		String sql = "delete from member where id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			if(psmt.executeUpdate()>0) {
				return true;
			}
			return false;	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, psmt, null);
		}
		return false;
	}


	public String idSearch(String name , String tel) {
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "select id from member where name=? and tel=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2,tel);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(con, psmt, rs);
		}
		return null;
	}

	public String pwSearch(String id,String tel,String email) {
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "select pass from member where id=? and tel=? and email=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, tel);
			psmt.setString(3,email);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pass");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(con, psmt, rs);
		}
		return null;
		
	}
}
