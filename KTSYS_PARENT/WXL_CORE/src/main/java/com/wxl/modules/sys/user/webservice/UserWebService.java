package com.wxl.modules.sys.user.webservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import com.wxl.modules.sys.user.presistence.entity.User;

@WebService
public interface UserWebService {
	
	@WebMethod
	public User sayHello(@WebParam(name="id") String id);
}
