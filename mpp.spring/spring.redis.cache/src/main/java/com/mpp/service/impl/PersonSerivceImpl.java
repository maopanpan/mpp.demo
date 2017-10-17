package com.mpp.service.impl;

import com.mpp.service.PersonSerivce;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by maopanpan on 2017/08/08.
 */
@Service("personSerivce")
@CacheConfig(cacheNames = "users")
public class PersonSerivceImpl implements PersonSerivce {

    private Logger logger = LoggerFactory.getLogger(PersonSerivceImpl.class);

    private static Map<String, Object> dataMap = new HashMap<>();
    static {
        Map<String, String> personObject = new HashMap<>();
        personObject.put("name", "张三");
        personObject.put("idCard", "455010086931000");
        dataMap.put("1001", personObject);
    }
    @Override
    @Cacheable(key="#userId")
    public Object findUser(String userId) {
        logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return dataMap.get(userId);
    }
}
