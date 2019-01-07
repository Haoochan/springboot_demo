package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ClassesMapper;
import com.springboot.demo.Entity.Classes;
import com.springboot.demo.Service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;


    @Override
    public List<Classes> getClasses(int id) {
        return this.classesMapper.getClasses(id);
    }

    @Override
    public int getTotalCount(Map<String, String> map) {
        return this.classesMapper.getTotalCount(map);
    }

    @Override
    public List<Classes> getAllClasses(Map<String, String> map) {
        return this.classesMapper.getAllClasses(map);
    }

    @Override
    public void add(Classes classes) {
        this.classesMapper.insert(classes);
    }

    @Override
    public Classes getClassesById(int id) {
        return this.classesMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Classes classes) {
        this.classesMapper.updateByPrimaryKey(classes);
    }

    @Override
    public void delete(int deleteId) {
        this.classesMapper.deleteByPrimaryKey(deleteId);
    }
}
