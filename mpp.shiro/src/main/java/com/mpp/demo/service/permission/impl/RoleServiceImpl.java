package com.mpp.demo.service.permission.impl;

import com.mpp.demo.bo.permission.RolePermissionAllocationBo;
import com.mpp.demo.common.mybatis.BaseMybatisDao;
import com.mpp.demo.common.mybatis.page.Pagination;
import com.mpp.demo.dao.URoleDao;
import com.mpp.demo.dao.URolePermissionDao;
import com.mpp.demo.dao.UUserDao;
import com.mpp.demo.model.URole;
import com.mpp.demo.service.permission.RoleService;
import com.mpp.demo.shiro.token.manager.TokenManager;
import com.mpp.demo.utils.LoggerUtils;
import com.mpp.demo.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by maopanpan on 2017/08/22.
 */
@Service
public class RoleServiceImpl extends BaseMybatisDao<URoleDao> implements RoleService {
    @Autowired
    URoleDao roleDao;
    @Autowired
    UUserDao userDao;
    @Autowired
    URolePermissionDao rolePermissionDao;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return roleDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(URole record) {
        return roleDao.insert(record);
    }

    @Override
    public int insertSelective(URole record) {
        return roleDao.insertSelective(record);
    }

    @Override
    public URole selectByPrimaryKey(Long id) {
        return roleDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(URole record) {
        return roleDao.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(URole record) {
        return roleDao.updateByPrimaryKeySelective(record);
    }


    @Override
    public Pagination<URole> findPage(Map<String, Object> resultMap,
                                      Integer pageNo, Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }
    @Override
    public Pagination<RolePermissionAllocationBo> findRoleAndPermissionPage(
            Map<String, Object> resultMap, Integer pageNo, Integer pageSize) {
        return super.findPage("findRoleAndPermission", "findCount", resultMap, pageNo, pageSize);
    }
    @Override
    public Map<String, Object> deleteRoleById(String ids) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        try {
            int count=0;
            String resultMsg = "删除成功。";
            String[] idArray = new String[]{};
            if(StringUtils.contains(ids, ",")){
                idArray = ids.split(",");
            }else{
                idArray = new String[]{ids};
            }

            c:for (String idx : idArray) {
                Long id = new Long(idx);
                if(new Long(1).equals(id)){
                    resultMsg = "操作成功，But'系统管理员不能删除。";
                    continue c;
                }else{
                    count+=this.deleteByPrimaryKey(id);
                }
            }
            resultMap.put("status", 200);
            resultMap.put("count", count);
            resultMap.put("resultMsg", resultMsg);
        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "根据IDS删除用户出现错误，ids[%s]", ids);
            resultMap.put("status", 500);
            resultMap.put("message", "删除出现错误，请刷新后再试！");
        }
        return resultMap;
    }

    @Override
    public Set<String> findRoleByUserId(Long userId) {
        return roleDao.findRoleByUserId(userId);
    }

    @Override
    public List<URole> findNowAllPermission() {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userId", TokenManager.getUserId());
        return roleDao.findNowAllPermission(map);
    }
    /**
     * 每20分钟执行一次
     */
    @Override
    public void initData() {
        //roleDao.initData();
    }
}
