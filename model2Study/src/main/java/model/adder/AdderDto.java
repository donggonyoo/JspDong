package model.adder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;

public class AdderDto {
	
	public List<Adder> insert(Adder adder) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmtSelectOne = null;
		PreparedStatement psmtDelete = null;
		PreparedStatement psmtInsert = null;
		PreparedStatement psmtSelectAll = null;
		ResultSet rs = null;
		List<Adder> list = new ArrayList<>();

		String sqlSelectOne = "SELECT * FROM adder WHERE fruits = ?";//입력받은 fruit를 ?에 넣을것
		String sqlDelete = "DELETE FROM adder WHERE fruits = ?";
		String sqlInsert = "INSERT INTO adder VALUES(?,?)";
		String sqlSelectAll = "SELECT * FROM adder";

		try {
			// 기존 과일 있는지 확인
			psmtSelectOne = conn.prepareStatement(sqlSelectOne);
			psmtSelectOne.setString(1, adder.getFruit());
			rs = psmtSelectOne.executeQuery();

			if (rs.next()) {
				// 기존 과일이면 삭제 후 수량 더해서 insert
				int existingNum = rs.getInt(2);
				psmtDelete = conn.prepareStatement(sqlDelete);
				psmtDelete.setString(1, adder.getFruit());
				psmtDelete.executeUpdate();//기존의 fruits 삭제
				psmtDelete.close();

				psmtInsert = conn.prepareStatement(sqlInsert);
				psmtInsert.setString(1, adder.getFruit());
				psmtInsert.setInt(2, adder.getNum() + existingNum);
					//전달받은 adder의 num과 기존DB의 num을 더해서새로운요소생성
				psmtInsert.executeUpdate();
				psmtInsert.close();
			} else {
				// 새로운 과일이면 바로 insert
				psmtInsert = conn.prepareStatement(sqlInsert);
				psmtInsert.setString(1, adder.getFruit());
				psmtInsert.setInt(2, adder.getNum());
				psmtInsert.executeUpdate();
				psmtInsert.close();
			}

			// 최신 리스트 가져오기
			psmtSelectAll = conn.prepareStatement(sqlSelectAll);
			rs = psmtSelectAll.executeQuery();

			while (rs.next()) {
				Adder a = new Adder();
				a.setFruit(rs.getString(1));
				a.setNum(rs.getInt(2));
				list.add(a);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmtSelectOne, rs);
			// 나머지 PreparedStatement는 명시적으로 닫았거나 null일 수 있음
		}
		return null;
	}
	
	public List<Adder> print(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<Adder> list = new ArrayList<Adder>();
		String sql = "select * from adder";
		try {
			psmt= conn.prepareStatement(sql);
			 rs = psmt.executeQuery();
			while(rs.next()) {
				Adder adder = new Adder();
				adder.setFruit(rs.getString(1));
				adder.setNum(rs.getInt(2));
				list.add(adder);
			}
			return list;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, null, rs);
		}
		return null; //오류방지
	
	}

}


