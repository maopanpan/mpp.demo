package com.mpp.demo.dao;

import com.mpp.demo.annotation.MyBatisDao;
import com.mpp.demo.bo.permission.UPermissionBo;
import com.mpp.demo.model.UPermission;

import java.util.List;
import java.util.Set;

@MyBatisDao
public interface UPermissionDao {

    int deleteByPrimaryKey(Long id);

    int insert(UPermission record);

    int insertSelective(UPermission record);

    UPermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UPermission record);

    int updateByPrimaryKey(UPermission record);

    List<UPermissionBo> selectPermissionById(Long id);

    //根据用户ID获取权限的Set集合
    Set<String> findPermissionByUserId(Long id);
}