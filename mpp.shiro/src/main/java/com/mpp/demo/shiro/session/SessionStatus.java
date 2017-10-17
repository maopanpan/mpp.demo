package com.mpp.demo.shiro.session;

import java.io.Serializable;

/**
 * Created by maopanpan on 2017/08/22.
 */
public class SessionStatus implements Serializable {

    //是否踢出 true:有效，false：踢出。
    private Boolean onlineStatus = Boolean.TRUE;

    public Boolean isOnlineStatus() {
        return onlineStatus;
    }

    public Boolean getOnlineStatus() {
        return onlineStatus;
    }

    public void setOnlineStatus(Boolean onlineStatus) {
        this.onlineStatus = onlineStatus;
    }

}
