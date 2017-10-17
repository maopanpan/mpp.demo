package com.mpp.controller;

import com.mpp.service.PersonSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by maopanpan on 2017/08/08.
 */
@RestController
public class DemoController {

    @Autowired
    private PersonSerivce personSerivce;

    @RequestMapping(value = "/person/findUser", method = RequestMethod.GET, produces = "application/json")
    public Object findUser(HttpServletRequest request, @RequestParam(value = "userId", required = false) String userId) {
        Map<String, String> map = new HashMap<>();
        map.put("name", "张三");
        map.put("idCard", "429001199010086930");
        request.getSession().setAttribute("userInfo", map);
        return personSerivce.findUser(userId);
    }
}
