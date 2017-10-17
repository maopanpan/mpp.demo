package com.mpp.cache.domain;

import java.util.concurrent.TimeUnit;

import com.google.common.cache.CacheLoader;

/**
 * @version 1.0
 * @类描述：缓存provider参数对象
 * @创建人：maopanpan
 * @创建时间：2015年5月6日 上午10:32:58
 * @修改人：maopanpan
 * @修改时间：2015年5月6日 上午10:32:58
 * @修改备注：
 * @since jdk1.7
 */
public class CacheParams {
    //缓存等级
    private int cacheLV;
    //缓存名称
    private String cacheName;
    //缓存中最大元素个数
    private long size;
    //kv刷新时间间隔
    private long duration;
    //时间单位
    private TimeUnit unit;
    //键
    private String key;
    //值
    private Object value;
    //guava回调（刷新）方法
    private CacheLoader<String, Object> cacheLoader;

    public int getCacheLV() {
        return cacheLV;
    }

    public void setCacheLV(int cacheLV) {
        this.cacheLV = cacheLV;
    }

    public String getCacheName() {
        return cacheName;
    }

    public void setCacheName(String cacheName) {
        this.cacheName = cacheName;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    public TimeUnit getUnit() {
        return unit;
    }

    public void setUnit(TimeUnit unit) {
        this.unit = unit;
    }

    public CacheLoader<String, Object> getCacheLoader() {
        return cacheLoader;
    }

    public void setCacheLoader(CacheLoader<String, Object> cacheLoader) {
        this.cacheLoader = cacheLoader;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }
}
