package avic.apache.eureka.provider.impl;

import org.springframework.stereotype.Service;

import avic.apache.eureka.common.CommonRandomUtils;
import avic.apache.eureka.provider.ObjectService;

@Service()
public class ObjectServiceImpl implements ObjectService{

	public Object getMsg(Object msg) {
		return CommonRandomUtils.getRandomObject();
	}
}
