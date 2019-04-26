package com.springboot.demo.Controller;


import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Entity.UserClassCollegeMap;
import com.springboot.demo.Service.UserClassCollegeMapService;
import com.springboot.demo.Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private UserClassCollegeMapService userClassCollegeMapService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model, HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        System.out.println("用户登录" + username + password + role);
        User user = this.userService.login(username, password, role);
        request.getSession().setAttribute("loginUser",user);
        session.setAttribute("loginUser",user);
        if(!Objects.isNull(user)) {
            User user1 = this.userService.getUserById(user.getId());
            session.setAttribute("userCollegeId",user1.getCollegeId());
        }

        if(!StringUtils.isEmpty(user)){
            model.addAttribute("user", user);
            return "../WEB-INF/jsp/home1.jsp";
        }
        else
            return "/index.jsp";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
//        String sex = request.getParameter("sex");
//        int phone = Integer.parseInt(request.getParameter("phone"));
//        String email = request.getParameter("email");
//        User user = new User(username,password,role,name,sex,phone,email);
        User user = new User(username,password,role,name);
        this.userService.register(user);
        model.addAttribute("msg", "注册成功");
        return "/registerSuccess.jsp";
    }

    @RequestMapping("/goUserInfo")
    public String userInfo(HttpServletRequest request,Model model){
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userInfo.jsp";
    }

    @RequestMapping("/goUserInfoUpdate")
    public String goUserInfoUpdate(HttpServletRequest request,Model model){
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userInfoUpdate.jsp";
    }

    @RequestMapping("/userInfoUpdate")
    public String userInfoUpdate(HttpServletRequest request,Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        User user = new User(id,username,password,role,name,sex,phone,email);
        this.userService.userInfoUpdate(user);
//        查出学院专业班级回显
        User user1 = userService.getUserById(id);
        model.addAttribute("user",user1);
        return "/WEB-INF/jsp/user/userInfo.jsp";
    }

    @RequestMapping("/goShow")
    public String goShow(@RequestParam("id") int id, Model model){
        User user = this.userService.getUserById(id);
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userShow.jsp";
    }

    @RequestMapping("/goAdd")
    public String goAdd(){
        return "/WEB-INF/jsp/user/userAdd.jsp";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone =request.getParameter("phone");
        String email = request.getParameter("email");
        User user = new User(username,password,role,name,sex,phone,email);
        this.userService.add(user);
        //添加user_class_college_map关系
        int collegeId = Integer.parseInt(request.getParameter("college"));
        int classesId = Integer.parseInt(request.getParameter("classes"));
        int classesId2 = Integer.parseInt(request.getParameter("classes2"));
        //系统管理员没有这两个 学院管理员有collegeId 助班、班主任有classesId
        if(collegeId!=0){
            //利用登录的方法查用户 获取该id
            int userId = userService.login(username,password,role).getId();
            if(classesId!=0){//助班 班主任
                UserClassCollegeMap userClassCollegeMap = new UserClassCollegeMap(userId,classesId,collegeId);
                userClassCollegeMapService.add(userClassCollegeMap);
                if (classesId2!=0){
                    UserClassCollegeMap userClassCollegeMap2 = new UserClassCollegeMap(userId,classesId2,collegeId);
                    userClassCollegeMapService.add(userClassCollegeMap2);
                }
            }else {//学院管理员
                UserClassCollegeMap userClassCollegeMap = new UserClassCollegeMap(userId,collegeId);
                userClassCollegeMapService.add(userClassCollegeMap);
            }
        }
        return goList();
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id,Model model){
        User user = this.userService.getUserById(id);
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userEdit.jsp";
    }


    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public String edit(@RequestBody Map<String, String> map, Model model){
        int userId = Integer.parseInt(map.get("id"));
        String username = map.get("username");
        String password = map.get("password");
        String role = map.get("role");
        String name = map.get("name");
        String sex = map.get("sex");
        String phone = map.get("phone");
        String email = map.get("email");
        User user = new User(userId,username,password,role,name,sex,phone,email);
        this.userService.userInfoUpdate(user);
        model.addAttribute("user",user);
        //修改学院专业班级
        int classCount=userClassCollegeMapService.getCountByUserId(userId);
        int collegeId = Integer.parseInt(map.get("college"));
        int classesId = Integer.parseInt(map.get("classes"));
        int classesId2 = Integer.parseInt(map.get("classes2"));
        if (role.equals("学院管理员")){
            UserClassCollegeMap userClassCollegeMap = new UserClassCollegeMap(userId,collegeId);
            //从助班或班主任 变成 学院管理员 先删除原来的
            if (classCount!=0) {
                userClassCollegeMapService.deleteAllByUserId(userId);
            }
            userClassCollegeMapService.add(userClassCollegeMap);
        }else if(role.equals("班主任")||(role.equals("助班"))){
            UserClassCollegeMap userClassCollegeMap1 = new UserClassCollegeMap(userId,classesId,collegeId);
            UserClassCollegeMap userClassCollegeMap2 = new UserClassCollegeMap(userId,classesId2,collegeId);
            if (classesId2!=0){//两个班级
                if(classCount==1){//原来只有一个
                    userClassCollegeMapService.editFirstClass(userClassCollegeMap1);
                    userClassCollegeMapService.add(userClassCollegeMap2);
                }else if (classCount==2){//原来有两个
                    userClassCollegeMapService.editFirstClass(userClassCollegeMap1);
                    userClassCollegeMapService.editSecondClass(userClassCollegeMap2);
                }else {
                    userClassCollegeMapService.add(userClassCollegeMap1);
                    userClassCollegeMapService.add(userClassCollegeMap2);
                }
            }else if(classesId2==0){//只有一个班级
                if (classCount==1){
                    userClassCollegeMapService.editFirstClass(userClassCollegeMap1);
                } else if (classCount==2){//原来有第二个班级 删除第二个
                    userClassCollegeMapService.deleteSecondClass(userId);
                }else if(classCount==0){
                    userClassCollegeMapService.add(userClassCollegeMap1);
                }
            }
        }
        return "ok";
    }

    @RequestMapping("/goList")
    public String goList(){
        return "/WEB-INF/jsp/user/userList.jsp";
    }

    @ResponseBody
    @RequestMapping("/list")
    public LayuiResponseDataUtil userList(@RequestParam("page")int page, @RequestParam("limit") int pageSize,
                                          @RequestParam(value = "keyword" ,required = false)String keyword,
                                          @RequestParam(value = "role" ,required = false)String role,
                                          @RequestParam(value = "sex" ,required = false)String sex,
                                          @RequestParam(value = "college" ,required = false)String college,
                                          @RequestParam(value = "major" ,required = false)String major,
                                          @RequestParam(value = "classes" ,required = false)String classes){
        //        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyword",keyword);
        map.put("role",role);
        map.put("sex",sex);
        map.put("collegeId",college);
        map.put("majorId",major);
        map.put("classesId",classes);
        System.out.println(map.toString());
        int totalCount = this.userService.getTotalCount(map);
        LayuiResponseDataUtil userResponseData = new LayuiResponseDataUtil();
        userResponseData.setCode("0");
        userResponseData.setMsg("");
        userResponseData.setCount(totalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<User> list = this.userService.getAllUser(map);
        System.out.println(list.toString());
        userResponseData.setData(list);
        return userResponseData;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.userService.delete(deleteId);
        this.userClassCollegeMapService.deleteAllByUserId(deleteId);
        return "ok";
    }

    //获取所有分类 给到活动添加那边的下拉框取值
    @ResponseBody
    @RequestMapping(value = "/getUser",method = RequestMethod.GET)
    public Object getUser(HttpServletRequest request,
                          @RequestParam(value = "collegeId",required = false) String collegeId){
        Map<String,String> map = new HashMap<String,String>();
        User user = userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getId());
        if (!"系统管理员".equals(user.getRole())){
            map.put("collegeId", String.valueOf(user.getCollegeId()));
        }else {
            map.put("collegeId", collegeId);
        }
        List<User> list = this.userService.getUser(map);
        return list;
    }



}
