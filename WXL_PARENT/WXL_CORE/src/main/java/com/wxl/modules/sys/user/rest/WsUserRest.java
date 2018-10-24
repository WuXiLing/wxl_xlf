package com.wxl.modules.sys.user.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wxl.common.rest.ResponseFormat;
import com.wxl.common.rest.RestReponseMsg;
import com.wxl.modules.sys.user.service.UserService;

/**
 * 用户RestController
 * 
 * @author liangxf
 *
 */
@Component
@Path("/ws/rest/user")
public class WsUserRest {

	@Autowired
	UserService userService;
	
	@GET
	@Path("{id}")
//	@Produces({MediaType.TEXT_PLAIN,MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
	@Produces("application/json;charset=UTF-8")
	public RestReponseMsg get(@PathParam("id") String id) {

		RestReponseMsg restReponseMsg = new RestReponseMsg();
		restReponseMsg.setReponseBody(userService.get(id));
//		restReponseMsg.setStatus(ResponseFormat.SUCCESS);
		return restReponseMsg;
	}
}
