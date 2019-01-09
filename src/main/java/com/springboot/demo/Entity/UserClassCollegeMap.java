package com.springboot.demo.Entity;

public class UserClassCollegeMap {
    private Integer id;

    private Integer userId;

    private Integer classesId;

    private Integer collegeId;

    public UserClassCollegeMap(Integer userId, Integer collegeId) {
        this.userId = userId;
        this.collegeId = collegeId;
    }

    public UserClassCollegeMap(Integer userId, Integer classesId, Integer collegeId) {
        this.userId = userId;
        this.classesId = classesId;
        this.collegeId = collegeId;
    }

    public UserClassCollegeMap(Integer id, Integer userId, Integer classesId, Integer collegeId) {
        this.id = id;
        this.userId = userId;
        this.classesId = classesId;
        this.collegeId = collegeId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClassesId() {
        return classesId;
    }

    public void setClassesId(Integer classesId) {
        this.classesId = classesId;
    }

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }
}