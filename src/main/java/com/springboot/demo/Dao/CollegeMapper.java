package com.springboot.demo.Dao;

import com.springboot.demo.Entity.College;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CollegeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(College record);

    int insertSelective(College record);

    College selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(College record);

    int updateByPrimaryKey(College record);

    //提供下拉框
    @Select("select id,name from college")
    List<College> getCollege();

    @Select("select count(1) from college")
    int getTotalCount();

//    @Select("select * from college limit #{before},#{pageSize}")
    @Select("select \n" +
            "co.id,\n" +
            "co.`name`,\n" +
            "co.description,\n" +
            "GROUP_CONCAT(u.id) as userId,\n" +
            "GROUP_CONCAT(u.`name`) as userName\n" +
            "from college as co\n" +
            "LEFT JOIN user_class_college_map as uccm on uccm.collegeId = co.id\n" +
            "LEFT JOIN `user` as u on u.id = uccm.userId\n" +
            "where uccm.classId is NULL\n" +
            "GROUP BY co.id\n" +
            "limit #{before},#{pageSize}")
    List<College> getAllCollege(int before, int pageSize);
}