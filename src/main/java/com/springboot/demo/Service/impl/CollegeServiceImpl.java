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

    @Override
    public int getTotalCount() {
        return this.collegeMapper.getTotalCount();
    }

    @Override
    public List<College> getAllCollege(int before, int pageSize) {
        return this.collegeMapper.getAllCollege(before,pageSize);
    }

    @Override
    public void add(College college) {
        this.collegeMapper.insert(college);
    }

    @Override
    public College getCollegeById(int id) {
        return this.collegeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(College college) {
        this.collegeMapper.updateByPrimaryKey(college);
    }

    @Override
    public void delete(int deleteId) {
        this.collegeMapper.deleteByPrimaryKey(deleteId);
    }
}
