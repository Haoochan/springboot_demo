package com.springboot.demo.Controller;


import com.springboot.demo.Entity.ActivityCategory;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Service.ActivityCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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
    public LayuiResponseDataUtil activityCategoryList(@RequestParam("page")int page,@RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.activityCategoryService.getTotalCount();
        LayuiResponseDataUtil activityCategoryResponseData = new LayuiResponseDataUtil();
        activityCategoryResponseData.setCode("0");
        activityCategoryResponseData.setMsg("");
        activityCategoryResponseData.setCount(totalCount);

        List<ActivityCategory> list = this.activityCategoryService.getAllActivityCategory(before,pageSize);
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

    //接收前端AJAX
//    @ResponseBody
//    @RequestMapping(value = "/add",method =RequestMethod.POST)
//    public String add(@RequestBody Map<String, String> map){
//        System.out.println("进来了");
//        System.out.println(map.toString());
//        String name = map.get("name");
//        String description = map.get("description");
//        ActivityCategory activityCategory = new ActivityCategory(name,description);
//        this.activityCategoryService.add(activityCategory);
//        return "ok";
//    }

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
        ActivityCategory activityCategory = this.activityCategoryService.getActivityCategoryById(id);
        model.addAttribute("activityCategory",activityCategory);
        return "/WEB-INF/jsp/activityCategory/activityCategoryEdit.jsp";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public void edit(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        ActivityCategory activityCategory = new ActivityCategory(id,name,description);
        this.activityCategoryService.update(activityCategory);
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        ActivityCategory activityCategory = this.activityCategoryService.getActivityCategoryById(id);
        model.addAttribute("activityCategory",activityCategory);

        return "/WEB-INF/jsp/activityCategory/activityCategoryShow.jsp";
    }

}
