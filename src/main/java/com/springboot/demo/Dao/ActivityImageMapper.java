package com.springboot.demo.Dao;

import com.springboot.demo.Entity.ActivityImage;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ActivityImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityImage record);

    int insertSelective(ActivityImage record);

    ActivityImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityImage record);

    int updateByPrimaryKey(ActivityImage record);

    //查找图片
    @Select("select * from activity_image where activityId=#{activityId}")
    List<ActivityImage> getImageByActivityId(int activityId);

    //根据路径查找图片id 用于删除
    @Select("select id from activity_image where path=#{path}")
    int getImageByPath(String path);
}