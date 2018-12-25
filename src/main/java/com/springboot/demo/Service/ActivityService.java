package com.springboot.demo.Service;

import com.springboot.demo.Entity.Activity;

import java.util.List;

public interface ActivityService {
    int getTotalCount();

    List<Activity> getAllActivity(int before, int pageSize);
}
