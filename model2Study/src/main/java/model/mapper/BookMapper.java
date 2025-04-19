package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.book.Book;

public interface BookMapper {

	@Insert("insert into book(writer,title,content,dt)"
			+ " values(#{writer},#{title},#{content},#{dt})")
	int insert(Book book);

	@Select("select * from book order by dt desc limit #{pageNum},#{limit} ")
	//page번 행부터 limit개만 select (0행부터시작함)
	List<Book> list(Map<String, Object> map);

	@Select("select count(*) from book")
	int bookCount();

}
