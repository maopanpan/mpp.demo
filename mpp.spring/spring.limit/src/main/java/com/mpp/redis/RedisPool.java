package com.mpp.redis;

import org.apache.commons.lang.StringUtils;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 构建redis连接池
 * <p>
 * Created by maopanpan on 2017/08/07.
 */
public class RedisPool {
    private String host;
    private String password;
    private int port;
    private int database = 0;

    // redis 连接池
    private static JedisPool pool;

    public RedisPool(String host, String password, int port, int database) {
        this.host = host;
        this.password = password;
        this.port = port;
        this.database = database;
        redisPool();
    }

    public RedisPool(String host, int port) {
        this.host = host;
        this.port = port;
        redisPool();
    }


    /**
     * 初始化redis连接池
     */
    public void redisPool() {
        InputStream inputStream = null;
        try {
            JedisPoolConfig config = new JedisPoolConfig();

            inputStream = RedisPool.class.getClassLoader().getResourceAsStream("config/redis_database.properties");
            Properties props = new Properties();
            props.load(inputStream);

            if (StringUtils.isEmpty(host)) {
                host = getPropertyString(props, "redis.host");
            }
//            int port = getPropertyInt(props, "redis.port");
            if (database < 0 || database > 16) {
                int database = getPropertyInt(props, "redis.database");
            }

            int timeout = getPropertyInt(props, "redis.timeout");
            // 设置的逐出策略类名, 默认DefaultEvictionPolicy(当连接超过最大空闲时间,或连接数超过最大空闲连接数)
            config.setEvictionPolicyClassName("org.apache.commons.pool2.impl.DefaultEvictionPolicy");
            // 最大连接数, 默认8个
            config.setMaxTotal(10);
            // 最大空闲连接数, 默认8个
            config.setMaxIdle(getPropertyInt(props, "redis.maxIdle"));

            // 获取连接时的最大等待毫秒数(如果设置为阻塞时BlockWhenExhausted),如果超时就抛异常, 小于零:阻塞不确定的时间,
            // 默认-1
            config.setMaxWaitMillis(10000);
            // 逐出连接的最小空闲时间 默认1800000毫秒(30分钟), 设置成3分钟
            config.setMinEvictableIdleTimeMillis(180000);

            // 在获取连接的时候检查有效性, 默认false
            config.setTestOnBorrow(false);
            // 在空闲时检查有效性, 默认false
            config.setTestWhileIdle(true);
            // 逐出扫描的时间间隔(毫秒) 如果为负数,则不运行逐出线程, 默认-1，设置2分钟
            config.setTimeBetweenEvictionRunsMillis(10000);

            if (StringUtils.isEmpty(password)) {

                pool = new JedisPool(config, host, port, timeout);
            } else {

                pool = new JedisPool(config, host, port, timeout, password, database);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static String getPropertyString(Properties props, String key) {
        return props.getProperty(key).trim();
    }

    private static int getPropertyInt(Properties props, String key) {
        return Integer.parseInt(props.getProperty(key).trim());
    }

    public static JedisPool getPool() {
        return pool;
    }

}
