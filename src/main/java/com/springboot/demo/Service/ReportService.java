package com.springboot.demo.Service;

import com.springboot.demo.Entity.Report;

import java.util.List;
import java.util.Map;

public interface ReportService {
    int getUserTotalCount(Map<String, String> map);

    List<Report> getActivityCount(Map<String, String> map);
}
