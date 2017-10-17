/**
 *
 * @版本信息：
 * @日期：2015年5月5日
 * @Copyright ru Corporation 2015 
 * @版权所有
 *
 */
package com.mpp.cache.mycache.guava;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.mpp.cache.mycache.Cache;
import com.mpp.cache.mycache.GuavaCacheProvider;

/**
 * 
 * @类描述：guava 缓存提供器
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午4:12:10
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午4:12:10
 * @修改备注：
 * @since jdk1.7
 * @version 1.0
 */
public class GuavaProvider implements GuavaCacheProvider {

	// 所有guava缓存对象集合
	private ConcurrentHashMap<String, GuavaCache> cacheManagerMap = new ConcurrentHashMap<String, GuavaCache>();

	/**
	 * 
	 * getCache(得到缓存对象)
	 * @param cacheName 缓存名称
	 * @param cacheLoader key不存在时的回调函数
	 * @return GuavaCache
	 */
	public GuavaCache getCache(String cacheName,  CacheLoader<String, Object> cacheLoader){
		if(cacheManagerMap.get(cacheName) == null){
			synchronized (cacheManagerMap) {
				if(cacheManagerMap.get(cacheName) == null){
					GuavaCache cache = new GuavaCache();
					cache.setCache(newBuilder(cacheLoader));
					cacheManagerMap.put(cacheName, cache);
				}
			}
		}
		return cacheManagerMap.get(cacheName);
	}
	
	/**
	 * 
	 * getCache(得到缓存对象-- 定时刷新)
	 * @param cacheName 缓存名称
	 * @param duration 刷新时间间隔
	 * @param unit 时间单位
	 * @param cacheLoader key不存在时的回调函数
	 * @return GuavaCache
	 */
	public GuavaCache getCache(String cacheName, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader){
		if(cacheManagerMap.get(cacheName) == null){
			synchronized (cacheManagerMap) {
				if(cacheManagerMap.get(cacheName) == null){
					GuavaCache cache = new GuavaCache();
					cache.setCache(newBuilder(duration, unit, cacheLoader));
					cacheManagerMap.put(cacheName, cache);
				}
			}
		}
		return cacheManagerMap.get(cacheName);
	}
	
	/**
	 * 定时刷新
	 */
	public GuavaCache getCache(String cacheName, long size, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader){
		if(cacheManagerMap.get(cacheName) == null){
			synchronized (cacheManagerMap) {
				if(cacheManagerMap.get(cacheName) == null){
					GuavaCache cache = new GuavaCache();
					cache.setCache(newBuilder(size, duration, unit, cacheLoader));
					cacheManagerMap.put(cacheName, cache);
				}
			}
		}
		return cacheManagerMap.get(cacheName);
	}

	/**
	 * 
	 * newBuilder( 创建guava缓存)
	 * 
	 * @param cacheLoader
	 * @return LoadingCache<Object,Object>
	 */
	public LoadingCache<String, Object> newBuilder(CacheLoader<String, Object> cacheLoader) {
		return CacheBuilder.newBuilder().build(cacheLoader);
	}

	/**
	 * 
	 * newBuilder()
	 * @param duration 刷新时间间隔
	 * @param unit 时间单位
	 * @param cacheLoader
	 * @return LoadingCache<Object,Object>
	 */
	public LoadingCache<String, Object> newBuilder(long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader) {
		return CacheBuilder.newBuilder().refreshAfterWrite(duration, unit).build(cacheLoader);
	}
	
	/**
	 * 
	 * newBuilder()
	 * @param size 集合最大元素数量
	 * @param duration 时间间隔
	 * @param unit 时间单位
	 * @param cacheLoader
	 * @return LoadingCache<Object,Object>
	 */
	public LoadingCache<String, Object> newBuilder(long size, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader) {
		return CacheBuilder.newBuilder().maximumSize(size).refreshAfterWrite(duration, unit).build(cacheLoader);
	}

	public ConcurrentHashMap<String, GuavaCache> getCacheManagerMap() {
		return cacheManagerMap;
	}

	/*
	  * <p>Title: getCache</p>
	  * <p>Description: </p>
	  * @param cacheName
	  * @return
	  * @throws Exception
	  * @see CacheProvider#getCache(java.lang.String)
	  */
	public Cache getCache(String cacheName) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

}
