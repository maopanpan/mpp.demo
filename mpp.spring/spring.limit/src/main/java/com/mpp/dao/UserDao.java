package com.mpp.dao;

import com.mpp.model.SysUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserDao {

    public void saveSysUser(Map<String, Object> params);

    public SysUser findById(Map<String, Object> params);

    public SysUser findByIdCard(Map<String, Object> params);

    public void deleteById(Map<String, Object> params);
}
