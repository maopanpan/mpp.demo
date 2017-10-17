package com.mpp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * Created by maopanpan on 2017/08/09.
 * 开始共享SESSION
 */
@Configuration
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 86400 * 60)
public class HttpSessionConfig {
}
