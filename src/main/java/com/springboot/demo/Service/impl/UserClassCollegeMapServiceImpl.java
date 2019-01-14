package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.UserClassCollegeMapMapper;
import com.springboot.demo.Entity.UserClassCollegeMap;
import com.springboot.demo.Service.UserClassCollegeMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserClassCollegeMapServiceImpl implements UserClassCollegeMapService {

    @Autowired
    private UserClassCollegeMapMapper userClassCollegeMapMapper;

    @Override
    public void add(UserClassCollegeMap userClassCollegeMap) {
        userClassCollegeMapMapper.insert(userClassCollegeMap);
    }

    @Override
    public void editFirstClass(UserClassCollegeMap userClassCollegeMap) {
        userClassCollegeMapMapper.updateFirstClass(userClassCollegeMap);
    }

    @Override
    public void editSecondClass(UserClassCollegeMap userClassCollegeMap2) {
        userClassCollegeMapMapper.updateSecondClass(userClassCollegeMap2);
    }

    @Override
    public int getCountByUserId(int userId) {
        return userClassCollegeMapMapper.getCountByUserId(userId);
    }

    @Override
    public void deleteSecondClass(int userId) {
        int id = userClassCollegeMapMapper.getSecondClassId(userId);
         userClassCollegeMapMapper.deleteSecondClass(id);
    }
}
