package com.springboot.demo.Service;

import com.springboot.demo.Entity.ActivityCategory;

import java.util.List;

public interface ActivityCategoryService {

    List<ActivityCategory> getAllActivityCategory(int before,int after);

    ActivityCategory getActivityCategoryById(int id);

    int getTotalCount();

    int add(ActivityCategory activityCategory);

    int delete(int id);

    int update(ActivityCategory activityCategory);
}
