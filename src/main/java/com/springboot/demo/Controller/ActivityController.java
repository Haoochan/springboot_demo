package com.springboot.demo.Controller;


import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Service.ActivityService;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @RequestMapping("/golist")
    public String goList(){
        return "/WEB-INF/jsp/activity/activityList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityCategoryList(@RequestParam("page")int page, @RequestParam("limit") int pageSize){
//        pageSize 前端设置10
        int before = pageSize*(page-1);
        int totalCount = this.activityService.getTotalCount();
        System.out.println(totalCount);
        LayuiResponseDataUtil activityResponseData = new LayuiResponseDataUtil();
        activityResponseData.setCode("0");
        activityResponseData.setMsg("");
        activityResponseData.setCount(totalCount);

        List<Activity> list = this.activityService.getAllActivity(before,pageSize);
        activityResponseData.setData(list);
        System.out.println(activityResponseData);
        return activityResponseData;
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id, Model model){
        Activity activity = this.activityService.getActivityById(id);
        model.addAttribute("activity",activity);

        return "/WEB-INF/jsp/activity/activityShow.jsp";
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id,Model model){
        Activity activity = this.activityService.getActivityById(id);
        model.addAttribute("activity",activity);
        return "/WEB-INF/jsp/activity/activityEdit.jsp";
    }


    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, Model model) throws ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String topic = request.getParameter("topic");
        String content = request.getParameter("content");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int createbyId = Integer.parseInt(request.getParameter("createbyId"));
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat  sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date time = format1.parse(request.getParameter("time"));
//        Date createTime = format2.parse(sdf.format(new Date()));
        String time = request.getParameter("time");
        String createTime = sdf.format(new Date());
        int semester = Integer.parseInt(request.getParameter("semester"));
        String schoolyear = request.getParameter("schoolyear");
        Activity activity = new Activity(id,topic,content,categoryId,createbyId,time,semester,schoolyear,createTime);
        this.activityService.update(activity);
        model.addAttribute("activity",activity);
        return "/activity/goShow?id="+activity.getId();
    }

    //测试上传
    @RequestMapping("/goUpload")
    public String goUpload(){
        return "/WEB-INF/jsp/activity/upload.jsp";
    }

    //上传照片
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject uploadHeadImage(@RequestParam("file") MultipartFile file)
            throws IOException {
        Assert.notNull(file, "上传文件不能为空");
//        String src="/plug-in/images/people/";
//        String path="C:/Users/lenove/Desktop/why123/why123/src/main/webapp/plug-in/images/people";
        String src="/plug-in/images/people/";
        String path="E:\\GitHub\\Java\\springboot_demo\\src\\main\\webapp\\image";
        JSONObject json = new JSONObject();
        //System.currentTimeMillis()根据系统时间产生随机数，保证上传的图片名字不一样
        String name=System.currentTimeMillis()+file.getOriginalFilename();
        File dir = new File(path, name);
        src=src+name;
        if (!dir.exists()) {
            dir.mkdirs();
            json.put("msg","上传成功");
            json.put("code",0);
            json.put("src",src);
        } else {
            json.put("msg","上传失败");
            json.put("code",1);
        }
        file.transferTo(dir);
        return json;
    }


}
