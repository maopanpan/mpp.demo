package com.mpp.cache.mycache.ehcache;

import com.mpp.cache.exception.CacheException;
import com.mpp.cache.mycache.Cache;
import net.sf.ehcache.Element;

/**
 * 
 * @类描述：Ehcache缓存对象
 * @创建人：maopanpan
 * @创建时间：2015年5月7日 上午9:42:01
 * @修改人：maopanpan
 * @修改时间：2015年5月7日 上午9:42:01
 * @修改备注：
 * @since  jdk1.7
 * @version 1.0
 */
public class Ehcache implements Cache {
	private net.sf.ehcache.Cache ecache;
	
	public Ehcache(net.sf.ehcache.Cache ecache) throws CacheException {
		this.ecache = ecache;
		if(ecache == null)
			throw new CacheException("Ehcache Cache object is null");
	}

	/** 
	 *
	 * @see Cache#get(String)
	 */
	public Object get(String key) throws Exception {
		Element element = ecache.get(key);
		Object value = null;
		if(element != null){
			value = element.getObjectValue();
		}
		return value;
	}

	/** 
	 *
	 * @see Cache#set(String, Object)
	 */
	public void set(String key, Object value) throws Exception {
		Element element = new Element(key, value);
		ecache.put(element);
	}

	/** 
	 *
	 * @see Cache#set(String, Object, int)
	 */
	public void set(String key, Object value, int liveSeconds) throws Exception {
		Element element = new Element(key, value, 0, liveSeconds);
		ecache.put(element);
	}

}
