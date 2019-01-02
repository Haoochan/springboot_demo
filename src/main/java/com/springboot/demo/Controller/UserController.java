package com.springboot.demo.Controller;


import com.springboot.demo.Entity.LayuiResponseDataUtil;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

//    @ResponseBody
    @RequestMapping("/showUser")
    public String toIndex(Model model) {
        int userId = 1;
        User user = this.userService.getUserById(userId);
        model.addAttribute("user", user);
        return "/showUser.jsp";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        System.out.println("用户登录" + username + password + role);
        User user = this.userService.login(username, password, role);
        request.getSession().setAttribute("loginUser",user);
        System.out.println(request.getSession().getAttribute("loginUser"));
        if(!StringUtils.isEmpty(user)){
            model.addAttribute("user", user);
            model.addAttribute("msg", "登录成功");
            return "/WEB-INF/jsp/home1.jsp";
//            return "/WeAdmin/index.html";
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
        String sex = request.getParameter("sex");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        User user = new User(username,password,role,name,sex,phone,email);
        System.out.println("用户注册" + user.toString());
        this.userService.register(user);
        model.addAttribute("msg", "注册成功");
        return "/registerSuccess.jsp";
    }

    @RequestMapping("/goUserInfo")
    public String userInfo(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("loginUser");
        System.out.println(user.toString());
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userInfo.jsp";
    }

    @RequestMapping("/goUserInfoUpdate")
    public String goUserInfoUpdate(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("loginUser");
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
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        User user = new User(id,username,password,role,name,sex,phone,email);
        this.userService.userInfoUpdate(user);
        model.addAttribute("user",user);
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
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        User user = new User(username,password,role,name,sex,phone,email);
        this.userService.add(user);
        return goList();
    }

    @RequestMapping("/goEdit")
    public String goEdit(@RequestParam("id") int id,Model model){
        User user = this.userService.getUserById(id);
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/user/userEdit.jsp";
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request,Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        User user = new User(id,username,password,role,name,sex,phone,email);
        this.userService.userInfoUpdate(user);
        model.addAttribute("user",user);
        return "/user/goShow?id="+user.getId();
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
                                          @RequestParam(value = "sex" ,required = false)String sex){
        //        pageSize 前端设置10
        int before = pageSize*(page-1);
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyword",keyword);
        map.put("role",role);
        map.put("sex",sex);
        int totalCount = this.userService.getTotalCount(map);
        LayuiResponseDataUtil userResponseData = new LayuiResponseDataUtil();
        userResponseData.setCode("0");
        userResponseData.setMsg("");
        userResponseData.setCount(totalCount);
        map.put("before", String.valueOf(before));
        map.put("after", String.valueOf(pageSize));
        List<User> list = this.userService.getAllUser(map);
        userResponseData.setData(list);
        return userResponseData;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        int deleteId = Integer.parseInt(request.getParameter("id"));
        this.userService.delete(deleteId);
        return "ok";
    }

    //获取所有分类 给到活动添加那边的下拉框取值
    @ResponseBody
    @RequestMapping(value = "/getUser",method = RequestMethod.GET)
    public Object getActivityCategory(){
        List<User> list = this.userService.getUser();
        System.out.println(list.toString());
        return list;
    }



}
