package com.mpp.cache.cachemanager;

import com.mpp.cache.mycache.Cache;
import com.mpp.cache.mycache.CacheProvider;
import net.sf.ehcache.CacheException;

/**
 * @version 1.0
 * @类描述：获取cache对象
 * @创建人：maopanpan
 * @创建时间：2015年5月7日 下午3:22:30
 * @修改人：maopanpan
 * @修改时间：2015年5月7日 下午3:22:30
 * @修改备注：
 * @since jdk1.7
 */
public class BuildCache {

    /**
     * buildCacheSet(set方法获取cache对象)
     *
     * @param cacheLV   cache等级
     * @param cacheName cache名称
     * @param providers cache提供者
     * @return Cache
     * @throws Exception
     */
    public Cache buildCacheSet(int cacheLV, String cacheName, CacheProvider... providers) throws Exception {
        Cache cache = null;
        if (providers == null || providers.length == 0)
            throw new CacheException("缓存提供者个数为NULL或者个数不为2");
        if (cacheLV == 1 && providers[1 - 1] != null) {
            cache = providers[1 - 1].getCache(cacheName);
        } else if (cacheLV == 2 && providers[2 - 1] != null) {
            cache = providers[2 - 1].getCache(cacheName);
        }
        return cache;
    }

    /**
     * buildCacheGet(get方法获取cache对象)
     *
     * @param cacheLV   cache等级
     * @param cacheName cache名称
     * @param providers cache提供者
     * @return Cache
     * @throws Exception
     */
    public Cache buildCacheGet(int cacheLV, String cacheName, CacheProvider... providers) throws Exception {
        Cache cache = null;
        if (cacheLV == 1) {
            cache = providers[1 - 1].getCache(cacheName);
        } else if (cacheLV == 2) {
            cache = providers[2 - 1].getCache(cacheName);
        }
        return cache;
    }
}
