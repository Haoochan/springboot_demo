package com.springboot.demo.Controller;

import com.springboot.demo.Entity.College;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Service.CollegeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/college")
public class CollegeController {

    @Resource
    private CollegeService collegeService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/college/collegeList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil collegeList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.collegeService.getTotalCount();
        LayuiResponseDataUtil collegeResponseData = new LayuiResponseDataUtil();
        collegeResponseData.setCode("0");
        collegeResponseData.setMsg("");
        collegeResponseData.setCount(totalCount);
        List<College> list = this.collegeService.getAllCollege(before,pageSize);
        collegeResponseData.setData(list);
        return collegeResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/college/collegeAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        College college = new College(name,description);
        this.collegeService.add(college);
        return goList();
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id, Model model){
        College college = this.collegeService.getCollegeById(id);
        model.addAttribute("college",college);
        return "/WEB-INF/jsp/college/collegeEdit.jsp";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public void edit(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        College college = new College(id,name,description);
        this.collegeService.update(college);
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        College college = this.collegeService.getCollegeById(id);
        model.addAttribute("college",college);
        return "/WEB-INF/jsp/college/collegeShow.jsp";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.collegeService.delete(deleteId);
        return "ok";
    }

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getCollege")
    public Object getCollege() {
        List<College> list = this.collegeService.getCollege();
        return list;
    }
}
