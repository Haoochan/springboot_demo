package com.springboot.demo.Service;

import com.springboot.demo.Entity.Schoolyear;

import java.util.List;

public interface SchoolyearService {
    int getTotalCount();

    List<Schoolyear> getAllSchoolyear(int before, int pageSize);

    void add(Schoolyear schoolyear);

    void delete(int deleteId);

    Schoolyear getSchoolyearById(int id);

    void update(Schoolyear schoolyear);

    List<Schoolyear> getSchoolyear();
}
