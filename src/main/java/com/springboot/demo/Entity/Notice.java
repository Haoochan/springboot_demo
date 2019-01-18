package com.springboot.demo.Entity;

import java.util.Date;

public class Notice {
    private Integer id;

    private String title;

    private Date time;

    private Integer categoryId;

    private Integer userId;

    private Integer collegeId;

    private Integer majorId;

    private String content;

    private String category;

    private String user;

    private String college;

    private String major;

    public Notice(String title, String content,Date time, Integer userId, Integer collegeId) {
        this.title = title;
        this.time = time;
        this.userId = userId;
        this.collegeId = collegeId;
        this.content = content;
    }

    public Notice(String title, String content,Date time, Integer userId, Integer collegeId,Integer majorId) {
        this.title = title;
        this.time = time;
        this.userId = userId;
        this.collegeId = collegeId;
        this.content = content;
        this.majorId = majorId;
    }

    public Notice(Integer id,String content, String title, Date time,Integer categoryId,String category, Integer userId,String user, Integer collegeId,String college, Integer majorId,String major) {
        this.id = id;
        this.title = title;
        this.time = time;
        this.userId = userId;
        this.collegeId = collegeId;
        this.majorId = majorId;
        this.content = content;
        this.user = user;
        this.college = college;
        this.major = major;
        this.categoryId=categoryId;
        this.category=category;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}