package com.springboot.demo.Service;

import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;

import java.util.List;
import java.util.Map;

public interface ActivityService {
    int getTotalCount(Map<String,String> map);

//    int getTotalCount();

//    List<Activity> getAllActivity(int before, int pageSize,Map<String,String> map);
    List<Activity> getAllActivity(Map<String,String> map);

    Activity getActivityById(int id);

    void update(Activity activity);

    void add(Activity activity);

    void delete(int deleteId);

    int getTotalCountByUserId(Map<String, String> map);

    List<Activity> getAllActivityByUserId(Map<String, String> map);

    //图片上传
    int saveImage(ActivityImage activityImage);

    //查找图片
    List<ActivityImage> getImageByActivityId(int activityId);

    //删除图片
    void imageDelete(int imageId);

    ActivityImage getImageById(int imageId);
}
