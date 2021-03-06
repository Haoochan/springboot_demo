package com.springboot.demo.Service;

import com.springboot.demo.Entity.ActivityCategory;

import java.util.List;

public interface ActivityCategoryService {

    //显示列表
    List<ActivityCategory> getAllActivityCategory(int before,int after);
    //显示到下拉框
    List<ActivityCategory> getActivityCategory();

    ActivityCategory getActivityCategoryById(int id);

    int getTotalCount();

    int add(ActivityCategory activityCategory);

    int delete(int id);

    int update(ActivityCategory activityCategory);
}
