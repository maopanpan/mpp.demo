package com.mpp.service.impl;

import com.mpp.dao.UserDao;
import com.mpp.model.SysUser;
import com.mpp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by maopanpan on 2017/08/08.
 */
@Service
@CacheConfig(cacheNames = "sysUser")
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    @Override
    public void saveSysUser(Map<String, Object> params) {
        userDao.saveSysUser(params);
    }

    @Override
    @Cacheable(key = "#params['id'].toString()")
    public SysUser findById(Map<String, Object> params) {
        logger.info("##################");
        return userDao.findById(params);
    }

    @Override
    @Cacheable(key = "#params['idCard'].toString()")
    public SysUser findByIdCard(Map<String, Object> params) {
        return userDao.findByIdCard(params);
    }

    /**
     * beforeInvocation可以改变触发清除操作的时间
     * @param params
     */
    @Override
    @CacheEvict(key="#params['id'].toString()", beforeInvocation = true)
    public void deleteById(Map<String, Object> params) {
        userDao.deleteById(params);
    }
}
