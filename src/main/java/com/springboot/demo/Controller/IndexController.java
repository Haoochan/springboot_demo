package com.springboot.demo.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("/")
    public String Index(){
        return "/login.jsp";
    }

    @RequestMapping("/user/index")
    public String toIndex(){
        return "/index.jsp";
    }

    @RequestMapping("/register")
    public String toRegister(){
        return "/register.jsp";
    }
}
