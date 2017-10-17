package com.mpp.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by maopanpan on 2017/08/09.
 */
@Component
public class ScheduledTasks {
    private static final SimpleDateFormat format = new SimpleDateFormat("HH(hh):mm:ss S");
    @Scheduled(initialDelay = 8000, fixedRate = 5000)
    public void firstScheduledTasks(){
        System.out.println("定时任务执行，现在时间是 : "+format.format(new Date()));
    }
}
