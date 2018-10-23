package com.wxl.modules.sys.user.rest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

/**
 * 用户RestController
 * 
 * @author liangxf
 *
 */
@RestController
@RequestMapping(value = "/rest/user")
@Api(value = "用户管理")
public class RestUserController {

	@RequestMapping(value="{id}",method = RequestMethod.GET)
	public String get(@PathVariable("id") String id) {

		return id;
	}
}
