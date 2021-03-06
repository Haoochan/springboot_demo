package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ActivityCategoryMapper;
import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Service.ActivityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityCategoryServiceImpl implements ActivityCategoryService {

    @Autowired
    private ActivityCategoryMapper activityCategoryMapper;

    @Override
    public List<ActivityCategory> getAllActivityCategory(int before,int after) {

        return this.activityCategoryMapper.getAllActivityCategory(before,after);
    }

    @Override
    public List<ActivityCategory> getActivityCategory() {
        return this.activityCategoryMapper.getActivityCategory();
    }

    @Override
    public ActivityCategory getActivityCategoryById(int id) {

        return this.activityCategoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public int getTotalCount() {
        return this.activityCategoryMapper.getTotalCount();
    }

    @Override
    public int add(ActivityCategory activityCategory) {
        return this.activityCategoryMapper.insert(activityCategory);
    }

    @Override
    public int delete(int id) {
        return this.activityCategoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(ActivityCategory activityCategory) {
        return this.activityCategoryMapper.updateByPrimaryKey(activityCategory);
    }
}
