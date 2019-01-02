package com.springboot.demo.Service;

import com.springboot.demo.Entity.Classes;

import java.util.List;

public interface ClassesService {
    List<Classes> getClasses(int id);
}
