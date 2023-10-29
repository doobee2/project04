package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user")
    public List<User> userList();

    @Select("select * from user where id = #{id}")
    public User userGet(String id);

}