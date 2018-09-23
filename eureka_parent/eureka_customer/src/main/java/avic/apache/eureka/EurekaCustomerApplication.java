package avic.apache.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
//@EnableAutoConfiguration
@EnableDiscoveryClient
//@EnableCircuitBreaker
public class EurekaCustomerApplication {

	@Bean
    @LoadBalanced  //@LoadBalanced实现负载均衡
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
	
	public static void main(String[] args) {
		SpringApplication.run(EurekaCustomerApplication.class, args);
	}
}
