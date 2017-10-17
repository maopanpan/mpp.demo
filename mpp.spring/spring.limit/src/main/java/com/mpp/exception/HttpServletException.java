package com.mpp.exception;

/**
 * Created by maopanpan on 2017/08/09.
 */
public class HttpServletException extends RuntimeException {

    public HttpServletException(String message) {
        super(message);
    }

    public HttpServletException(String message, Throwable cause) {
        super(message, cause);
    }
}
