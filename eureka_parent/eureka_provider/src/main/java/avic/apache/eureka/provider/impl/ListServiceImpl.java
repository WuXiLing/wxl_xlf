package avic.apache.eureka.provider.impl;

import org.springframework.stereotype.Service;

import avic.apache.eureka.common.CommonRandomUtils;
import avic.apache.eureka.provider.ListService;

@Service()
public class ListServiceImpl implements ListService {

	public Object getMsg(Object msg) {

		return CommonRandomUtils.getRandomList();
	}
}
