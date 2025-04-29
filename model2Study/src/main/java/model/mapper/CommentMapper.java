package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.comment.Comment;

public interface CommentMapper {

	
	@Select("select IFNULL(MAX(seq),0) from comment where num=#{num}")
	public int maxseq(int num);

	@Insert("insert into comment(num,content,writer,seq,regdate)"
			+ " values(#{num},#{content},"
			+ " #{writer},#{seq},now())")
	public boolean insert(Comment comm);

	
	@Select("select * from comment where num=#{num}")
	 List<Comment> list(int num);

	@Delete("delete from comment where num=#{num} and seq=#{seq}")
	public boolean delete(Map<String, Object> map);

}
