package com.springboot.demo.Service;


import com.springboot.demo.Entity.Major;

import java.util.List;

public interface MajorService {

    List<Major> getMajor(int id);
}
