package com.springboot.demo.Entity;

public class Major {
    private Integer id;

    private String name;

    private String description;

    private Integer collegeId;

    private String collegeName;

    public Major(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Major(String name, String description, Integer collegeId) {
        this.name = name;
        this.description = description;
        this.collegeId = collegeId;
    }

    public Major(Integer id, String name, String description, Integer collegeId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.collegeId = collegeId;
    }

    public Major(Integer id, String name, String description, Integer collegeId, String collegeName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.collegeId = collegeId;
        this.collegeName = collegeName;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getcollegeId() {
        return collegeId;
    }

    public void setcollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }
}