package com.springboot.demo.Dao;

import com.springboot.demo.Entity.Classes;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ClassesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Classes record);

    int insertSelective(Classes record);

    Classes selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classes record);

    int updateByPrimaryKey(Classes record);

    //给下拉框
    @Select("select id,name from class where majorId=#{id}")
    List<Classes> getClasses(int id);

    int getTotalCount(Map<String, String> map);

    List<Classes> getAllClasses(Map<String, String> map);
}