package com.springboot.demo.Dao;

import com.springboot.demo.Entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByUsernameAndPassword(String username, String password, String role);

    List<User> getUser(Map<String, String> map);

    int getTotalCount(Map<String, String> map);

    List<User> getAllUser(Map<String, String> map);
}