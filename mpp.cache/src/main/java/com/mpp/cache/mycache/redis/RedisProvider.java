package com.mpp.cache.mycache.redis;

import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import com.mpp.cache.mycache.Cache;
import com.mpp.cache.mycache.CacheProvider;
import com.mpp.db.redis.RedisTemplate;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisProvider implements CacheProvider {

    //redis模板
    private RedisTemplate redisTemplate;
    // propertites对象
    private Properties props;

    // cache对象集合
    private ConcurrentHashMap<String, Cache> cacheManagerMap = new ConcurrentHashMap<String, Cache>();

    public RedisProvider(Properties pro) {
        this.props = pro;
        initCache();
    }

    /**
     * 初始化redis 连接池（重对象只需初始化一次）
     *
     * @see CacheProvider#()
     */
    public void initCache() {
        if (redisTemplate == null) {
            synchronized (redisTemplate) {
                if (redisTemplate == null) {
                    getRedisTemplate();
                }
            }
        }
    }

    /**
     * 获取缓存对象
     *
     * @see CacheProvider#getCache(String)
     */
    public Cache getCache(String cacheName) {
        Cache cache = cacheManagerMap.get(cacheName);
        if (cache == null) {
            synchronized (cacheManagerMap) {
                if (cache == null) {
                    cache = new RedisCache(redisTemplate);
                    cacheManagerMap.put(cacheName, cache);
                }
            }
        }
        return cache;
    }


    /**
     * redisPool(创建redis连接池)
     *
     * @return void
     */
    public void getRedisTemplate() {
//		JedisPoolConfig config = new JedisPoolConfig();
        String host = getProperty(props, "redis.host", "192.168.1.55");
        String password = props.getProperty("redis.password", null);
        int port = getProperty(props, "redis.port", 6379);
        //int timeout = getProperty(props, "redis.timeout", 2000);
        int database = getProperty(props, "redis.database", 0);
//		pool = new JedisPool(config, host, port, timeout, password, database);
        redisTemplate = new RedisTemplate(host, password, port, database);

    }

    private static String getProperty(Properties props, String key, String defaultValue) {
        return props.getProperty(key, defaultValue).trim();
    }

    private static int getProperty(Properties props, String key, int defaultValue) {
        try {
            return Integer.parseInt(props.getProperty(key, String.valueOf(defaultValue)).trim());
        } catch (Exception e) {
            return defaultValue;
        }
    }

}
