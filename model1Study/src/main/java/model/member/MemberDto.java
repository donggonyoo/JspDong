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
	
	public Member update(Member mem) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmtSel = null;
		PreparedStatement psmtIns= null;
		ResultSet rs = null;
		Member m1 = new Member();
		String sSql = "select * from member where id=?";
		String uSql = "update member set name=?,gender=?"
				+ " ,tel=?,email=?,picture=? where id=?";
		try {
			
			psmtIns = conn.prepareStatement(uSql);
			psmtIns.setString(1,mem.getName());
			psmtIns.setInt(2,mem.getGender());
			psmtIns.setString(3,mem.getTel());
			psmtIns.setString(4,mem.getEmail());
			psmtIns.setString(5,mem.getPicture());
			psmtIns.setString(6,mem.getId());
			psmtIns.executeUpdate();//where문의 id이름
			psmtIns.close();//psmt를 다사용했다면 닫아두자
			
			psmtSel = conn.prepareStatement(sSql);
			psmtSel.setString(1, mem.getId());
			rs = psmtSel.executeQuery(); //select문실행
			 while(rs.next()) {
				 m1.setId(rs.getString(1));
				 m1.setPass(rs.getString(2));
				 m1.setName(rs.getString(3));
				 m1.setGender(rs.getInt(4));
				 m1.setTel(rs.getString(5));
				 m1.setEmail(rs.getString(6));
				 m1.setPicture(rs.getString(7));
			 }
			 return m1;
	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, psmtSel, rs);
		}
		return null;
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
}
