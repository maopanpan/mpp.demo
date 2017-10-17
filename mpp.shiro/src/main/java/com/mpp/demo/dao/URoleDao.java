package com.mpp.demo.dao;

import com.mpp.demo.annotation.MyBatisDao;
import com.mpp.demo.model.URole;

import java.util.List;
import java.util.Map;
import java.util.Set;

@MyBatisDao
public interface URoleDao {

    int deleteByPrimaryKey(Long id);

    int insert(URole record);

    int insertSelective(URole record);

    URole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(URole record);

    int updateByPrimaryKey(URole record);

	Set<String> findRoleByUserId(Long id);

	List<URole> findNowAllPermission(Map<String, Object> map);
	
	void initData();
}