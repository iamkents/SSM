package com.demo.ssm.stuMan.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


@Controller
@RequestMapping("/user")
public class userController {

    @Resource
    private com.demo.ssm.stuMan.service.userService userService;

    @RequestMapping("/listUsers")
    @ResponseBody
    public String listUsers(){
        return JSON.toJSONString(userService.listUsers());
    }

}

