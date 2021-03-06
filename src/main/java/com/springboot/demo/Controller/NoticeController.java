package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.Notice;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.NoticeService;
import com.springboot.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    @Autowired
    UserService userService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/notice/noticeList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityList(HttpServletRequest request,
                                              @RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                              @RequestParam(value = "keyword",required = false) String keyword,
                                              @RequestParam(value = "categoryId",required = false) String categoryId,
                                              @RequestParam(value = "collegeId",required = false) String collegeId,
                                              @RequestParam(value = "majorId",required = false) String majorId){

//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyword",keyword);
        map.put("categoryId", categoryId);
        map.put("collegeId", collegeId);
        map.put("majorId", majorId);
        //设置不是系统管理员的话就只显示该学院
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        if (!"系统管理员".equals(user.getRole())){
            map.put("collegeId", String.valueOf(user.getCollegeId()));
        }else {
            map.put("collegeId", collegeId);
        }
        int totalCount = this.noticeService.getTotalCount(map);
        LayuiResponseDataUtil noticeResponseData = new LayuiResponseDataUtil();
        noticeResponseData.setCode("0");
        noticeResponseData.setMsg("");
        noticeResponseData.setCount(totalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<Notice> list = this.noticeService.getAllNotice(map);
        noticeResponseData.setData(list);
        return noticeResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/notice/noticeAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginUser");
        int userId = user.getId();
        String title = request.getParameter("title");
        String time = request.getParameter("time");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String content = request.getParameter("content");
        int collegeId = Integer.parseInt(request.getParameter("college"));
        int majorId = Integer.parseInt(request.getParameter("major"));
        Notice notice = new Notice(title,categoryId,content,time,userId,collegeId,majorId);
        this.noticeService.add(notice);
        return goList();
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id, Model model){
        Notice notice = this.noticeService.getNoticeById(id);
        model.addAttribute("notice",notice);
        return "/WEB-INF/jsp/notice/noticeShow.jsp";
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id,Model model){
        Notice notice = this.noticeService.getNoticeById(id);
        model.addAttribute("notice",notice);
        return "/WEB-INF/jsp/notice/noticeEdit.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public String edit(@RequestBody Map<String, String> map, Model model) {
        int noticeId = Integer.parseInt(map.get("id"));
        String title = map.get("title");
        int categoryId = Integer.parseInt(map.get("category"));
        String content = map.get("content");
        String time = map.get("time");
        int collegeId = Integer.parseInt(map.get("college"));
        int majorId = Integer.parseInt(map.get("major"));
        Notice notice = new Notice(noticeId,title,categoryId,content,time,collegeId,majorId);
        this.noticeService.edit(notice);
        model.addAttribute("notice",notice);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.noticeService.delete(deleteId);
        return "ok";
    }

}
