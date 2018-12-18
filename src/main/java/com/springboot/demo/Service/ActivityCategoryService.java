package com.springboot.demo.Service;

import com.springboot.demo.Entity.ActivityCategory;

import java.util.List;

public interface ActivityCategoryService {

    List<ActivityCategory> getAllActivityCategory();

    int getTotalCount();

}
