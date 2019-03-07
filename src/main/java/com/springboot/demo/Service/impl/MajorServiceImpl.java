package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.MajorMapper;
import com.springboot.demo.Entity.Major;
import com.springboot.demo.Service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    //根据学院找专业
    @Override
    public List<Major> getMajor(int collegeId) {
        return this.majorMapper.getMajor(collegeId);
    }

    @Override
    public int getTotalCount(Map<String, String> map) {
        return this.majorMapper.getTotalCount(map);
    }

    @Override
    public List<Major> getAllMajor(Map<String,String> map) {
        return this.majorMapper.getAllMajor(map);
    }

    @Override
    public void add(Major major) {
        this.majorMapper.insert(major);
    }

    @Override
    public Major getMajorById(int id) {
        return this.majorMapper.selectByPrimaryKey(id);
    }

    @Override
    public void delete(int deleteId) {
        this.majorMapper.deleteByPrimaryKey(deleteId);
    }

    @Override
    public void update(Major major) {
        this.majorMapper.updateByPrimaryKey(major);
    }
}
