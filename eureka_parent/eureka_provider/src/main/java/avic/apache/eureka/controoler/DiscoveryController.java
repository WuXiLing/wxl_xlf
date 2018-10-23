package avic.apache.eureka.controoler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import avic.apache.eureka.provider.ListService;
import avic.apache.eureka.provider.ObjectService;
import avic.apache.eureka.provider.StringService;

@RestController
public class DiscoveryController {

	/*@Autowired
	private DiscoveryClient discoveryClient;

	@Autowired
	private RestTemplate restTemplat;*/

	@Autowired
	ListService listService;
	
	@Autowired
	ObjectService objectService;
	
	@Autowired
	StringService stringService;
	
	@Value("${server.port}")
	private String ip;

	@GetMapping(value="/getString", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Object getString() {
		//String services = "Services: " + discoveryClient.getServices() + " ip :" + ip;
		return stringService.getMsg("");
	}

	@GetMapping(value="/getObject", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Object getObject() {
		return objectService.getMsg("");
	}

	@GetMapping(value="/getList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Object getList() {
		return listService.getMsg("");
	}

}
