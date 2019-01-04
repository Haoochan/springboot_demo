package com.springboot.demo.Service;

import com.springboot.demo.Entity.College;

import java.util.List;

public interface CollegeService {
    List<College> getCollege();

    int getTotalCount();

    List<College> getAllCollege(int before, int pageSize);

    void add(College college);

    College getCollegeById(int id);

    void update(College college);

    void delete(int deleteId);
}
