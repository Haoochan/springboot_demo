package com.springboot.demo.Dao;

import com.springboot.demo.Entity.Schoolyear;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SchoolyearMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Schoolyear record);

    int insertSelective(Schoolyear record);

    Schoolyear selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Schoolyear record);

    int updateByPrimaryKey(Schoolyear record);

    @Select("select count(1) from schoolyear")
    int getTotalCount();

    @Select("select id,schoolyear from schoolyear limit #{before},#{pageSize}")
    List<Schoolyear> getAllSchoolyear(int before,int pageSize);

    @Select("select * from schoolyear where id = #{id}")
    Schoolyear getSchoolyearById(int id);

    @Select("select * from schoolyear")
    List<Schoolyear> getSchoolyear();
}