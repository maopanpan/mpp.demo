package com.mpp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Created by maopanpan on 2017/08/09.
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration(exclude = {MongoAutoConfiguration.class})
@EnableScheduling
@SpringBootApplication
public class StartMppService extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(StartMppService.class);
        springApplication.setWebEnvironment(true);
        springApplication.run(args);
    }
}
