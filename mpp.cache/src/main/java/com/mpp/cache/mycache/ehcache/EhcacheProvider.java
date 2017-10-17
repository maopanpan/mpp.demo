/**
 *
 * @版本信息：
 * @日期：2015年5月7日
 * @Copyright ru Corporation 2015 
 * @版权所有
 *
 */
package com.mpp.cache.mycache.ehcache;

import java.io.InputStream;
import java.util.concurrent.ConcurrentHashMap;

import com.mpp.cache.exception.CacheException;
import com.mpp.cache.mycache.Cache;
import com.mpp.cache.mycache.CacheProvider;
import net.sf.ehcache.CacheManager;

/**
 * 
 * @类描述：ehcache 提供者
 * @创建人：nancr
 * @创建时间：2015年5月7日 上午9:31:31
 * @修改人：nancr
 * @修改时间：2015年5月7日 上午9:31:31
 * @修改备注：
 * @since jdk1.7
 * @version 1.0
 */
public class EhcacheProvider implements CacheProvider {
	// ehcache管理器
	private static CacheManager manager;

	// cache对象集合
	private ConcurrentHashMap<String, Cache> cacheManagerMap = new ConcurrentHashMap<String, Cache>();

	/**
	 * <p>
	 * Title:
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @throws Exception
	 */
	public EhcacheProvider() throws Exception {
		initCache();
	}

	/**
	 * 初始化echcache manager 重实例，只需初始化一次
	 * 
	 * @throws Exception
	 */
	public void initCache() throws Exception {
		InputStream configurationInputStream = EhcacheProvider.class.getClassLoader().getResourceAsStream("dtcache/ehcache.xml");
		if (configurationInputStream == null)
			throw new CacheException("Ehcache configfile not exist");
		if (manager == null) {
			if (manager == null) {
				manager = new CacheManager(configurationInputStream);
			}
		}
	}

	/**
	 *
	 * @throws CacheException
	 * @see CacheProvider#getCache(String)
	 */
	public Cache getCache(String cacheName) throws CacheException {
		if (manager == null)
			throw new CacheException("Ehcache CacheManager is null");
		Ehcache cache = (Ehcache) cacheManagerMap.get(cacheName);
		if (cache == null) {
			synchronized (cacheManagerMap) {
				if (cache == null) {
					net.sf.ehcache.Cache ecache = manager.getCache(cacheName);
					if (ecache == null) {
						manager.addCache(cacheName);
					}
					cache = new Ehcache(manager.getCache(cacheName));
					cacheManagerMap.put(cacheName, cache);
				}
			}
		}

		return cache;
	}


}
