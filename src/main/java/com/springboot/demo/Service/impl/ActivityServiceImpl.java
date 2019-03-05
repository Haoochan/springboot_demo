package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ActivityImageMapper;
import com.springboot.demo.Dao.ActivityMapper;
import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;
import com.springboot.demo.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityMapper activityMapper;

    @Autowired
    ActivityImageMapper activityImageMapper;


    @Override
    public int getTotalCount(Map<String,String> map) {
        return this.activityMapper.getTotalCount(map);
    }

    @Override
    public List<Activity> getAllActivity(Map<String,String> map) {
        return this.activityMapper.getAllActivity(map);
    }

    @Override
    public Activity getActivityById(int id) {
        return this.activityMapper.getActivityById(id);
    }

    @Override
    public void update(Activity activity) {
        this.activityMapper.updateByPrimaryKey(activity);
    }

    @Override
    public void add(Activity activity) {
        this.activityMapper.insert(activity);
    }

    @Override
    public void delete(int deleteId) {
        this.activityMapper.deleteByPrimaryKey(deleteId);
    }

    @Override
    public int getTotalCountByUserId(Map<String, String> map) {
        return this.activityMapper.getTotalCountByUserId(map);
    }

    @Override
    public List<Activity> getAllActivityByUserId(Map<String, String> map) {
        return this.activityMapper.getAllActivityByUserId(map);
    }

    //保存图片
    @Override
    public int saveImage(ActivityImage activityImage) {
        activityImage.setDate(new Date());
        int activityId = this.activityMapper.getLastActivityId()+1;
        activityImage.setActivityId(activityId);
        this.activityImageMapper.insert(activityImage);
        String path = activityImage.getPath();
        return this.activityImageMapper.getImageByPath(path);
    }

    //查找图片
    @Override
    public List<ActivityImage> getImageByActivityId(int activityId) {
        return activityImageMapper.getImageByActivityId(activityId);
    }

    @Override
    public void imageDelete(int imageId) {
        this.activityImageMapper.deleteByPrimaryKey(imageId);
    }

    @Override
    public ActivityImage getImageById(int imageId) {
        return this.activityImageMapper.selectByPrimaryKey(imageId);
    }


}
