package com.mpp.demo.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

/**
 * 用户{@link UUser}、角色{@link URole}映射实体
 */
public class UUserRole implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long uid;

    private Long rid;

    public UUserRole(Long uid, Long rid) {
        this.uid = uid;
        this.rid = rid;
    }

    public UUserRole() {
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public String toString() {
        return JSONObject.fromObject(this).toString();
    }
}