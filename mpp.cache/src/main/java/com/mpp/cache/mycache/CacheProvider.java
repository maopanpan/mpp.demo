/**
 * @版本信息：
 * @日期：2015年5月5日
 * @Copyright ru Corporation 2015
 * @版权所有
 */
package com.mpp.cache.mycache;

/**
 * @version 1.0
 * @类描述：
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午1:51:58
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午1:51:58
 * @修改备注：
 * @since jdk1.7
 */
public interface CacheProvider {


    /**
     * getCache(获取cache对象)
     *
     * @param cacheName cache名称
     * @return void
     */
    Cache getCache(String cacheName) throws Exception;

}
