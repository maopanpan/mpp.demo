package com.mpp.cache.exception;

/**
 * @version 1.0
 * @类描述：自定义异常
 * @创建人：maopanpan
 * @创建时间：2015年5月7日 下午3:22:30
 * @修改人：maopanpan
 * @修改时间：2015年5月7日 下午3:22:30
 * @修改备注：
 * @since jdk1.7
 */
public class CacheException extends Exception {

    public CacheException() {
        super();
    }

    public CacheException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

    public CacheException(String message, Throwable cause) {
        super(message, cause);
    }

    public CacheException(String message) {
        super(message);
    }

    public CacheException(Throwable cause) {
        super(cause);
    }
}
