package com.springboot.demo.Controller;


import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;
import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.ActivityService;
import com.springboot.demo.Service.UserService;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import static com.sun.xml.internal.fastinfoset.util.DuplicateAttributeVerifier.MAP_SIZE;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @Autowired
    UserService userService;

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/activity/activityList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityList(HttpServletRequest request,
                                              @RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                              @RequestParam(value = "keyword",required = false) String keyword,
                                              @RequestParam(value = "categoryId",required = false) String  categoryId,
                                              @RequestParam(value = "createbyId",required = false) String  createbyId,
                                              @RequestParam(value = "creatorRole",required = false) String creatorRole,
                                              @RequestParam(value = "semester",required = false) String  semester,
                                              @RequestParam(value = "schoolyear",required = false) String schoolyear,
                                              @RequestParam(value = "collegeId",required = false) String collegeId){

//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyword",keyword);
        map.put("categoryId", String.valueOf(categoryId));
        map.put("createbyId", String.valueOf(createbyId));
        map.put("creatorRole",creatorRole);
        map.put("semester", String.valueOf(semester));
        map.put("schoolyear",schoolyear);
        //设置不是系统管理员的话就只显示该学院
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        if (!"系统管理员".equals(user.getRole())){
            map.put("collegeId", String.valueOf(user.getCollegeId()));
        }else {
            map.put("collegeId", collegeId);
        }
        int totalCount = this.activityService.getTotalCount(map);
        LayuiResponseDataUtil activityResponseData = new LayuiResponseDataUtil();
        activityResponseData.setCode("0");
        activityResponseData.setMsg("");
        activityResponseData.setCount(totalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<Activity> list = this.activityService.getAllActivity(map);
        activityResponseData.setData(list);
        System.out.println(activityResponseData);
        return activityResponseData;
    }

    @RequestMapping("/goMyList")
    public String goMyList(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("loginUser");
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/activity/activityMyList.jsp";
    }

    //工作统计模块那边
    @RequestMapping("/goUserList")
    public String goUserList(HttpServletRequest request,Model model){
        User user = this.userService.getUserById(Integer.parseInt(request.getParameter("userId")));
        model.addAttribute("user",user);
        if(request.getParameter("schoolyear")!=null){
            String schoolyear=request.getParameter("schoolyear");
            model.addAttribute("schoolyear",schoolyear);
        }
        return "/WEB-INF/jsp/activity/activityMyList.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/myList",method = RequestMethod.GET)
    public LayuiResponseDataUtil activityMyList(@RequestParam("userId") int userId,
                                                @RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                              @RequestParam(value = "keyword",required = false) String keyword,
                                              @RequestParam(value = "categoryId",required = false) String  categoryId,
                                              @RequestParam(value = "semester",required = false) String  semester,
                                              @RequestParam(value = "schoolyear",required = false) String schoolyear){

//        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyword",keyword);
        map.put("categoryId", categoryId);
        map.put("semester", semester);
        map.put("schoolyear",schoolyear);
        map.put("userId", String.valueOf(userId));
        int totalCount = this.activityService.getTotalCountByUserId(map);
        LayuiResponseDataUtil activityResponseData = new LayuiResponseDataUtil();
        activityResponseData.setCode("0");
        activityResponseData.setMsg("");
        activityResponseData.setCount(totalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<Activity> list = this.activityService.getAllActivityByUserId(map);
        activityResponseData.setData(list);
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
        String topic = request.getParameter("topic");
        String content = request.getParameter("content");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int createbyId = Integer.parseInt(request.getParameter("createbyId"));
        SimpleDateFormat  sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = request.getParameter("time");
        String location = request.getParameter("location");
        String createTime = sdf.format(new Date());
        int semester = Integer.parseInt(request.getParameter("semester"));
        String schoolyear = request.getParameter("schoolyear");
        Activity activity = new Activity(id,topic,content,categoryId,createbyId,time,location,semester,schoolyear,createTime);
        this.activityService.update(activity);
        model.addAttribute("activity",activity);
        return "/activity/goShow?id="+activity.getId();
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/activity/activityAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginUser");
        int createbyId = user.getId();
        String topic = request.getParameter("topic");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String content = request.getParameter("content");
        int semester = Integer.parseInt(request.getParameter("semester"));
        String schoolyear = request.getParameter("schoolyear");
        String time = request.getParameter("time");
        String location = request.getParameter("location");
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = sdf.format(new Date());
        Activity activity = new Activity(topic,content,categoryId,createbyId,time,location,semester,schoolyear,createTime);
        this.activityService.add(activity);
        return goList();

    }


    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.activityService.delete(deleteId);//删除活动
        this.activityService.deleteImageByActivityId(deleteId);//删除对应照片
        return "ok";
    }



    //测试上传
    @RequestMapping("/goUpload")
    public String goUpload(){
        return "/WEB-INF/jsp/activity/testUpload.jsp";
//        return "/WEB-INF/jsp/activity/multipleUpload.jsp";
    }

    //上传照片
    public final static String UPLOAD_FILE_PATH = "E:\\Github\\springboot_demo\\src\\main\\webapp\\image";
    public final static int MAP_SIZE = 1;

    //多照片上传 每一张都调用一次
    @RequestMapping(value = "upload")
    @ResponseBody
    public String uploadImage(@RequestParam("file") MultipartFile file,
                              @RequestParam(value = "activityId",required = false) String  activityId) {
        if (!file.isEmpty()) {
            Map<String, String> resObj = new HashMap<>(MAP_SIZE);
            String newFilename;
            int imageId;
            SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
            String time = sdf.format(new Date());
            try {
                String filename = file.getOriginalFilename();
                newFilename = time+"-"+filename;
                BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_FILE_PATH, newFilename)));
                out.write(file.getBytes());
                out.flush();
                out.close();
                //构造
                ActivityImage activityImage;
                if (StringUtils.isEmpty(activityId)){//新添加工作的时候上传图片 先让activityId为空 后添加工作时把对应的空图片设置Id进去
                    activityImage = new ActivityImage(filename,newFilename);
                }else {//修改工作的时候上传
                    activityImage = new ActivityImage(filename,newFilename,Integer.parseInt(activityId));
                }
                imageId =  this.activityService.saveImage(activityImage);
            } catch (IOException e) {
                resObj.put("msg", "error");
                resObj.put("code", "1");
                return JSONObject.toJSONString(resObj);
            }
            resObj.put("msg", "ok");
            resObj.put("code", "0");
            resObj.put("src", newFilename);
            resObj.put("imageId", String.valueOf(imageId));
            return JSONObject.toJSONString(resObj);
        } else {
            return null;
        }
    }

    //根据活动Id获取对应活动的图片
    @RequestMapping(value = "getImage")
    @ResponseBody
    public String getImage(@RequestParam("id") int activityId){
        List<ActivityImage> activityImages = this.activityService.getImageByActivityId(activityId);
        String jsonArray = JSONArray.toJSONString(activityImages);
        return jsonArray;
    }

    //上传、修改时 删除图片
    @ResponseBody
    @RequestMapping("/imageDelete")
    public String imageDelete(HttpServletRequest request){
        int imageId = Integer.parseInt(request.getParameter("id"));
        String filename = this.activityService.getImageById(imageId).getPath().substring(7);
        //删除目录文件下的
        File folder = new File(UPLOAD_FILE_PATH);
        File[] files = folder.listFiles();
        for(File file:files){
            if(file.getName().equals(filename)){
                file.delete();
            }
        }
        this.activityService.imageDelete(imageId);
        return "ok";
    }

}
