package com.mpp.demo.common;

/**
 * Created by maopanpan on 2017/08/22.
 */
public class Constant {
    public static final String REDIS_SHIRO_SESSION = "sojson-shiro-demo-session:";
    //这里有个小BUG，因为Redis使用序列化后，Key反序列化回来发现前面有一段乱码，解决的办法是存储缓存不序列化
    public static final String REDIS_SHIRO_ALL = "*sojson-shiro-demo-session:*";

    /**
     * 为了不和其他的缓存混淆，采用追加前缀方式以作区分
     */
    public static final String REDIS_SHIRO_CACHE = "shiro-demo-cache:";

    public static final String SESSION_STATUS ="sojson-online-status";
}
