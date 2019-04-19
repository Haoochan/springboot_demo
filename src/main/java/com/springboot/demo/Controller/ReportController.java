package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.Report;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.ReportService;
import com.springboot.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    ReportService reportService;

    @Autowired
    UserService userService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/report/reportList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil reportList(HttpServletRequest request,
                                              @RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                              @RequestParam(value = "collegeId",required = false) String collegeId,
                                              @RequestParam(value = "schoolyear") String schoolyear,
                                              @RequestParam(value = "semester",required = false) String semester,
                                              @RequestParam(value = "role",required = false) String role,
                                              @RequestParam(value = "keyword",required = false) String keyword,
                                              @RequestParam(value = "creatorId",required = false) String creatorId){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        //设置不是系统管理员的话就只显示该学院
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        if (!"系统管理员".equals(user.getRole())){
            map.put("collegeId", String.valueOf(user.getCollegeId()));
        }else {
            map.put("collegeId", collegeId);
        }
        map.put("creatorId", creatorId);
        map.put("schoolyear",schoolyear);
        map.put("semester",semester);
        map.put("role",role);
        map.put("keyword",keyword);
        int userTotalCount = this.reportService.getUserTotalCount(map);
        LayuiResponseDataUtil reportResponseData = new LayuiResponseDataUtil();
        reportResponseData.setCode("0");
        reportResponseData.setMsg("");
        reportResponseData.setCount(userTotalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<Report> list = this.reportService.getActivityCount(map);
        reportResponseData.setData(list);
        return reportResponseData;
    }
    
}
