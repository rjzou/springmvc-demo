package com.tiaotiao.web.controller;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.service.RoomTypeService;
@Service
public class JobController {
    private Logger logger = Logger.getLogger(RoomTypeService.class.getName());       
    @Value("false")//这个是我在配置文件里配的一个开关
    private String isJob;
           
    @Scheduled(cron = "0,5,10,15,20 * * * * *")//间隔的时间设置
    void test1(){
    	logger.log(Level.INFO, "start");
        if (isJob.equals("false")) {
            return;
        }
        logger.log(Level.INFO, "启动任务Work1！");
        logger.info("==============================启动任务Work1！");
    }
    @Scheduled(cron = "*/10 * * * * ?")
    void test2(){
    	logger.log(Level.INFO, "start2" + isJob);
        if (isJob.equals("false")) {
            return;
        }
        logger.log(Level.INFO, "临时任务Work2！");
        logger.info("==============================临时任务Work2！");
    }
    
}
