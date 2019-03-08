package com.springboot.demo.Entity;

public class Schoolyear {
    private Integer id;

    private String schoolyear;

    public Schoolyear(String schoolyear) {
        this.schoolyear = schoolyear;
    }

    public Schoolyear(Integer id, String schoolyear) {
        this.id = id;
        this.schoolyear = schoolyear;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchoolyear() {
        return schoolyear;
    }

    public void setSchoolyear(String schoolyear) {
        this.schoolyear = schoolyear == null ? null : schoolyear.trim();
    }
}