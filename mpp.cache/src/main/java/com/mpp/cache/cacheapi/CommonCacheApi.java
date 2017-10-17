package com.mpp.cache.cacheapi;


import com.mpp.cache.cachemanager.CacheManagerCommon;
import com.mpp.cache.domain.StatisticParams;
import com.mpp.cache.exception.CacheException;

/**
 * @version 1.0
 * @类描述：两级缓存 1级：ehcache 2级：redis
 * @创建人：maopanpan
 * @创建时间：2015年5月6日 下午7:15:19
 * @修改人：maopanpan
 * @修改时间：2015年5月6日 下午7:15:19
 * @修改备注：
 * @since jdk1.7
 */
public class CommonCacheApi {
    private CacheManagerCommon cmc = new CacheManagerCommon();
    private String configPath = "dtcache/dtcache.properties";
    private String cacheLv1 = "cache.L1.ehcache";
    private String cacheLv2 = "cache.L2.redis";

    public CommonCacheApi() {
        try {
            cmc.initCacheProviderLV12(configPath, cacheLv1, cacheLv2);
        } catch (CacheException e) {
            e.printStackTrace();
        }
    }

    /**
     * set(两级缓存  1级：ehcache 2级：redis)
     *
     * @param cacheName cache对象名称
     * @param key       键
     * @param value     值
     * @return void
     * @throws Exception
     */
    public void set(String cacheName, String key, Object value) throws Exception {
        //一级缓存
        cmc.set(StatisticParams.LV1, cacheName, key, value);
        //二级缓存
        cmc.set(StatisticParams.LV2, cacheName, key, value);
    }

    /**
     * set(有时效的二级缓存)
     *
     * @param cacheName   cache对象名称
     * @param key
     * @param value
     * @param liveSeconds
     * @return void
     * @throws Exception
     */
    public void set(String cacheName, String key, Object value, int liveSeconds) throws Exception {
        //一级缓存
        cmc.set(StatisticParams.LV1, cacheName, key, value, liveSeconds);
        //二级缓存
        cmc.set(StatisticParams.LV2, cacheName, key, value, liveSeconds);
    }

    /**
     * get(取数据)
     *
     * @param cacheName cache对象名称
     * @param key
     * @return Object
     * @throws Exception
     */
    public Object get(String cacheName, String key) throws Exception {
        //一级缓存取数据
        Object result = cmc.get(StatisticParams.LV1, cacheName, key);
        System.out.println("一级result=" + result);
        if (result == null) {
            //二级缓存取数据
            result = cmc.get(StatisticParams.LV2, cacheName, key);
            if (result != null) {
                //数据插入一级缓存
                cmc.set(StatisticParams.LV1, cacheName, key, result);
            }
            System.out.println("二级result=" + result);
        }
        return result;
    }

    /**
     * get(取数据--定时缓存)
     *
     * @param cacheName   缓存名称
     * @param key         键
     * @param liveSeconds
     * @return Object
     * @throws Exception
     */
    public Object get(String cacheName, String key, int liveSeconds) throws Exception {
        //一级缓存取数据
        Object result = cmc.get(StatisticParams.LV1, cacheName, key);
        System.out.println("一级result=" + result);
        if (result == null) {
            //二级缓存取数据
            result = cmc.get(StatisticParams.LV2, cacheName, key);
            if (result != null) {
                //数据插入一级缓存
                cmc.set(StatisticParams.LV1, cacheName, key, result, liveSeconds);
            }
            System.out.println("二级result=" + result);
        }
        return result;
    }
}
