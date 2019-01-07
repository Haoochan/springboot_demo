package com.springboot.demo.Entity;

public class Classes {
    private Integer id;

    private Integer grade;

    private String name;

    private Integer count;

    private Integer majorId;

    private  String majorName;

    private Integer collegeId;

    private String collegeName;

    public Classes() {
    }

    public Classes(Integer grade, String name, Integer count, Integer majorId ) {
        this.name = name;
        this.count = count;
        this.majorId = majorId;
        this.grade = grade;
    }

    public Classes(Integer id,Integer grade, String name, Integer count, Integer majorId) {
        this.id = id;
        this.name = name;
        this.count = count;
        this.majorId = majorId;
        this.grade = grade;
    }

    public Classes(Integer id, String name, Integer count, Integer majorId, Integer grade, String majorName, String collegeName) {
        this.id = id;
        this.name = name;
        this.count = count;
        this.majorId = majorId;
        this.grade = grade;
        this.majorName = majorName;
        this.collegeName = collegeName;
    }

    public Classes(Integer id, Integer grade, String name, Integer count, Integer majorId, String majorName, Integer collegeId, String collegeName) {
        this.id = id;
        this.grade = grade;
        this.name = name;
        this.count = count;
        this.majorId = majorId;
        this.majorName = majorName;
        this.collegeId = collegeId;
        this.collegeName = collegeName;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
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
}