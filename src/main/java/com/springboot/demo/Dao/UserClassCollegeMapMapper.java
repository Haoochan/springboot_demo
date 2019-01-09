package com.springboot.demo.Dao;

import com.springboot.demo.Entity.UserClassCollegeMap;

public interface UserClassCollegeMapMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserClassCollegeMap record);

    int insertSelective(UserClassCollegeMap record);

    UserClassCollegeMap selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserClassCollegeMap record);

    int updateByPrimaryKey(UserClassCollegeMap record);
}