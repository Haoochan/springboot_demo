package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.Notice;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/notice/noticeList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){

//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
//        map.put("keyword",keyword);
//        map.put("categoryId", String.valueOf(categoryId));
//        map.put("collegeId", String.valueOf(collegeId));
//        map.put("majorId", String.valueOf(majorId));
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
        Notice notice = new Notice();
        if (collegeId!=0){
            if (majorId!=0){
                 notice = new Notice(title,categoryId,content,time,userId,collegeId,majorId);
            }else {
                notice = new Notice(title, categoryId, content, time, userId, collegeId);
            }
        }else {
            notice = new Notice(title,categoryId,content,time,userId);
        }
        this.noticeService.add(notice);
        return goList();
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id, Model model){
        Notice notice = this.noticeService.getNoticeById(id);
        model.addAttribute("notice",notice);
        return "/WEB-INF/jsp/notice/noticeShow.jsp";
    }

}
