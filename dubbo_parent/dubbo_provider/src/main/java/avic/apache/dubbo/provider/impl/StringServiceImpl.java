package avic.apache.dubbo.provider.impl;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;

import avic.apache.dubbo.common.CommonRandomUtils;
import avic.apache.dubbo.provider.StringService;

@Component("stringService")
@Service(version = "1.0", register = true)
public class StringServiceImpl implements StringService {

	public Object getMsg(Object msg) {
		return CommonRandomUtils.getRandomString();
	}
}
