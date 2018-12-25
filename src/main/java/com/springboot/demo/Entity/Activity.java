package com.springboot.demo.Entity;

//import java.util.Date; //使用这个只能用空构造方法接 不能用自定义构造方法
import java.sql.Date; //改成这个就不需要一个空构造方法

public class Activity {
    private Integer id;

    private String topic;

    private String img;

    private Integer categoryId;

    private Integer createbyId;

    private Date time;

    private Integer semester;

    private String schoolyear;

    private Date createTime;

    private String content;

    private String creator;

    private String creatorRole;

    private String category;

//    public Activity(){
//
//    }

    //java.sql.date 接数据库查询的构造函数
    public Activity(Integer id, String topic, String category ,String creator, String creatorRole,Date time,String schoolyear, Integer semester ) {
        this.id = id;
        this.topic = topic;
        this.time = time;
        this.semester = semester;
        this.schoolyear = schoolyear;
        this.creator = creator;
        this.creatorRole = creatorRole;
        this.category = category;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCreatorRole() {
        return creatorRole;
    }

    public void setCreatorRole(String creatorRole) {
        this.creatorRole = creatorRole;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic == null ? null : topic.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCreatebyId() {
        return createbyId;
    }

    public void setCreatebyId(Integer createbyId) {
        this.createbyId = createbyId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public String getSchoolyear() {
        return schoolyear;
    }

    public void setSchoolyear(String schoolyear) {
        this.schoolyear = schoolyear == null ? null : schoolyear.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }




}