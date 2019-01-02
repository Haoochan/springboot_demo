package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ClassesMapper;
import com.springboot.demo.Entity.Classes;
import com.springboot.demo.Service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;


    @Override
    public List<Classes> getClasses(int id) {
        return this.classesMapper.getClasses(id);
    }
}
