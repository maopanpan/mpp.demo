package com.mpp.aonnotation;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface RequestLimit {

    /**
     * 允许访问次数，默认值为MAX_VALUE
     **/
    int count() default Integer.MAX_VALUE;

    /**
     * 时间段，单位毫秒，默认1分钟
     **/
    int time() default 60;
}
