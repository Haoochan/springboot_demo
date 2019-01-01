package com.springboot.demo.Entity;

//import java.util.Date; //使用这个只能用空构造方法接 不能用自定义构造方法
//import java.sql.Date; //改成这个就不需要一个空构造方法
import java.sql.Timestamp;



public class Activity {
    private Integer id;

    private String topic;


    private Integer categoryId;

    private Integer createbyId;

    private String time;

    private Integer semester;

    private String schoolyear;

    private String createTime;

    private String content;

    private String creator;

    private String creatorRole;

    private String category;

    public Activity(){
    }

    public Activity(Integer id, String topic, String content,Integer categoryId, Integer createbyId, String time, Integer semester, String schoolyear, String createTime) {
        this.id = id;
        this.topic = topic;
        this.categoryId = categoryId;
        this.createbyId = createbyId;
        this.time = time;
        this.semester = semester;
        this.schoolyear = schoolyear;
        this.createTime = createTime;
        this.content = content;
    }

    public Activity(String topic, String content,Integer categoryId, Integer createbyId, String time, Integer semester, String schoolyear, String createTime) {
        this.topic = topic;
        this.categoryId = categoryId;
        this.createbyId = createbyId;
        this.time = time;
        this.semester = semester;
        this.schoolyear = schoolyear;
        this.createTime = createTime;
        this.content = content;
    }

    //java.sql.date 接数据库查询的构造函数
//    public Activity(Integer id, String topic, String category ,String creator, String creatorRole,Date time,String schoolyear, Integer semester ) {
//        this.id = id;
//        this.topic = topic;
//        this.time = time;
//        this.semester = semester;
//        this.schoolyear = schoolyear;
//        this.creator = creator;
//        this.creatorRole = creatorRole;
//        this.category = category;
//    }

//    public Activity(Integer id, String topic, Integer categoryId, Integer createbyId, Date time, Integer semester, String schoolyear, Date createTime, String content, String creator, String creatorRole, String category) {
//        this.id = id;
//        this.topic = topic;
//        this.categoryId = categoryId;
//        this.createbyId = createbyId;
//        this.time = time;
//        this.semester = semester;
//        this.schoolyear = schoolyear;
//        this.createTime = createTime;
//        this.content = content;
//        this.creator = creator;
//        this.creatorRole = creatorRole;
//        this.category = category;
//    }

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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }


    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", topic='" + topic + '\'' +
                ", categoryId=" + categoryId +
                ", createbyId=" + createbyId +
                ", time='" + time + '\'' +
                ", semester=" + semester +
                ", schoolyear='" + schoolyear + '\'' +
                ", createTime='" + createTime + '\'' +
                ", content='" + content + '\'' +
                ", creator='" + creator + '\'' +
                ", creatorRole='" + creatorRole + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}