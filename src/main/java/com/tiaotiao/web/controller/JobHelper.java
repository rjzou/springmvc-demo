package com.tiaotiao.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
@Service
public class JobHelper {
    private static final Logger logger = LoggerFactory.getLogger(JobHelper.class);
           
//    @Value("${isJob}")//这个是我在配置文件里配的一个开关
    private String isJob;
           
    @Scheduled(cron = "0,5,10,15,20 * * * * *")//间隔的时间设置
    void test1(){
        if (isJob.equals("false")) {
            return;
        }
        logger.info("==============================启动任务Work1！");
    }
    @Scheduled(cron = "2 * * * *  ?")
    void test2(){
        if (isJob.equals("false")) {
            return;
        }
        logger.info("==============================临时任务Work2！");
    }
}
