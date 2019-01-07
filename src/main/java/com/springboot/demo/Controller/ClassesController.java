package com.springboot.demo.Controller;


import com.springboot.demo.Entity.Classes;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Service.ClassesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/classes")
public class ClassesController {

    @Resource
    private ClassesService classesService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/classes/classesList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil classesList(@RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                           @RequestParam(value = "keyword",required = false) String keyword,
                                             @RequestParam(value = "grade",required = false) String grade,
                                             @RequestParam(value = "majorId",required = false) String majorId,
                                           @RequestParam(value = "collegeId",required = false) String collegeId){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("before", String.valueOf(before));
        map.put("pageSize", String.valueOf(pageSize));
        map.put("keyword",keyword);
        map.put("grade",grade);
        map.put("majorId",majorId);
        map.put("collegeId", String.valueOf(collegeId));
        int totalCount = this.classesService.getTotalCount(map);
        LayuiResponseDataUtil classesResponseData = new LayuiResponseDataUtil();
        classesResponseData.setCode("0");
        classesResponseData.setMsg("");
        classesResponseData.setCount(totalCount);
        List<Classes> list = this.classesService.getAllClasses(map);
        classesResponseData.setData(list);
        return classesResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/classes/classesAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        int grade = Integer.parseInt(request.getParameter("grade"));
        String name = request.getParameter("name");
        int count = Integer.parseInt(request.getParameter("count"));
        int majorId = Integer.parseInt(request.getParameter("major"));
        Classes classes = new Classes(grade,name,count,majorId);
        this.classesService.add(classes);
        return goList();
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id, Model model){
        Classes classes = this.classesService.getClassesById(id);
        model.addAttribute("classes",classes);
        return "/WEB-INF/jsp/classes/classesEdit.jsp";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public void edit(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        int grade = Integer.parseInt(request.getParameter("grade"));
        String name = request.getParameter("name");
        int count = Integer.parseInt(request.getParameter("count"));
        int majorId = Integer.parseInt(request.getParameter("major"));
        Classes classes = new Classes(id,grade,name,count,majorId);
        this.classesService.update(classes);
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        Classes classes = this.classesService.getClassesById(id);
        model.addAttribute("classes",classes);
        return "/WEB-INF/jsp/classes/classesShow.jsp";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.classesService.delete(deleteId);
        return "ok";
    }

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getClasses")
    public Object getClasses(@RequestParam("id") int id){
        List<Classes> list = this.classesService.getClasses(id);
        return list;
    }
}
