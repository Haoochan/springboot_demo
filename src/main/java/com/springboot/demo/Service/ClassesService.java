package com.springboot.demo.Service;

import com.springboot.demo.Entity.Classes;

import java.util.List;
import java.util.Map;

public interface ClassesService {
    List<Classes> getClasses(int id);

    int getTotalCount(Map<String, String> map);

    List<Classes> getAllClasses(Map<String, String> map);

    void add(Classes classes);

    Classes getClassesById(int id);

    void update(Classes classes);

    void delete(int deleteId);
}
