package com.springboot.demo.Dao;

import com.springboot.demo.Entity.Major;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MajorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Major record);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);

    //根据collegeId获取Major名
    @Select("select id,name from major where collegeId=#{id}")
    List<Major> getMajor(int id);
}