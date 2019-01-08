package com.springboot.demo.Entity;

public class College {
    private Integer id;

    private String name;

    private String description;

    private String userName;

    private String userId;



    public College(String name){
        this.name = name;
    }

    public College(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public College(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public College(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public College(Integer id, String name, String description, String userId, String userName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.userName = userName;
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "College{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}