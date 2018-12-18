package com.springboot.demo.Controller;


import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Entity.ActivityCategoryResponseData;
import com.springboot.demo.Service.ActivityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("activityCategory")
public class ActivityCategoryController {

    @Autowired
    ActivityCategoryService activityCategoryService;

    @RequestMapping("/golist")
    public String goList(){
        return "/WEB-INF/jsp/activityCategoryList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ActivityCategoryResponseData activityCategoryList(){

        int totalCount = this.activityCategoryService.getTotalCount();
        ActivityCategoryResponseData activityCategoryResponseData = new ActivityCategoryResponseData();
        activityCategoryResponseData.setCode("0");
        activityCategoryResponseData.setMsg("");
        activityCategoryResponseData.setCount(totalCount);

        List<ActivityCategory> list = this.activityCategoryService.getAllActivityCategory();
        activityCategoryResponseData.setData(list);


        System.out.println(activityCategoryResponseData);
        return activityCategoryResponseData;
    }
}
