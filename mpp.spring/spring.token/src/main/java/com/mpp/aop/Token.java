package com.mpp.aop;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Token {
    /**
     * 用于标识表单页面
     * @return
     */
    boolean save() default false;

    /**
     * 用于标识提交接口
     * @return
     */
    boolean remove() default false;
}
