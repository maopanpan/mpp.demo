/**
 *
 * @版本信息：
 * @日期：2015年5月5日
 * @Copyright ru Corporation 2015 
 * @版权所有
 *
 */
package com.mpp.cache.mycache.guava;

import java.util.concurrent.ExecutionException;

import com.google.common.cache.LoadingCache;
import com.mpp.cache.mycache.Cache;

/**
 * 
 * @类描述：guava 缓存实例
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午4:48:38
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午4:48:38
 * @修改备注：
 * @since  jdk1.7
 * @version 1.0
 */
public class GuavaCache implements Cache {
	//guava缓存对象
	private LoadingCache<String, Object> cache;

	public LoadingCache<String, Object> getCache() {
		return cache;
	}

	public void setCache(LoadingCache<String, Object> cache) {
		this.cache = cache;
	}
	
	/**
	 * 
	 * get(取value)
	 * @param key
	 * @throws ExecutionException
	 * @return Object
	 */
	public Object get(String key) throws ExecutionException{
		return cache.get(key);
	}
	
	/**
	 * 
	 * set(设置键值)
	 * @param key
	 * @param value
	 * @return void
	 */
	public void set(String key, Object value){
		cache.put(key, value);
	}

	/** 
	 *
	 * @see Cache#set(String, Object, int)
	 */
	public void set(String key, Object value, int liveSeconds) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
