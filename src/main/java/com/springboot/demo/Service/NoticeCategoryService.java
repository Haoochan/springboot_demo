package com.springboot.demo.Service;

import com.springboot.demo.Entity.NoticeCategory;

import java.util.List;

public interface NoticeCategoryService {
    int getTotalCount();

    List<NoticeCategory> getAllNoticeCategory(int before, int pageSize);

    void add(NoticeCategory noticeCategory);

    void delete(int deleteId);

    NoticeCategory getNoticeCategoryById(int id);

    void update(NoticeCategory noticeCategory);

    List<NoticeCategory> getNoticeCategory();
}
