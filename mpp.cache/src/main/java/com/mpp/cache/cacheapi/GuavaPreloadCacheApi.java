package com.mpp.cache.cacheapi;

import java.util.concurrent.TimeUnit;

import com.google.common.cache.CacheLoader;
import com.mpp.cache.cachemanager.CacheManagerGuava;
import com.mpp.cache.exception.CacheException;

/**
 * @version 1.0
 * @类描述：guava本地缓存（guava一级缓存）
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午1:56:03
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午1:56:03
 * @修改备注：
 * @since jdk1.7
 */
public class GuavaPreloadCacheApi {

    // 缓存管理者
    CacheManagerGuava cm = new CacheManagerGuava();

    /**
     * 初始化缓存提供者
     *
     * @throws CacheException
     */
    public GuavaPreloadCacheApi() {
        try {
            cm.initCacheProviderLV1("dtcache/dtcache.properties");
        } catch (CacheException e) {
            e.printStackTrace();
        }
    }

    /**
     * set(缓存数据)
     *
     * @param cacheName   缓存对象名称
     * @param key         键
     * @param value       值
     * @param cacheLoader 回调函数
     * @return void
     * @throws Exception
     */
    public void set(String cacheName, String key, Object value, CacheLoader<String, Object> cacheLoader) throws Exception {
        cm.set(1, cacheName, key, value, cacheLoader);
    }

    /**
     * set(缓存数据--自动刷新)
     *
     * @param cacheName   缓存对象名称
     * @param duration    自动刷新时间间隔
     * @param unit        时间单位
     * @param key         键
     * @param value       值
     * @param cacheLoader 回调函数
     * @return void
     * @throws Exception
     */
    public void set(String cacheName, String key, Object value, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader) throws Exception {
        cm.setRefresh(1, cacheName, key, value, duration, unit, cacheLoader);
    }

    /**
     * get(通过key得到缓存)
     *
     * @param cacheName 缓存对象名称
     * @return Object
     * @throws Exception
     */
    public Object get(String cacheName, String key) throws Exception {
        return cm.get(1, cacheName, key);
    }

}
