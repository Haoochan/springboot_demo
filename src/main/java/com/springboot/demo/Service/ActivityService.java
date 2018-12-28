package com.springboot.demo.Service;

import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;

import java.util.List;

public interface ActivityService {
    int getTotalCount();

    List<Activity> getAllActivity(int before, int pageSize);

    Activity getActivityById(int id);

    void saveImage(ActivityImage activityImage);

    void update(Activity activity);

    void add(Activity activity);
}
