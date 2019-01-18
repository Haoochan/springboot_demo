package com.springboot.demo.Dao;

import com.springboot.demo.Entity.NoticeCategory;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface NoticeCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NoticeCategory record);

    int insertSelective(NoticeCategory record);

    NoticeCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NoticeCategory record);

    int updateByPrimaryKey(NoticeCategory record);


    @Select("select count(1) from notice_category")
    int getTotalCount();

    @Select("select * from notice_category limit #{before},#{pageSize}")
    List<NoticeCategory> getAllNoticeCategory(@Param("before")int before, @Param("pageSize")int pageSize);

    @Select("select id,name from notice_category")
    List<NoticeCategory> getNoticeCategory();
}