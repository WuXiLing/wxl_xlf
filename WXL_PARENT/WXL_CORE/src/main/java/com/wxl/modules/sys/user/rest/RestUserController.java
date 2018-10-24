package com.wxl.modules.sys.user.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.user.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

/**
 * 用户RestController
 * 
 * @author liangxf
 *
 */
@RestController
@RequestMapping(value = "/rest/user")
@Api(value = "user", description = "用户管理API")
public class RestUserController {

	@Autowired
	UserService userService;

	@ApiOperation("查询用户信息")
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public User get(@PathVariable("id") String id) {
		userService.get(id).getBirthday();
		return userService.get(id);
	}

	@ApiOperation("新增用户信息")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public int add(@RequestBody @ApiParam(name = "用户对象", value = "传入json格式", required = true) User user) {
		userService.update(user);
		return 1;
	}

	@ApiOperation("更改用户信息")
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	@ApiImplicitParams({@ApiImplicitParam(name = "id", value = "用户ID", dataType = "string", paramType = "query", example = "1")})
	public int updateUserInfo(@ApiParam(value = "更新用户必须的 ID", required = true) @PathVariable("id") String id, @RequestBody @ApiParam(name = "用户对象", value = "传入json格式", required = true) User user) {
		user.setId(id);
		userService.update(user);
		return 1;
	}

	@ApiOperation("删除用户信息")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public Map<String, Object> delete(@ApiParam(value = "删除用户必须的 ID", required = true) @PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		userService.delete(id);
		map.put("msg", "ok");
		return map;
	}

	@RequestMapping(value = "map", method = RequestMethod.POST)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "内部错误")})
	@ApiJsonObject(name = "user", value = {@ApiJsonProperty(key = "mobile", example = "18614242538", description = "user mobile"),
			@ApiJsonProperty(key = "nation", example = "123456", description = "user password")})
	public Map<String, Object> postAddMap(@RequestBody Map<String, String> params) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isLook", true);
		return map;
	}
}
