/**
 * @版本信息：
 * @日期：2015年5月6日
 * @Copyright ru Corporation 2015
 * @版权所有
 */
package com.mpp.cache.mycache.redis;

import com.mpp.cache.exception.CacheException;
import com.mpp.cache.mycache.CacheRedis;
import com.mpp.db.redis.RedisTemplate;
import com.mpp.serial.impl.FSTSerializableUtil;
import org.apache.commons.lang.StringUtils;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * @version 1.0
 * @类描述：reids cache
 * @创建人：maopanpan
 * @创建时间：2015年5月6日 下午2:29:46
 * @修改人：maopanpan
 * @修改时间：2015年5月6日 下午2:29:46
 * @修改备注：
 * @since jdk1.7
 */
public class RedisCache implements CacheRedis {
    private RedisTemplate redisTemplate;

    public RedisCache(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    /**
     * redis key-value value可以是对象和字符串
     */
    public Object get(String key) throws CacheException {
        try {
            return redisTemplate.get(key);
        } catch (Exception e) {
            throw new CacheException();
        }
    }

    /**
     * redis key-value value可以是对象和字符串
     */
    public void set(String key, Object value) throws CacheException {
        try {
            redisTemplate.set(key, value);
        } catch (Exception e) {
            throw new CacheException();
        }
    }

    public void set(String key, Object value, int liveSeconds) throws CacheException {
        try {
            redisTemplate.set(key, value, liveSeconds);
        } catch (Exception e) {
            throw new CacheException();
        }
    }

    public double hincrByFloat(String key, String field, double value) {
        return redisTemplate.hincrByFloat(key, field, value);
    }

}
