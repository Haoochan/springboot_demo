package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.MajorMapper;
import com.springboot.demo.Entity.Major;
import com.springboot.demo.Service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Major> getMajor(int id) {
        return this.majorMapper.getMajor(id);
    }
}
