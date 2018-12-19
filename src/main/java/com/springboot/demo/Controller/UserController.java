package com.springboot.demo.Controller;


import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/userInfo")
    public String userInfo(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("loginUser");
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/userInfo.jsp";
    }

    @RequestMapping("/goUserInfoUpdate")
    public String goUserInfoUpdate(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("loginUser");
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/userInfoUpdate.jsp";
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
            return "/WEB-INF/jsp/userInfo.jsp";
        }



}
