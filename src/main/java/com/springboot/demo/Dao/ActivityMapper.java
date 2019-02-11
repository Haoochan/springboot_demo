package com.springboot.demo.Dao;

import com.springboot.demo.Entity.Activity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);

    int getTotalCount(Map<String,String> map);

    List<Activity> getAllActivity(Map<String,String> map);

    Activity getActivityById(int id);

    int getTotalCountByUserId(Map<String, String> map);

    List<Activity> getAllActivityByUserId(Map<String, String> map);

//    @Select("SELECT\n" +
//            "count(1)\n" +
//            "from activity as a \n" +
//            "LEFT JOIN user as u on a.createby_id=u.id\n" +
//            "WHERE u.id=#{userId}")
    Integer getActivityCountByUser(Map<String, String> map);
}