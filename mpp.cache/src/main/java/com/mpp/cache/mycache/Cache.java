/**
 * @版本信息：
 * @日期：2015年5月5日
 * @Copyright ru Corporation 2015
 * @版权所有
 */
package com.mpp.cache.mycache;

import java.util.concurrent.ExecutionException;

/**
 * @version 1.0
 * @类描述：
 * @创建人：maopanpan
 * @创建时间：2015年5月5日 下午1:53:15
 * @修改人：maopanpan
 * @修改时间：2015年5月5日 下午1:53:15
 * @修改备注：
 * @since jdk1.7
 */
public interface Cache {

    /**
     * get(取value)
     *
     * @param key
     * @return Object
     * @throws ExecutionException
     */
    Object get(String key) throws Exception;

    /**
     * set(设置键值)
     *
     * @param key
     * @param value
     * @return void
     * @throws Exception
     */
    void set(String key, Object value) throws Exception;

    /**
     * set(设置定时键值)
     *
     * @param key
     * @param value
     * @param liveSeconds kv存活时间
     * @return void
     * @throws Exception
     */
    void set(String key, Object value, int liveSeconds) throws Exception;

}
