package com.mpp.demo.dao;

import com.mpp.demo.annotation.MyBatisDao;
import com.mpp.demo.model.URolePermission;

import java.util.List;
import java.util.Map;

@MyBatisDao
public interface URolePermissionDao {

    int insert(URolePermission record);

    int insertSelective(URolePermission record);

	List<URolePermission> findRolePermissionByPid(Long id);
	
	List<URolePermission> findRolePermissionByRid(Long id);
	
	List<URolePermission> find(URolePermission entity);
	
	int deleteByPid(Long id);

	int deleteByRid(Long id);

	int delete(URolePermission entity);

	int deleteByRids(Map<String, Object> resultMap);
}