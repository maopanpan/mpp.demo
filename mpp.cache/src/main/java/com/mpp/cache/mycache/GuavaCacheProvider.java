package com.mpp.cache.mycache;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import com.google.common.cache.CacheLoader;
import com.mpp.cache.mycache.guava.GuavaCache;

/**
 * 
 * @类描述：
 * @创建人：maopanpan
 * @创建时间：2015年5月6日 下午3:17:01
 * @修改人：maopanpan
 * @修改时间：2015年5月6日 下午3:17:01
 * @修改备注：
 * @since  jdk1.7
 * @version 1.0
 */
public interface GuavaCacheProvider extends CacheProvider {
	/**
	 * 
	 * getCache(得到缓存对象)
	 * @param cacheName 缓存名称
	 * @param cacheLoader key不存在时的回调函数
	 * @return GuavaCache
	 */
	GuavaCache getCache(String cacheName, CacheLoader<String, Object> cacheLoader);
	
	/**
	 * 
	 * getCache(得到缓存对象-- 定时刷新)
	 * @param cacheName 缓存名称
	 * @param duration 刷新时间间隔
	 * @param unit 时间单位
	 * @param cacheLoader key不存在时的回调函数
	 * @return GuavaCache
	 */
	GuavaCache getCache(String cacheName, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader);
	
	/**
	 * 
	 * getCache(得到缓存对象--限制缓存最大元素数量--定时刷新)
	 * @param cacheName
	 * @param size
	 * @param duration
	 * @param unit
	 * @param cacheLoader
	 * @return
	 * @return GuavaCache
	 */
	GuavaCache getCache(String cacheName, long size, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader);
	
	/**
	 * 
	 * getCacheManagerMap(缓存对象集合)
	 * @return
	 * @return ConcurrentHashMap<String,GuavaCache>
	 */
	ConcurrentHashMap<String, GuavaCache> getCacheManagerMap();
}
