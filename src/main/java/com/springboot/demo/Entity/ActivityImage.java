package com.springboot.demo.Entity;

import java.util.Date;

public class ActivityImage {
    private Integer id;

    private String filename;

    private String path;

    private Date date;

    private Integer activityId;



    public ActivityImage(){

    }

    public ActivityImage(String filename, String path) {
        this.filename = filename;
        this.path = "/image/"+path;
    }

    public ActivityImage(Integer id, String filename, String path, Date date, Integer activityId) {
        this.id = id;
        this.filename = filename;
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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
//        String pathTemp = path == null ? null : path.trim();
//        this.path = "/image/"+pathTemp;
        this.path=path == null ? null : path.trim();
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