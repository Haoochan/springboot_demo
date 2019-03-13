package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.NoticeMapper;
import com.springboot.demo.Entity.Notice;
import com.springboot.demo.Service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

@Service
public class NoticeSereviceImpl implements NoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    @Override
    public int getTotalCount(Map<String, String> map) {
        return noticeMapper.getTotalCount(map);
    }

    @Override
    public List<Notice> getAllNotice(Map<String, String> map) {
        List<Notice> noticeList = noticeMapper.getAllNotice(map);
        for (Notice notice:noticeList) {
            if (0==(notice.getMajorId())){
                notice.setMajor("全学院");
            }
        }
        return noticeList;
    }

    @Override
    public void add(Notice notice) {
        noticeMapper.insert(notice);
    }

    @Override
    public Notice getNoticeById(int id) {
        Notice notice = noticeMapper.selectByPrimaryKey(id);
        if (0==(notice.getMajorId())){
            notice.setMajor("全学院");
        }
        return notice;
    }

    @Override
    public void edit(Notice notice) {
        noticeMapper.updateByPrimaryKeySelective(notice);
    }

    @Override
    public void delete(int deleteId) {
        noticeMapper.deleteByPrimaryKey(deleteId);
    }
}