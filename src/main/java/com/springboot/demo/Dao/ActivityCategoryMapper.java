package com.springboot.demo.Dao;

import com.springboot.demo.Entity.ActivityCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityCategory record);

    int insertSelective(ActivityCategory record);

    ActivityCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityCategory record);

    int updateByPrimaryKey(ActivityCategory record);

    List<ActivityCategory> getAllActivityCategory(@Param("before") int before, @Param("after") int after);

    int getTotalCount();
}