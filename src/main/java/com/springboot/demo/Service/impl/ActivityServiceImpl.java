package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ActivityImageMapper;
import com.springboot.demo.Dao.ActivityMapper;
import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;
import com.springboot.demo.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityMapper activityMapper;

    @Autowired
    ActivityImageMapper activityImageMapper;

    @Override
    public int getTotalCount() {
        return this.activityMapper.getTotalCount();
    }

    @Override
    public List<Activity> getAllActivity(int before, int pageSize) {
        return this.activityMapper.getAllActivity(before,pageSize);
    }

    @Override
    public Activity getActivityById(int id) {
        return this.activityMapper.getActivityById(id);
    }

    @Override
    public void saveImage(ActivityImage activityImage) {
        this.activityImageMapper.insert(activityImage);
    }

    @Override
    public void update(Activity activity) {
        this.activityMapper.updateByPrimaryKey(activity);
    }

    @Override
    public void add(Activity activity) {
        this.activityMapper.insert(activity);
    }
}
