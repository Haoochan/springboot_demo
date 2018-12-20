package com.springboot.demo.Controller;


import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Entity.ActivityCategoryResponseData;
import com.springboot.demo.Service.ActivityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        System.out.println(deleteId);
        this.activityCategoryService.delete(deleteId);
        return "ok";
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id,Model model){
//        System.out.println("111111111"+id);
        ActivityCategory activityCategory = this.activityCategoryService.getActivityCategoryById(id);
        model.addAttribute("activityCategory",activityCategory);
        return "/WEB-INF/jsp/activityCategory/activityCategoryEdit.jsp";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public String edit(HttpServletRequest request){
        System.out.println("进来了");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        ActivityCategory activityCategory = new ActivityCategory(id,name,description);
        this.activityCategoryService.update(activityCategory);

        return "ok";
    }

}
