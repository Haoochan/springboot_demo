package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.Major;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.MajorService;
import com.springboot.demo.Service.UserClassCollegeMapService;
import com.springboot.demo.Service.UserService;
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
@RequestMapping("/major")
public class MajorController {

    @Resource
    private MajorService majorService;

    @Resource
    private UserService userService;

    @Resource
    private UserClassCollegeMapService userClassCollegeMapService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/major/majorList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil majorList(HttpServletRequest request,
                                            @RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                           @RequestParam(value = "keyword",required = false) String keyword,
                                           @RequestParam(value = "collegeId",required = false) String collegeId){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        //根据用户筛选专业
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        if (!"系统管理员".equals(user.getRole())) {
            collegeId = String.valueOf(userClassCollegeMapService.getCollegeIdByUserId(user.getId()));
        }
        map.put("before", String.valueOf(before));
        map.put("pageSize", String.valueOf(pageSize));
        map.put("keyword",keyword);
        map.put("collegeId", String.valueOf(collegeId));
        int totalCount = this.majorService.getTotalCount(map);
        LayuiResponseDataUtil majorResponseData = new LayuiResponseDataUtil();
        majorResponseData.setCode("0");
        majorResponseData.setMsg("");
        majorResponseData.setCount(totalCount);
        List<Major> list = this.majorService.getAllMajor(map);
        majorResponseData.setData(list);
        return majorResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/major/majorAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int collegeId = Integer.parseInt(request.getParameter("college"));
        Major major = new Major(name,description,collegeId);
        this.majorService.add(major);
        return goList();
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id, Model model){
        Major major = this.majorService.getMajorById(id);
        model.addAttribute("major",major);
        return "/WEB-INF/jsp/major/majorEdit.jsp";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public void edit(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int collegeId = Integer.parseInt(request.getParameter("college"));
        Major major = new Major(id,name,description,collegeId);
        this.majorService.update(major);
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        Major major = this.majorService.getMajorById(id);
        model.addAttribute("major",major);
        return "/WEB-INF/jsp/major/majorShow.jsp";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.majorService.delete(deleteId);
        return "ok";
    }

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getMajor")
    public Object getMajor(@RequestParam("id") int collegeId) {
        List<Major> list = this.majorService.getMajor(collegeId);
        return list;
    }
}
