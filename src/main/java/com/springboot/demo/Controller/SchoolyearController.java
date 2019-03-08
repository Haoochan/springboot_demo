package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.Schoolyear;
import com.springboot.demo.Service.SchoolyearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("schoolyear")
public class SchoolyearController {
    @Autowired
    SchoolyearService schoolyearService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/schoolyear/schoolyearList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityCategoryList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.schoolyearService.getTotalCount();
        LayuiResponseDataUtil activityCategoryResponseData = new LayuiResponseDataUtil();
        activityCategoryResponseData.setCode("0");
        activityCategoryResponseData.setMsg("");
        activityCategoryResponseData.setCount(totalCount);
        List<Schoolyear> list = this.schoolyearService.getAllSchoolyear(before,pageSize);
        activityCategoryResponseData.setData(list);
        return activityCategoryResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/schoolyear/schoolyearAdd.jsp";
    }


    //接收前端AJAX
    @ResponseBody
    @RequestMapping(value = "/add",method =RequestMethod.POST)
    public String add(@RequestBody Map<String, String> map){
        String schoolyearName = map.get("schoolyear");
        Schoolyear schoolyear = new Schoolyear(schoolyearName);
        this.schoolyearService.add(schoolyear);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.schoolyearService.delete(deleteId);
        return "ok";
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id, Model model){
        Schoolyear schoolyear = this.schoolyearService.getSchoolyearById(id);
        model.addAttribute("schoolyear",schoolyear);
        return "/WEB-INF/jsp/schoolyear/schoolyearEdit.jsp";
    }


    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public String edit(@RequestBody Map<String, String> map){
        int id = Integer.parseInt(map.get("id"));
        String schoolyearName = map.get("schoolyear");
        Schoolyear schoolyear = new Schoolyear(id,schoolyearName);
        this.schoolyearService.update(schoolyear);
        return "ok";
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        Schoolyear schoolyear = this.schoolyearService.getSchoolyearById(id);
        model.addAttribute("schoolyear",schoolyear);
        return "/WEB-INF/jsp/schoolyear/schoolyearShow.jsp";
    }

    //获取所有学年 给到下拉框取值
    @ResponseBody
    @RequestMapping(value = "/getSchoolyear",method =RequestMethod.GET)
    public Object getSchoolyear(){
        List<Schoolyear> list = this.schoolyearService.getSchoolyear();
        return list;
    }
}
