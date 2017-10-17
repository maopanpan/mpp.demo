package com.mpp.demo.dao;

import com.mpp.demo.annotation.MyBatisDao;
import com.mpp.demo.bo.permission.URoleBo;
import com.mpp.demo.model.UUser;

import java.util.List;
import java.util.Map;

@MyBatisDao
public interface UUserDao {

    int deleteByPrimaryKey(Long id);

    int insert(UUser record);

    int insertSelective(UUser record);

    UUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UUser record);

    int updateByPrimaryKey(UUser record);

	UUser login(Map<String, Object> map);

	UUser findUserByEmail(String email);

	List<URoleBo> selectRoleByUserId(Long id);

}