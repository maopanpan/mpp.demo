package com.mpp.cache.cacheapi;


import com.mpp.cache.cachemanager.CacheManagerCommon;
import com.mpp.cache.domain.StatisticParams;
import com.mpp.cache.exception.CacheException;

/**
 * @author maopanpan
 * @ClassName: ProloadCacheApi
 * @Description: 数据预加载 接口
 * @date 2015年5月18日 下午5:51:32
 */

public class PreMemoryCacheApi {
    private CacheManagerCommon cmc = new CacheManagerCommon();
    private String configPath = "dtcache/dtcache.properties";
    private String cacheLv = "cache.L1.ehcache";

    public PreMemoryCacheApi() {
        try {
            cmc.initCacheProviderLV1(configPath, cacheLv);
        } catch (CacheException e) {
            e.printStackTrace();
        }
    }


    /**
     * set(两级缓存  1级：ehcache)
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
        return result;
    }
}
