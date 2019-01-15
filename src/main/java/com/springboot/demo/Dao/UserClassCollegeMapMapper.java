package com.springboot.demo.Dao;

import com.springboot.demo.Entity.UserClassCollegeMap;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface UserClassCollegeMapMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserClassCollegeMap record);

    int insertSelective(UserClassCollegeMap record);

    UserClassCollegeMap selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserClassCollegeMap record);

    int updateByPrimaryKey(UserClassCollegeMap record);

    void updateFirstClass(UserClassCollegeMap userClassCollegeMap);

    void updateSecondClass(UserClassCollegeMap userClassCollegeMap2);

    @Select("select count(1) from user_class_college_map where userId=#{userId}")
    int getCountByUserId(int userId);

    @Delete("delete from user_class_college_map where id=#{id}")
    void deleteSecondClass(int id);

    @Select("select max(id) from user_class_college_map where userId=#{userId} ")
    int getSecondClassId(int userId);

    @Delete("delete from user_class_college_map where userId=#{userId}")
    void deleteByUserId(int userId);
}