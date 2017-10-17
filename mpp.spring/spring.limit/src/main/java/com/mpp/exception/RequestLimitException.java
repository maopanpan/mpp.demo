package com.mpp.exception;

/**
 * Created by maopanpan on 2017/08/09.
 */
public class RequestLimitException extends RuntimeException {
    public RequestLimitException() {
        super();
    }

    public RequestLimitException(String message) {
        super(message);
    }
}
