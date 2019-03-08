package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.SchoolyearMapper;
import com.springboot.demo.Entity.Schoolyear;
import com.springboot.demo.Service.SchoolyearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolyearServiceImpl implements SchoolyearService {
    @Autowired
    SchoolyearMapper schoolyearMapper;

    @Override
    public int getTotalCount() {
        return this.schoolyearMapper.getTotalCount();
    }

    @Override
    public List<Schoolyear> getAllSchoolyear(int before, int pageSize) {
        return this.schoolyearMapper.getAllSchoolyear(before,pageSize);
    }

    @Override
    public void add(Schoolyear schoolyear) {
        this.schoolyearMapper.insert(schoolyear);
    }

    @Override
    public void delete(int deleteId) {
        this.schoolyearMapper.deleteByPrimaryKey(deleteId);
    }

    @Override
    public Schoolyear getSchoolyearById(int id) {
        return this.schoolyearMapper.getSchoolyearById(id);
    }

    @Override
    public void update(Schoolyear schoolyear) {
        this.schoolyearMapper.updateByPrimaryKey(schoolyear);
    }

    @Override
    public List<Schoolyear> getSchoolyear() {
        return this.schoolyearMapper.getSchoolyear();
    }
}
