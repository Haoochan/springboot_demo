package com.springboot.demo.Entity;

import java.util.Date;

public class ActivityImage {
    private Integer id;

    private String oldFileName;

    private String newFileName;

    private String path;

    private Date date;

    private Integer activityId;

    public ActivityImage() {

    }

    public ActivityImage(Integer id, String oldFileName, String newFileName, String path, Date date, Integer activityId) {
        this.id = id;
        this.oldFileName = oldFileName;
        this.newFileName = newFileName;
        this.path = path;
        this.date = date;
        this.activityId = activityId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOldFileName() {
        return oldFileName;
    }

    public void setOldFileName(String oldFileName) {
        this.oldFileName = oldFileName == null ? null : oldFileName.trim();
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName == null ? null : newFileName.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }
}