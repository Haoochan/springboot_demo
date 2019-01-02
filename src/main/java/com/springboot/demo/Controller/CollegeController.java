package com.springboot.demo.Controller;

import com.springboot.demo.Entity.College;
import com.springboot.demo.Service.CollegeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/College")
public class CollegeController {

    @Resource
    private CollegeService collegeService;

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getCollege")
    public Object getCollege() {
        List<College> list = this.collegeService.getCollege();
        return list;
    }
}
