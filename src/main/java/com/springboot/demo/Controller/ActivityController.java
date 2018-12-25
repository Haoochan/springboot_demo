package com.springboot.demo.Controller;


import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @RequestMapping("/golist")
    public String goList(){
        return "/WEB-INF/jsp/activity/activityList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityCategoryList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.activityService.getTotalCount();
        System.out.println(totalCount);
        LayuiResponseDataUtil activityResponseData = new LayuiResponseDataUtil();
        activityResponseData.setCode("0");
        activityResponseData.setMsg("");
        activityResponseData.setCount(totalCount);

        List<Activity> list = this.activityService.getAllActivity(before,pageSize);
        activityResponseData.setData(list);


        System.out.println(activityResponseData);
        return activityResponseData;
    }

}
