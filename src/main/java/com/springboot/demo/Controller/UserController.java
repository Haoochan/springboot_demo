package com.springboot.demo.Controller;


import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
    public String login(String username, String password, String role, Model model) {
        System.out.println("用户登录" + username + password + role);
        User user = this.userService.login(username, password, role);
        if(!StringUtils.isEmpty(user)){
            model.addAttribute("user", user);
            model.addAttribute("msg", "登录成功");
            return "/WEB-INF/jsp/home.jsp";
        }
        else
            return "/index.jsp";
    }

    @RequestMapping("/register")
    public String register(String username, String password, String role, Model model) {
        System.out.println("用户注册" + username + password + role);
        this.userService.register(username, password, role);
        model.addAttribute("msg", "注册成功");
        return "/registerSuccess.jsp";
    }

}
