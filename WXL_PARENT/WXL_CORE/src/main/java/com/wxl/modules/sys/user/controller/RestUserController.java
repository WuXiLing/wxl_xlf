package com.wxl.modules.sys.user.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wxl.modules.sys.role.presistence.entity.Role;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 用户Controller
 * 
 * @author liangxf
 *
 */
@RestController
@RequestMapping(value = "${frontPath}/rest/user")
public class RestUserController {

	@RequestMapping(method = RequestMethod.GET)
	public List<Role> readRoles(Principal principal) {
		// this.validateUser(principal);

		UserUtils.getRoleList();
		// List<BookmarkResource> bookmarkResourceList = bookmarkRepository
		// .findByAccountUsername(principal.getName()).stream()
		// .map(BookmarkResource::new)
		// .collect(Collectors.toList());

		return new ArrayList<>(UserUtils.getRoleList());
	}
}
