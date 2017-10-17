package com.mpp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Created by maopanpan on 2017/08/09.
 */

@Configuration
@ComponentScan
@EnableAutoConfiguration(exclude = {MongoAutoConfiguration.class})
@SpringBootApplication
public class StartMppService {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(StartMppService.class);
        springApplication.setWebEnvironment(true);
        springApplication.run(args);
    }
}
