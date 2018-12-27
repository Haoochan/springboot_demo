package com.springboot.demo.Dao;

import com.springboot.demo.Entity.ActivityImage;

public interface ActivityImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityImage record);

    int insertSelective(ActivityImage record);

    ActivityImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityImage record);

    int updateByPrimaryKey(ActivityImage record);
}