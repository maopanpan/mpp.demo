package com.mpp.demo.dao;

import com.mpp.demo.annotation.MyBatisDao;
import com.mpp.demo.model.UUserRole;

import java.util.List;
import java.util.Map;

@MyBatisDao
public interface UUserRoleDao {

	int insert(UUserRole record);

    int insertSelective(UUserRole record);

	int deleteByUserId(Long id);

	int deleteRoleByUserIds(Map<String, Object> resultMap);

	List<Long> findUserIdByRoleId(Long id);
}