package com.wxl.modules.sys.user.webservice.impl;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.BindingType;

import org.springframework.beans.factory.annotation.Autowired;

import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.service.UserService;
import com.wxl.modules.sys.user.webservice.UserWebService;

//@Component("userWebService")
//http://localhost:8084/wxl/webservice/userWebService?wsdl
@WebService(endpointInterface = "com.wxl.modules.sys.user.webservice.UserWebService", serviceName = "userWebService")
//@BindingType
public class UserWebServiceImpl implements UserWebService {

	@Autowired
	UserService userService;

	@WebMethod
	public User sayHello(@WebParam(name = "id") String id) {
		
		return userService.get(id);
	}
}
