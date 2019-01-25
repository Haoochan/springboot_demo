package com.springboot.demo.Service;

import com.springboot.demo.Entity.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    int getTotalCount(Map<String, String> map);

    List<Notice> getAllNotice(Map<String, String> map);

    void add(Notice notice);

    Notice getNoticeById(int id);

    void edit(Notice notice);
}
