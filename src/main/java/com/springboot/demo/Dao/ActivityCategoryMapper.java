package com.springboot.demo.Dao;

import com.springboot.demo.Entity.ActivityCategory;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ActivityCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityCategory record);

    int insertSelective(ActivityCategory record);

    ActivityCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityCategory record);

    int updateByPrimaryKey(ActivityCategory record);

    List<ActivityCategory> getAllActivityCategory(@Param("before") int before, @Param("after") int after);

    @Select("select\n" +
            "      *\n" +
            "    from activity_category")
    List<ActivityCategory> getActivityCategory();

    int getTotalCount();

    int getCategoryCountByUser(Map<String, String> map);
}