package com.mpp.service;


import com.mpp.model.SysUser;

import java.util.Map;

public interface UserService {

    public void saveSysUser(Map<String, Object> params);

    public SysUser findById(Map<String, Object> params);

    public SysUser findByIdCard(Map<String, Object> params);

    public void deleteById(Map<String, Object> params);
}
