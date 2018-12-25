package com.springboot.demo.Dao;

import com.springboot.demo.Entity.Activity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);

    @Select("SELECT count(1) FROM activity")
    int getTotalCount();

    List<Activity> getAllActivity(@Param("before") int before, @Param("after") int after);
}