package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.NoticeMapper;
import com.springboot.demo.Entity.Notice;
import com.springboot.demo.Service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NoticeSereviceImpl implements NoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    @Override
    public int getTotalCount(Map<String, String> map) {
        return 0;
    }

    @Override
    public List<Notice> getAllNotice(Map<String, String> map) {
        return null;
    }

    @Override
    public void add(Notice notice) {
        noticeMapper.insert(notice);
    }
}