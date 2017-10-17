package com.mpp.aop;

import com.mpp.aonnotation.RequestLimit;
import com.mpp.exception.HttpServletException;
import com.mpp.exception.RequestLimitException;
import com.mpp.redis.RedisTemplate;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by maopanpan on 2017/08/09.
 *
 */
@Aspect
@Component
public class RequestLimitContract {


    private Logger log = LoggerFactory.getLogger(RequestLimitContract.class);
    static RedisTemplate redisTemplate = null;


    static {
        redisTemplate = new RedisTemplate("127.0.0.1", "", 6379, 6);
    }


    @Before("within(@org.springframework.web.bind.annotation.RestController *) && @annotation(limit)")
    public void requestLimit(final JoinPoint joinPoint, RequestLimit limit) {
        log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        try {
            RequestAttributes ra = RequestContextHolder.getRequestAttributes();
            ServletRequestAttributes sra = (ServletRequestAttributes) ra;
            HttpServletRequest request = sra.getRequest();

            String ip = request.getLocalAddr();
            String url = request.getRequestURI().toString();
            final String key = "req_limit_".concat(url).concat("_").concat(ip);
            String value = redisTemplate.get(key);
            if (value != null) {
                int count = Integer.parseInt(value);
                if (count > limit.count()) {
                    log.info("系统繁忙请稍后……");
                    throw new RequestLimitException("系统繁忙请稍后……");
                }
            }
            if (value == null || Integer.valueOf(value) == 0) {
                redisTemplate.set(key, limit.time(), 1);
            } else {
                redisTemplate.incr(key);
            }


        } catch (RequestLimitException e) {
            e.printStackTrace();
            throw new RequestLimitException("系统繁忙请稍后……");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
