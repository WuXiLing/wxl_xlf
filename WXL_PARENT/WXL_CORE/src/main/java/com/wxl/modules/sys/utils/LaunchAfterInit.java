package com.wxl.modules.sys.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * 启动后初始化
 * 
 * @author Liang
 *
 */
@Component  
public class LaunchAfterInit implements ApplicationListener<ContextRefreshedEvent> {

	protected static final Log	logger	= LogFactory.getLog(LaunchAfterInit.class);

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		 if (event.getApplicationContext().getParent() == null) {  
			 logger.info("初始化信息");
		 }
	}
}
