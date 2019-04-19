package com.springboot.demo.Entity;

import java.util.List;

public class Report {

    private Integer userId;

    private String username;

    private String role;

    private String college;

    private List<Integer> categoryCountList;

    private Integer schoolyearCount;

    private Integer semeterCount;

    private Integer totalCountByUser;

    private List<Integer> totalCountByCategory;

    private Integer categoryCountA;

    private Integer categoryCountB;

    private Integer categoryCountC;

    private Integer categoryCountD;

    private Integer categoryCountE;



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Integer> getCategoryCountList() {
        return categoryCountList;
    }

    public void setCategoryCountList(List<Integer> categoryCountList) {
        this.categoryCountList = categoryCountList;
    }

    public Integer getSchoolyearCount() {
        return schoolyearCount;
    }

    public void setSchoolyearCount(Integer schoolyearCount) {
        this.schoolyearCount = schoolyearCount;
    }

    public Integer getSemeterCount() {
        return semeterCount;
    }

    public void setSemeterCount(Integer semeterCount) {
        this.semeterCount = semeterCount;
    }

    public Integer getTotalCountByUser() {
        return totalCountByUser;
    }

    public void setTotalCountByUser(Integer totalCountByUser) {
        this.totalCountByUser = totalCountByUser;
    }

    public List<Integer> getTotalCountByCategory() {
        return totalCountByCategory;
    }

    public void setTotalCountByCategory(List<Integer> totalCountByCategory) {
        this.totalCountByCategory = totalCountByCategory;
    }

    public Integer getCategoryCountA() {
        return categoryCountA;
    }

    public void setCategoryCountA(Integer categoryCountA) {
        this.categoryCountA = categoryCountA;
    }

    public Integer getCategoryCountB() {
        return categoryCountB;
    }

    public void setCategoryCountB(Integer categoryCountB) {
        this.categoryCountB = categoryCountB;
    }

    public Integer getCategoryCountC() {
        return categoryCountC;
    }

    public void setCategoryCountC(Integer categoryCountC) {
        this.categoryCountC = categoryCountC;
    }

    public Integer getCategoryCountD() {
        return categoryCountD;
    }

    public void setCategoryCountD(Integer categoryCountD) {
        this.categoryCountD = categoryCountD;
    }

    public Integer getCategoryCountE() {
        return categoryCountE;
    }

    public void setCategoryCountE(Integer categoryCountE) {
        this.categoryCountE = categoryCountE;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }
}
