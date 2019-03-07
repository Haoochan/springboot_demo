package com.springboot.demo.Service;

import com.springboot.demo.Entity.UserClassCollegeMap;

public interface UserClassCollegeMapService {
    void add(UserClassCollegeMap userClassCollegeMap);

    void editFirstClass(UserClassCollegeMap userClassCollegeMap);

    void editSecondClass(UserClassCollegeMap userClassCollegeMap2);

    int getCountByUserId(int userId);

    void deleteSecondClass(int userId);

    void deleteAllByUserId(int userId);

    int getCollegeIdByUserId(int userId);
}
