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
}
