package test;

import javax.xml.namespace.QName;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;

import com.wxl.modules.sys.user.webservice.UserWebService;

public class CxfTest {

	public static void main(String[] args) throws Exception {
		aa();
	}

	// 静态调用
	public static void bb() {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setServiceClass(UserWebService.class);
		factory.setAddress("http://localhost:8084/wxl/webservice/userWebService");
		UserWebService service = (UserWebService) factory.create();
		System.out.println(service.sayHello("1").toString());
	}

	// 动态调用
	public static void aa() throws Exception {
		System.out.println(routeServer("sayHello", "1"));
	}

	/**
	 * 
	 * 远程调用WebService
	 * 
	 * @param methodName
	 *            方法类型
	 * @param param
	 *            参数
	 * @return
	 * @throws Exception
	 */
	public static Object[] routeServer(String methodName, Object param) throws Exception {
		String url = "http://localhost:8084/wxl/webservice/userWebService?wsdl";
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		HTTPClientPolicy httpClientPolicy = new HTTPClientPolicy(); // 策略
		httpClientPolicy.setConnectionTimeout(36000); // 连接超时
		httpClientPolicy.setAllowChunking(false);
		httpClientPolicy.setReceiveTimeout(10000); // 接收超时
		Client client = dcf.createClient(url);
		HTTPConduit http = (HTTPConduit) client.getConduit();
		http.setClient(httpClientPolicy);
		QName qName = new QName("http://webservice.user.sys.modules.wxl.com/", methodName);
		return client.invoke(qName, param);

	}
}
