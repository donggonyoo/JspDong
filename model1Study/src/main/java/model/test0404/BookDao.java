package model.test0404;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;

public class BookDao {
	
	
	public static boolean insert(Book book) {	
		PreparedStatement psmt = null;
		Connection conn = DBConnection.getConnection();//DB연결
		String sql = "insert into book values(?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);//sql을 DB에
			psmt.setString(1, book.getWriter());
			psmt.setString(2, book.getTitle());
			psmt.setString(3, book.getContent());
			if(psmt.executeUpdate()>0) {
				return true; //업데이트가 진행됐으면 true
			}
			else {
				return false;  //안됐다면 false
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, psmt, null);
			//모든것을 닫아준다
		}
		return false; //예외를 위한 반환값(실행안될것임)		
	}
	
	public static List<Book> print(){
		ArrayList<Book> books = new ArrayList<Book>();
		//DB를 연결하기위한 방법
		PreparedStatement psmt = null;
		Connection conn = DBConnection.getConnection();
		String sql = "select * from book";
		try {
			psmt= conn.prepareStatement(sql);//sql을 DB에넣기
			ResultSet rs = psmt.executeQuery();//select문
			
			while(rs.next()) {
				Book book = new Book();
				book.setWriter(rs.getString(1));
				book.setTitle(rs.getString(2));
				book.setContent(rs.getString(3));
				books.add(book);
			}
			return books;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			
			DBConnection.close(conn, psmt, null);
		}
		return books;	
	}
}
