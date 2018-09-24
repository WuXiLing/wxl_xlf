package avic.apache.dubbo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource({ "classpath:dubbo-consumer.xml" })
public class DubboConsumerApplication {
	
//	private static Logger logger = LoggerFactory.getLogger(DubboConsumerApplication.class);
	
	public static void main(String[] args) {
		
		SpringApplication.run(DubboConsumerApplication.class);

		/*
		 * String url = "http://localhost:8080/hessian"; HessianProxyFactory factory =
		 * new HessianProxyFactory(); factory.setOverloadEnabled(true); Basic basic =
		 * (Basic) factory.create(Basic.class, url);
		 * System.out.println(basic.sayHello("SW"));
		 */

//		System.out.println("test");
		/*CommonService stringService = (StringService) context.getBean("stringService");
		CommonService objectService = (ObjectService) context.getBean("objectService");
		CommonService listService = (ListService) context.getBean("listService"); 
		
		long startMili, endMili;
    	startMili = System.currentTimeMillis();
    	Object hello = stringService.getMsg(null);
		endMili = System.currentTimeMillis();
		logger.info("返回内容：" + hello.toString());
		logger.info("测试字符串(1M)耗时：" + (endMili - startMili) + "ms");
        
    	startMili = System.currentTimeMillis();
        hello = objectService.getMsg(null);
        endMili = System.currentTimeMillis();
        logger.info("返回内容：" + hello.toString());
        logger.info("测试对象耗时：" + (endMili - startMili) + "ms");
        
    	startMili = System.currentTimeMillis();
        hello = listService.getMsg(null);
        endMili = System.currentTimeMillis();
        logger.info("返回内容：" + hello.toString());
        logger.info("测试集合耗时：" + (endMili - startMili) + "ms");*/
		
		/*long startMili, endMili;
		int loop = 100;

		// 单个对象
		startMili = System.currentTimeMillis();
		for (int i = 0; i < loop; i++) {
			objectService.getMsg(CommonRandomUtils.getRandomObject());
		}
		endMili = System.currentTimeMillis();
		System.out.println("测试单个对象，平均耗时：" + (endMili - startMili) / (float) loop + "ms");

		// 对象集合
		startMili = System.currentTimeMillis();
		for (int i = 0; i < loop; i++) {
			listService.getMsg(CommonRandomUtils.getRandomList());
		}
		endMili = System.currentTimeMillis();
		System.out.println("测试集合对象，平均耗时：" + (endMili - startMili) / (float) loop + "ms");

		*//** 1K字符串 *//*
		String str1k = CommonRandomUtils.getRandomString();
		startMili = System.currentTimeMillis();
		for (int i = 0; i < loop; i++) {
			stringService.getMsg(str1k);
		}
		endMili = System.currentTimeMillis();
		System.out.println("测试字符串(1K)平均耗时：" + ((endMili - startMili) / (float) loop) + "毫秒");

		*//** 1M字符串 *//*
		String str2k = CommonRandomUtils.getRandomString();
		startMili = System.currentTimeMillis();
		for (int i = 0; i < loop; i++) {
			stringService.getMsg(str2k);
		}
		endMili = System.currentTimeMillis();
		System.out.println("测试字符串(1M)平均耗时：" + ((endMili - startMili) / (float) loop) + "毫秒");*/
	}
}
