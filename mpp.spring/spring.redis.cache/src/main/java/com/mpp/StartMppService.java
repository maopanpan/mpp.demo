package com.mpp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * Created by maopanpan on 2017/08/08.
 * 该样例提供redis cacheManager(@Cacheable,@Cacheput,@CacheEvict)解决方案及共享session解决方案
 */

@Configuration
@ComponentScan
@EnableAutoConfiguration(exclude = {MongoAutoConfiguration.class})
@ImportResource({"springcontext/spring.xml"})
@SpringBootApplication
public class StartMppService {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(StartMppService.class);
        app.setWebEnvironment(true);
        app.run(args);
    }
}
