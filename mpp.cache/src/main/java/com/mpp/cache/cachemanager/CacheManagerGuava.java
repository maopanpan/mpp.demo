package com.mpp.cache.cachemanager;

import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import com.mpp.cache.exception.CacheException;
import com.mpp.cache.mycache.Cache;
import com.mpp.cache.mycache.GuavaCacheProvider;
import com.mpp.cache.mycache.guava.GuavaProvider;
import org.apache.commons.lang.StringUtils;

import com.google.common.cache.CacheLoader;
/**
 * 
 * @类描述：guava一级缓存管理器
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午2:58:35
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午2:58:35
 * @修改备注：
 * @since jdk1.7
 * @version 1.0
 */
public class CacheManagerGuava {
	// 缓存等级
	public int LV1 = 1;

	// 一级和二级缓存提供器
	public GuavaCacheProvider lv1Provider = null;

	/**
	 * 
	 * initCacheProvider(初始化缓存提供器)
	 * 
	 * @throws CacheException
	 * @return void
	 */
	public void initCacheProviderLV1(String configPath) throws CacheException {
		try {
			InputStream in = CacheManagerGuava.class.getClassLoader().getResourceAsStream(configPath);
			Properties pro = new Properties();
			pro.load(in);
			in.close();
			lv1Provider = getProviderByProperties(pro, "cache.L1.guava");
		} catch (Exception e) {
			throw new CacheException("初始化提供器异常, 错误信息", e);
		}
	}

	/**
	 * 
	 * set(缓存数据)
	 * 
	 * @return void
	 * @throws Exception 
	 */
	public void set(int cacheLV, String cacheName, String key, Object value, CacheLoader<String, Object> cacheLoader) throws Exception {
		Cache cache = buildCache4Set(cacheLV, cacheName, cacheLoader);
		cache.set(key, value);
	}

	/**
	 * 
	 * setRefresh(定时刷新缓存)
	 *
	 * @return void
	 * @throws Exception 
	 */
	public void setRefresh(int cacheLV, String cacheName, String key, Object value, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader) throws Exception {
		Cache cache = buildCacheRefresh4Set(cacheLV, cacheName, duration, unit, cacheLoader);
		cache.set(key, value);
	}

	/**
	 * 
	 * get(通过key得到缓存)
	 *
	 * @throws ExecutionException
	 * @return Object
	 */
	public Object get(int cacheLV, String cacheName, String key) throws Exception {
		Cache cache = buildCache4Get(cacheLV, cacheName);
		return cache.get(key);
	}

	/**
	 *
	 * buildCache4Set(得到具体cache对象)
	 *
	 * @return Cache
	 */
	public Cache buildCache4Set(int cacheLV, String cacheName, CacheLoader<String, Object> cacheLoader) {
		Cache cache = null;
		if (cacheLV == 1) {
			cache = lv1Provider.getCache(cacheName, cacheLoader);
		} 
		return cache;
	}

	/**
	 * 
	 * buildCacheRefresh4Set(得到具体cache对象-定时刷新)
	 *
	 * @return Cache
	 */
	public Cache buildCacheRefresh4Set(int cacheLV, String cacheName, long duration, TimeUnit unit, CacheLoader<String, Object> cacheLoader) {
		Cache cache = null;
		if (cacheLV == 1) {
			cache = lv1Provider.getCache(cacheName, duration, unit, cacheLoader);
		} 
		return cache;
	}

	public Cache buildCache4Get(int cacheLV, String cacheName) {
		Cache cache = null;
		if (cacheLV == 1) {
			cache = lv1Provider.getCacheManagerMap().get(cacheName);
		} 
		return cache;
	}

	/**
	 * 
	 * getProviderByProperties(通过配置文件创建缓存提供器)
	 * 
	 * @param pro
	 * @param key
	 * @throws Exception
	 * @return CacheProvider
	 */
	public GuavaCacheProvider getProviderByProperties(Properties pro, String key) throws Exception {
		String value = pro.getProperty(key);
		if ("guava".equals(value)) {
			return new GuavaProvider();
		} else if (StringUtils.isEmpty(value)) {
			throw new CacheException(MessageFormat.format("dtcache.properties{1}没有指定缓存类型", key));
		}
		return (GuavaCacheProvider) Class.forName(value).newInstance();
	}
}
