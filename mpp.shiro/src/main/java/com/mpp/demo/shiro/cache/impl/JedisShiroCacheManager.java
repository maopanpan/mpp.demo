package com.mpp.demo.shiro.cache.impl;

import com.mpp.demo.shiro.cache.JedisManager;
import com.mpp.demo.shiro.cache.JedisShiroCache;
import com.mpp.demo.shiro.cache.ShiroCacheManager;
import org.apache.shiro.cache.Cache;

/**
 * Created by maopanpan on 2017/08/22.
 */
public class JedisShiroCacheManager implements ShiroCacheManager {

    private JedisManager jedisManager;

    @Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new JedisShiroCache<K, V>(name, jedisManager);
    }

    @Override
    public void destroy() {
        //如果和其他系统，或者应用在一起就不能关闭
        //getJedisManager().getJedis().shutdown();
    }

    public JedisManager getJedisManager() {
        return jedisManager;
    }

    public void setJedisManager(JedisManager jedisManager) {
        this.jedisManager = jedisManager;
    }
}
