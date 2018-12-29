package com.springboot.demo.Dao;

import com.springboot.demo.Entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByUsernameAndPassword(String username, String password, String role);

    @Select("SELECT id,role,name FROM user")
    List<User> getUser();
}