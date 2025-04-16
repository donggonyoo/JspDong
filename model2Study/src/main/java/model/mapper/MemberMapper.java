package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.member.Member;

public interface MemberMapper {

	@Insert("insert into member(id,pass,name,gender,tel,email,picture)"
			+" values (#{id},#{pass},#{name},#{gender},#{tel},#{email},#{picture})")
	int insert(Member mem); //괄호조심

	@Select("select * from member where id=#{val}")
	Member selectOne(String id);

	@Select("select * from member")
	List<Member> selectList();

	@Update("update member set name=#{name},gender=#{gender},"
			+ " tel=#{tel},email=#{email},picture=#{picture} where id=#{id}")
	int update(Member mem);

	@Delete("delete from member where id=#{id}")
	int delete(String id);

	@Select("select id from member where name=#{name} and tel=#{tel}")
	//map의 key값을 #{}안에 넣는거임
	String idSearch(Map<String, Object> map);

	
	@Select("select pass from member where id=#{id} and tel=#{tel} and email=#{email}")
	//map의 key값을 #{}안에 넣는거임
	String pwSearch(Map<String, Object> map);

	@Update("update member set pass#{pass} where id=#{id}")
	int updatePass(Map<String, Object> map);

	
	
	@Select({"<script>",
			"select * from member where id in",
			" <foreach collection='datas' item='d' separator=',' open='(' close=')'>",
			"#{d}",
			"</foreach>",
			"</script>"
			//select * from member where id in('aa','bb','cc')
	})
	List<Member> emailList(Map<String, Object> map);
}
