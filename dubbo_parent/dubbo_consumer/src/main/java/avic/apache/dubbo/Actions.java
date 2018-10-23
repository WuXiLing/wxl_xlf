package avic.apache.dubbo;

import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ImportResource;

import avic.apache.dubbo.common.CommonService;
import avic.apache.dubbo.provider.StringService;

//@SpringBootApplication
@ImportResource({ "classpath:dubbo-consumer.xml" })
public class Actions {

    //dubbo服务地址、版本号、服务名或者接口去dubbo服务管理页面取得，参考（8、查看启动的dubbo服务）
//    private  final String ID = "productor";

    //dubbo服务地址
//    private final String URL = "hessian://10.216.80.142:8083";

    //版本号
//    private final String VERSION = "1.0";

    //服务名或者接口名
//    private final String SERVICE_NAME = "avic.apache.dubbo.provider.StringService";   

    private CommonService commonService;

    public int init() throws Throwable {

		ConfigurableApplicationContext context = SpringApplication.run(DubboConsumerApplication.class);

		commonService = (StringService) context.getBean("stringService");
		
//        ApplicationConfig application = new ApplicationConfig();
//        application.setName("productor");
//        ReferenceConfig  reference = new ReferenceConfig(); 
//        reference.setApplication(application);
//        reference.setId(ID);
//        reference.setVersion(VERSION );
//        reference.setInterface(SERVICE_NAME);
//        reference.setUrl(URL);
//        object = reference.get(); // 
        return 0;
    }//end of init


    public int action() throws Throwable {
    	if(commonService == null) {
    		throw new NullPointerException("获取服务失败。");
    	}
    	long startMili, endMili;
    	startMili = System.currentTimeMillis();
        Object hello = commonService.getMsg("tom");
        endMili = System.currentTimeMillis();
        System.out.println(hello);
        System.out.println((endMili - startMili) + "ms");

        return 0;

    }


    public int end() throws Throwable {
        return 0;
    }//end of end
}
