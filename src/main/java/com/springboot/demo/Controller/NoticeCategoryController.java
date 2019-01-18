package com.springboot.demo.Controller;

import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.NoticeCategory;
import com.springboot.demo.Service.NoticeCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("noticeCategory")
public class NoticeCategoryController {
    @Autowired
    NoticeCategoryService noticeCategoryService;

    @RequestMapping("/golist")
    public String goList(){
        return "/WEB-INF/jsp/noticeCategory/noticeCategoryList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil noticeCategoryList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.noticeCategoryService.getTotalCount();
        LayuiResponseDataUtil noticeCategoryResponseData = new LayuiResponseDataUtil();
        noticeCategoryResponseData.setCode("0");
        noticeCategoryResponseData.setMsg("");
        noticeCategoryResponseData.setCount(totalCount);
        List<NoticeCategory> list = this.noticeCategoryService.getAllNoticeCategory(before,pageSize);
        noticeCategoryResponseData.setData(list);
        return noticeCategoryResponseData;
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/noticeCategory/noticeCategoryAdd.jsp";
    }

    //接收前端AJAX
    @ResponseBody
    @RequestMapping(value = "/add",method =RequestMethod.POST)
    public String add(@RequestBody Map<String, String> map){
        String name = map.get("name");
        String description = map.get("description");
        NoticeCategory noticeCategory = new NoticeCategory(name,description);
        this.noticeCategoryService.add(noticeCategory);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.noticeCategoryService.delete(deleteId);
        return "ok";
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id, Model model){
        NoticeCategory noticeCategory = this.noticeCategoryService.getNoticeCategoryById(id);
        model.addAttribute("noticeCategory",noticeCategory);
        return "/WEB-INF/jsp/noticeCategory/noticeCategoryEdit.jsp";
    }


    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public String edit(@RequestBody Map<String, String> map){
        int id = Integer.parseInt(map.get("id"));
        String name = map.get("name");
        String description = map.get("description");
        NoticeCategory noticeCategory = new NoticeCategory(id,name,description);
        this.noticeCategoryService.update(noticeCategory);
        return "ok";
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id,Model model){
        NoticeCategory noticeCategory = this.noticeCategoryService.getNoticeCategoryById(id);
        model.addAttribute("noticeCategory",noticeCategory);
        return "/WEB-INF/jsp/noticeCategory/noticeCategoryShow.jsp";
    }

    //获取所有分类 给到公告添加那边的下拉框取值
    @ResponseBody
    @RequestMapping(value = "/getnoticeCategory",method =RequestMethod.GET)
    public Object getNoticeCategory(){
        List<NoticeCategory> list = this.noticeCategoryService.getNoticeCategory();
        return list;
    }
}
