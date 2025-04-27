package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.board.Board;

public interface BoardMapper {

	//num이 null이라면 0을 반환해줌
	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert  into board(writer,pass,title,content,file1,regdate,"
			+ "readcnt, grp , grplevel , grpstep , boardid) "
			+ " values(#{writer},#{pass},#{title},#{content},#{file1},now(),"
			+ "0, #{grp} , #{grplevel} , #{grpstep} , #{boardid})")
	boolean insert(Board board);

	
	String sqlcol =  
			"<if test='column != null'> "
			+ "AND ("
			+ "<if test='col1 != null'> ${col1} LIKE '%${find}%'</if>"
			  +"<if test='col2 != null'> OR ${col2} LIKE '%${find}%'</if>"
			  +"<if test='col3 != null'> OR ${col3} LIKE '%${find}%'</if>"
			 + ")"
			 + "</if>";
	
	@Select({
		  "<script>",
		  "SELECT COUNT(*) FROM board",
		  "WHERE boardid = #{boardid}",
		 sqlcol,"</script>"
		})
	int boardCount(Map<String, Object> map);

	
	@Select({"<script>","select * from board where boardid=#{boardid}"+
			sqlcol+" order by grp desc , grpstep asc limit #{start},#{limit}","</script>"})
	//grp==num  을 내림차순으로함 (최신이 가장 위에뜨게)
	//start번에서부터   limit개 조회해
	List<Board> list(Map<String, Object> map);

	@Select("select * from board where num=#{num}")
	Board numSearch(int num);

	@Update("update board set readcnt=#{readcnt} where num=#{num}")
	int UpdateCnt(Map<String, Object> map);

	//같은 grp에서 grpstep이 자신보다큰 레코드는 grpstep +1
	//답글은 grpstep의 오름차순으로 정렬이된다
	//참고로 넘어오는 grpstep은 무조건0(원본)이 될거임
	@Update("update board set grpstep = grpstep+1 where grp=#{grp} and grpstep > #{grpstep}")
	void grpStepAdd(Map<String, Object> map);

	@Update("update board set file1=#{file1},writer=#{writer},title=#{title},"
			+ " content=#{content} , regdate=#{regdate} where num=${num}")
	boolean update(Board b);

	@Select("SELECT ifnull(COUNT(*),0)"
			+ " FROM board"
			+ " where grplevel=#{grplevel} AND grp=#{grp}")
	int grpSearch(Map<String, Object> map);

	@Delete("delete from board where num=#{val}")
	int delete(int num);

	@Select("select writer , count(*) cnt  from board"
			+ " group by writer order by cnt desc"
			+ " limit 0,5") //limit 0,5 : 0번째행부터 5개
	//Map<컬럼명,컬럼값> 형태를 List에 순서대로넣음
		// ex : {"writer":"길동" , "cnt":4}
		//		{"writer":"길순" , "cnt":2}
	List<Map<String, Object>> boardgraph1();

	
	@Select("select SUBSTR(regdate,1,10) as 'date' , count(*) as cnt "
			+ " from board"
			+ " group by SUBSTR(regdate,1,10)"
			+ " order by SUBSTR(regdate,1,10) asc"
			+ " limit 0,5"
			)
	List<Map<String, Object>> boardgraph2();
	
	@Select("SELECT date_format(regdate,'%Y-%m-%d') as 'date' ,count(*) cnt FROM board "
			+ "	group by date_format(regdate,'%Y-%m-%d') "
			+ "	order by 1 desc"
			+ "	limit 0,7")
	List<Map<String, Object>> graph2();
	
	
	
	

}
