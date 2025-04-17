package model.mapper;

import java.util.List;
import java.util.Map;

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

	@Select("select count(*) from board where boardid=#{val}")
	int boardCount(String boardid);

	
	@Select("select * from board where boardid=#{boardid}"
			+ " order by grp desc , grpstep asc limit #{start},#{limit}")
	//grp==num  을 내림차순으로함 (최신이 가장 위에뜨게)
	//start번에서부터   limit개 조회해
	List<Board> list(Map<String, Object> map);

	@Select("select * from board where num=#{num}")
	Board numSearch(String num);

	@Update("update board set readcnt=#{readcnt} where num=#{num}")
	int UpdateCnt(Map<String, Object> map);

}
