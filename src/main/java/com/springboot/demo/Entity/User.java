package com.springboot.demo.Entity;

import java.util.List;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String role;

    private String name;

    private String sex;

    private Integer phone;

    private String email;

    //对应班级
//    private List<Classes> classes;
    private String classes;
    private String classesId;


    //专业
    private String major;
    private Integer majorId;

    //学院
    private String college;
    private Integer collegeId;

    //给搜索下拉框提供构造方法
    public User(Integer id, String role, String name) {
        this.id = id;
        this.role = role;
        this.name = name;
    }

    //空构造方法
    public User(){

    }

    //带班级-专业-学院 List那里有问题
    public User(Integer id, String username, String password, String role, String name, String sex, Integer phone, String email, String classes,String major,Integer majorId, String college,Integer collegeId) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.classes = classes;
        this.major = major;
        this.majorId=majorId;
        this.college = college;
        this.collegeId = collegeId;
    }

    public User(Integer id, String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(Integer id, String username, String password, String role, String name, String sex, Integer phone, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
    }

    public User(String username, String password, String role, String name, String sex, Integer phone, String email) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
    }

    public User(Integer id, String username, String password, String role, String name, String sex, Integer phone, String email, String classes, String classesId, String major, Integer majorId, String college, Integer collegeId) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.classes = classes;
        this.classesId = classesId;
        this.major = major;
        this.majorId = majorId;
        this.college = college;
        this.collegeId = collegeId;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", classes=" + classes +
                ", major='" + major + '\'' +
                ", college='" + college + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }

    public String getClassesId() {
        return classesId;
    }

    public void setClassesId(String classesId) {
        this.classesId = classesId;
    }
}