package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.NoticeCategoryMapper;
import com.springboot.demo.Entity.NoticeCategory;
import com.springboot.demo.Service.NoticeCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeCategoryServiceImpl implements NoticeCategoryService {

    @Autowired
    private NoticeCategoryMapper noticeCategoryMapper;

    @Override
    public int getTotalCount() {
        return noticeCategoryMapper.getTotalCount();
    }

    @Override
    public List<NoticeCategory> getAllNoticeCategory(int before, int pageSize) {
        return noticeCategoryMapper.getAllNoticeCategory(before,pageSize);
    }

    @Override
    public void add(NoticeCategory noticeCategory) {
        noticeCategoryMapper.insert(noticeCategory);
    }

    @Override
    public void delete(int deleteId) {
        noticeCategoryMapper.deleteByPrimaryKey(deleteId);
    }

    @Override
    public NoticeCategory getNoticeCategoryById(int id) {
        return noticeCategoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(NoticeCategory noticeCategory) {
        noticeCategoryMapper.updateByPrimaryKey(noticeCategory);
    }

    @Override
    public List<NoticeCategory> getNoticeCategory() {
        return noticeCategoryMapper.getNoticeCategory();
    }
}
