package com.mpp.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by maopanpan on 2017/08/25.
 */
@Controller
@RequestMapping("user")
public class UserIndexController extends  BaseController{


    @RequestMapping(value="index",method= RequestMethod.GET)
    public String index(){
        return "user/index";
    }

    @RequestMapping(value="mainContext",method= RequestMethod.GET)
    public String mainContext(){
        return "user/mainContext";
    }
}
