package com.springboot.demo.Controller;


import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Entity.ActivityCategoryResponseData;
import com.springboot.demo.Service.ActivityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("activityCategory")
public class ActivityCategoryController {

    @Autowired
    ActivityCategoryService activityCategoryService;

    @RequestMapping("/golist")
    public String goList(){
        return "/WEB-INF/jsp/activityCategory/activityCategoryList.jsp";
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

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/activityCategory/activityCategoryAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        ActivityCategory activityCategory = new ActivityCategory(name,description);
        this.activityCategoryService.add(activityCategory);
        return goList();
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request){
        System.out.println("进来了");
        System.out.println(request.toString());
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.activityCategoryService.delete(deleteId);
//        return goList();
    }

}
