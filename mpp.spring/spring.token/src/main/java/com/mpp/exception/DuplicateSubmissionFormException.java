package com.mpp.exception;

/**
 * Created by maopanpan on 2017/08/09.
 */
public class DuplicateSubmissionFormException extends RuntimeException{
    public DuplicateSubmissionFormException() {
        super();
    }

    public DuplicateSubmissionFormException(String message) {
        super(message);
    }
}
