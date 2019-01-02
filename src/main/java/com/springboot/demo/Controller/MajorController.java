package com.springboot.demo.Controller;

import com.springboot.demo.Entity.Major;
import com.springboot.demo.Service.MajorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/Major")
public class MajorController {

    @Resource
    private MajorService majorService;

    //提供下拉框
    @ResponseBody
    @RequestMapping("/getMajor")
    public Object getMajor(@RequestParam("id") int id) {
        List<Major> list = this.majorService.getMajor(id);
        return list;
    }
}
