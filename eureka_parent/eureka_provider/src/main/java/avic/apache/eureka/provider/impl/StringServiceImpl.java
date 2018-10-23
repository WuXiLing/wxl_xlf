package avic.apache.eureka.provider.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import avic.apache.eureka.common.CommonRandomUtils;
import avic.apache.eureka.provider.StringService;

@Service()
public class StringServiceImpl implements StringService {

	private static final Logger LOGGER = LoggerFactory.getLogger(StringServiceImpl.class);

	public Object getMsg(Object msg) {
		LOGGER.info("开始生产字符串：" + System.currentTimeMillis());
		String x = CommonRandomUtils.getRandomString();
		LOGGER.info("开始生产字符串：" + System.currentTimeMillis());
		return x;
	}
}
