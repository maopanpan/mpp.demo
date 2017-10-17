package com.mpp;

import com.sun.tools.javadoc.Start;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Created by maopanpan on 2017/08/08.
 * 该样例提供EHCache本地缓存解决方案
 * 开启Cache有两种方法
 * 1、注解@EnableCaching
 * 2、spring配置<cache:annotation-driven />
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration(exclude = {MongoAutoConfiguration.class})
@SpringBootApplication
//@EnableCaching
@ServletComponentScan
public class StartMppService {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(StartMppService.class);
        springApplication.setWebEnvironment(true);
        springApplication.run(args);
    }
}
