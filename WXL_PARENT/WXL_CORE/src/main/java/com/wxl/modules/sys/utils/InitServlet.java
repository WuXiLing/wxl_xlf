package com.wxl.modules.sys.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

@Component  
public class InitServlet implements InitializingBean {

	protected static final Log	logger	= LogFactory.getLog(InitServlet.class);

	@Override
	public void afterPropertiesSet() throws Exception {
		 logger.info("初始化信息");
	}

}
