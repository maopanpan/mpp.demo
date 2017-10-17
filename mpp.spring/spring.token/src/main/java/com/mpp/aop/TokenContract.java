package com.mpp.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.DuplicateFormatFlagsException;
import java.util.UUID;

/**
 * Created by maopanpan on 2017/08/09.
 */
@Aspect
@Configuration
public class TokenContract {

    private Logger log = LoggerFactory.getLogger(TokenContract.class);

    @Before("within(@org.springframework.web.bind.annotation.RestController *) && @annotation(token)")
    public void handlerToken(final JoinPoint joinPoint, Token token) {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();

        boolean save = token.save();
        if (save) {
            String uuid = UUID.randomUUID().toString();
            request.getSession().setAttribute("token", uuid);
            log.info("进入表单页面，Token值为：" + uuid);
        }

        boolean remove = token.remove();
        if (remove) {
            if (isRepeatSubmit(request)) {
                log.info("表单重复提交");
                throw new DuplicateFormatFlagsException("表单重复提交");
            }
        }
    }

    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession(false).getAttribute("token");
        boolean isFlag = false;
        if (serverToken == null) {
            isFlag = true;
        }
        String clinetToken = request.getParameter("token");
        if (clinetToken == null || clinetToken.equals("")) {
            isFlag = true;
        }
        if (!serverToken.equals(clinetToken)) {
            isFlag = true;
        }
        request.getSession(false).removeAttribute("token");
        //log.info("校验是否重复提交：表单页面Token值为：" + clinetToken + ",Session中的Token值为:" + serverToken);
        return isFlag;
    }
}
