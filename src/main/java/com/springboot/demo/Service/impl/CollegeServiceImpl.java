package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.CollegeMapper;
import com.springboot.demo.Entity.College;
import com.springboot.demo.Service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeMapper collegeMapper;

    @Override
    public List<College> getCollege() {
        return this.collegeMapper.getCollege();
    }
}
