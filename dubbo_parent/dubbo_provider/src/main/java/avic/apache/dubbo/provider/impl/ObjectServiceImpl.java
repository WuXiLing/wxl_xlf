package avic.apache.dubbo.provider.impl;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;

import avic.apache.dubbo.common.CommonRandomUtils;
import avic.apache.dubbo.provider.ObjectService;

@Component("objectService")
@Service(version="1.0",register=true)
public class ObjectServiceImpl implements ObjectService{

	public Object getMsg(Object msg) {
		return CommonRandomUtils.getRandomObject();
	}
}
