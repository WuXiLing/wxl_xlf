package avic.apache.eureka.consumer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.netflix.ribbon.proxy.annotation.Hystrix;

import avic.apache.eureka.common.User;

@RestController
public class CustomerController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private DiscoveryClient discoveryClient;

	@Autowired
	private RestTemplate restTemplat;

	@Value("${server.port}")
	private String ip;

	@RequestMapping(value = "/getString", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@Hystrix
	public Map<String, Object> getString() {
		Map<String, Object> map = new HashMap<String, Object>();
		long start2 = System.currentTimeMillis();
		LOGGER.info("开始 请求：" + start2);
		map.put("data", restTemplat.getForObject("http://eureka-provider/getString", String.class));
		long end2 = System.currentTimeMillis();
		LOGGER.info("结束 请求：" + end2);
		LOGGER.info("http://eureka-provider/getString操作,耗时：" + (end2 - start2) + "ms");
		map.put("service", "Services: " + discoveryClient.getServices() + " ip :" + ip);
		return map;
	}

	@RequestMapping(value = "/getObject", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@Hystrix
	public Map<String, Object> getObject() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", restTemplat.getForObject("http://eureka-provider/getObject", User.class));
		map.put("service", "Services: " + discoveryClient.getServices() + " ip :" + ip);
		return map;
		// return user;
	}

	@RequestMapping(value = "/getList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@Hystrix
	public Map<String, Object> getList() {

//		restTemplat.
		ResponseEntity<List<User>> responseEntity = restTemplat.exchange("http://eureka-provider/getList",
				HttpMethod.GET, null, new ParameterizedTypeReference<List<User>>() {
				});
		// return responseEntity.getBody();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", responseEntity.getBody());
		map.put("service", "Services: " + discoveryClient.getServices() + " ip :" + ip);
		return map;
	}
}
