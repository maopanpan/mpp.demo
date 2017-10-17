/**
 *
 * @版本信息：
 * @日期：2015年5月6日
 * @Copyright ru Corporation 2015 
 * @版权所有
 *
 */
package com.mpp.cache.mycache;

import com.mpp.cache.exception.CacheException;

/**
 * 
 * @类描述：
 * @创建人：maopanpan
 * @创建时间：2015年5月6日 下午5:36:50
 * @修改人：maopanpan
 * @修改时间：2015年5月6日 下午5:36:50
 * @修改备注：
 * @since  jdk1.7
 * @version 1.0
 */
public interface CacheRedis extends Cache{

	/**
	 * 
	 * hincrByFloat(redis hash 加操作)
	 * @param key hash key
	 * @param field hash 字段
	 * @param value hash 字段值
	 * @throws CacheException
	 * @return void
	 */
	double hincrByFloat(String key, String field, double value) throws CacheException;
	
}
