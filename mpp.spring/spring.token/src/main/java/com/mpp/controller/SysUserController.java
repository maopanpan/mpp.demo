package com.mpp.controller;

import com.mpp.aop.Token;
import com.mpp.model.SysUser;
import com.mpp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by maopanpan on 2017/08/08.
 */
@RestController
public class SysUserController {

    private Logger log = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private UserService userService;

    @Token(remove = true)
    @RequestMapping(value = "/user/save", method = RequestMethod.GET, produces = "application/json")
    public Object saveSysUser(@RequestParam(value = "name", required = true) String name,
                              @RequestParam(value = "idCard", required = true) String idCard,
                              @RequestParam(value = "age", required = true) int age) {
        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("idCard", idCard);
        params.put("age", age);

        Map<String, String> result = new HashMap<>();
        try {
            userService.saveSysUser(params);
            result.put("status", "1");
            result.put("msg", "用户注册成功！");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "0");
            result.put("msg", "用户注册失败！");
            log.info("用户注册失败");
        }
        return result;
    }

    @Token(save = true)
    @RequestMapping(value = "/user/findUserById", method = RequestMethod.GET, produces = "application/json")
    public Object findUserById(@RequestParam(value = "id", required = true) Long id) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        SysUser sysUser = userService.findById(params);
        return sysUser;
    }

    @RequestMapping(value = "/user/findByIdCard", method = RequestMethod.GET, produces = "application/json")
    public Object findByIdCard(@RequestParam(value = "idCard", required = true) String idCard) {
        Map<String, Object> params = new HashMap<>();
        params.put("idCard", idCard);
        SysUser sysUser = userService.findByIdCard(params);
        return sysUser;
    }
}
