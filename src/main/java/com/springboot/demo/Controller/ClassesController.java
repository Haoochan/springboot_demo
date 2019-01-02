package com.springboot.demo.Controller;


import com.springboot.demo.Entity.Classes;
import com.springboot.demo.Service.ClassesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/classes")
public class ClassesController {

    @Resource
    private ClassesService classesService;

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getClasses")
    public Object getClasses(@RequestParam("id") int id){
        List<Classes> list = this.classesService.getClasses(id);
        return list;
    }
}
