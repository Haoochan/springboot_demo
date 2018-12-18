package com.springboot.demo.Entity;

import java.util.List;

public class ActivityCategoryResponseData {
    private String code;
    private String msg;
    private int count;
    private List<ActivityCategory> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<ActivityCategory> getData() {
        return data;
    }

    public void setData(List<ActivityCategory> data) {
        this.data = data;
    }

}
