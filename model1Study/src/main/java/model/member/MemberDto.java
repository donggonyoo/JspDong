package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
