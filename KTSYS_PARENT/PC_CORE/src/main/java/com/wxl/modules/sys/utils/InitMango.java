package com.wxl.modules.sys.utils;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

@Component
public class InitMango {

	protected static final Log	logger	= LogFactory.getLog(InitMango.class);
	
	@PostConstruct  
    public void init() {  
		 logger.info("初始化信息");
	}
}
