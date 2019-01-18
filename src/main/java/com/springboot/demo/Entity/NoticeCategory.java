package com.springboot.demo.Entity;

public class NoticeCategory {
    private Integer id;

    private String name;

    private String description;

    public NoticeCategory(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public NoticeCategory(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
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
}