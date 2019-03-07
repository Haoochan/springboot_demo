package com.springboot.demo.Service;


import com.springboot.demo.Entity.Major;

import java.util.List;
import java.util.Map;

public interface MajorService {

    List<Major> getMajor(int collegeId);

    int getTotalCount(Map<String, String> map);

    List<Major> getAllMajor(Map<String,String> map);

    void add(Major major);

    Major getMajorById(int id);

    void delete(int deleteId);

    void update(Major major);
}
