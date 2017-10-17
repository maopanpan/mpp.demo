package com.mpp.demo.shiro.token;

import org.apache.shiro.authc.UsernamePasswordToken;

import java.io.Serializable;

/**
 * Created by maopanpan on 2017/08/22.
 */
public class ShiroToken extends UsernamePasswordToken implements Serializable {

    public ShiroToken(String userName, String pswd) {
        super(userName, pswd);
        this.pswd = pswd;
    }

    private String pswd;

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }
}
