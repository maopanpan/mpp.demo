package com.mpp.redis;

import com.mpp.serial.impl.FSTSerializableUtil;
import org.apache.commons.lang.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Pipeline;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 构建redis模板
 * <p>
 * Created by maopanpan on 2017/08/07.
 */
public class RedisTemplate {
    private String host;
    private String password;
    private int port;
    private int database;

    //redis连接池
    public JedisPool pool;

    public RedisTemplate(String host, String password, int port, int database) {
        this.host = host;
        this.password = password;
        this.port = port;
        this.database = database;
        RedisPool redisPool = new RedisPool(host, password, port, database);
        pool = RedisPool.getPool();
    }

    public RedisTemplate(String host, int port) {
        this.host = host;
        this.port = port;
        RedisPool redisPool = new RedisPool(host, port);
        pool = RedisPool.getPool();
    }


    public void set(String key, int liveTime, long value) {
        Jedis redis = pool.getResource();
        redis.setex(key, (int) liveTime, String.valueOf(value));
        redis.close();
    }

    public void incr(String key) {
        Jedis redis = pool.getResource();
        redis.incr(key);
        redis.close();
    }

    public String get(String key) {
        Jedis redis = pool.getResource();
        String value = redis.get(key);
        redis.close();
        return value;
    }
}
