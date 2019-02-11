package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ActivityCategoryMapper;
import com.springboot.demo.Dao.ActivityMapper;
import com.springboot.demo.Dao.UserMapper;
import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Entity.Report;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    ActivityCategoryMapper activityCategoryMapper;

    @Autowired
    ActivityMapper activityMapper;

    @Override
    public int getUserTotalCount(Map<String, String> map) {
        return userMapper.getTotalCount(map);
    }

    @Override
    public List<Report> getActivityCount(Map<String, String> map) {
        List<Report> reportList = new ArrayList<>();
        int userTotalCount = this.getUserTotalCount(map);
        int categoryCount = this.activityCategoryMapper.getTotalCount();
        List<User> userList= this.userMapper.getAllUser(map);//根据学院,id,角色查用户
        List<ActivityCategory> activityCategoryList = this.activityCategoryMapper.getActivityCategory();
        for(int i=0;i<userTotalCount;i++){
            Report report = new Report();
            User user = userList.get(i);
            report.setUsername(user.getName());
            report.setUserId(user.getId());
            List<Integer> categoryCountList = new ArrayList<>();
            for (int j=0;j<categoryCount;j++){
                ActivityCategory activityCategory = activityCategoryList.get(j);
                //根据学年 学期查工作类别
                map.put("categoryId", String.valueOf(activityCategory.getId()));
                map.put("userId", String.valueOf(user.getId()));
//                categoryCountList.add(this.activityCategoryMapper.getCategoryCountByUser(activityCategory.getId(),user.getId()));
                categoryCountList.add(this.activityCategoryMapper.getCategoryCountByUser(map));
            }
//            report.setCategoryCountList(categoryCountList);
            report.setCategoryCountA(categoryCountList.get(0));
            report.setCategoryCountB(categoryCountList.get(1));
            report.setCategoryCountC(categoryCountList.get(2));
            report.setCategoryCountD(categoryCountList.get(3));
            report.setCategoryCountE(categoryCountList.get(4));
            report.setTotalCountByUser(this.activityMapper.getActivityCountByUser(map));
            reportList.add(report);
        }
        return reportList;
    }
}
